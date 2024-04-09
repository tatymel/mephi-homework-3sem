#include <sys/types.h>
#include <sys/wait.h>
#include <unistd.h>
#include <stdbool.h>
#include <sys/fcntl.h>
#include "tokenizer.h"

const size_t MAX_SIZE_PIPE = 10;

void TakeToken(struct Token* token,  char** dst) {
    *dst = (char *) malloc(token->len + 1);
    memcpy(*dst, token->start, token->len);
    (*dst)[token->len] = '\0';
}

void ArgFree(char **arguments, size_t token_count){
    if(arguments != NULL){
        for(int i = 0; i < token_count; ++i){
            if(arguments[i] != NULL)
                free(arguments[i]);
        }
        free(arguments);
    }
}

bool CheckRedirectedSign(int ind, struct Token* next_token){
    return (ind != -2 || next_token == NULL || (next_token != NULL && next_token->type != TT_WORD));
}

bool CheckRedirectedSignWithinPipes(int ind_fpipe, int ind_lpipe, int ind_sign){
    return (ind_fpipe < ind_sign && ind_sign < ind_lpipe && ind_lpipe != -1 && ind_fpipe != -1 && ind_sign != -1);
}

void Exec(struct Tokenizer* tokenizer) {
    if(tokenizer->token_count == 0)
        exit(0);

    char **arguments = (char**)malloc((tokenizer->token_count + 1) * sizeof(char*));
    char **arguments_for_exec = NULL;

    struct Token* cur_token = tokenizer->head;
    int ind_cur_token = 0;
    int ind_in = -2, ind_out = -2;
    int cnt_in = 0, cnt_out = 0, cnt_pipe = 0;

    int ind_pipes[MAX_SIZE_PIPE];
    size_t ind_cur_pipe = 1;
    for (int i = 0; i < MAX_SIZE_PIPE; ++i) {
        ind_pipes[i] = -1;
    }

    bool is_syntax_correct = true;

    while(cur_token){
        if(cur_token->type == TT_INFILE){ // TT_INFILE == "<"
            if(CheckRedirectedSign(ind_in, cur_token->next)){
                is_syntax_correct = false;
            }
            ind_in = ind_cur_token;
            cnt_in++;
        }else if(cur_token->type == TT_OUTFILE) { //TT_OUTFILE == ">"
            if(CheckRedirectedSign(ind_out, cur_token->next)){
                is_syntax_correct = false;
            }
            ind_out = ind_cur_token;
            cnt_out++;
        }else if(cur_token->type == TT_PIPE){
            if(ind_pipes[ind_cur_pipe - 1] != -1 && ind_pipes[ind_cur_pipe - 1] == ind_cur_pipe){
                is_syntax_correct = false;
            }
            cnt_pipe++;
            ind_pipes[ind_cur_pipe++] = ind_cur_token;
        }

        TakeToken(cur_token, &arguments[ind_cur_token++]);
        cur_token = cur_token->next;
    }
    arguments[ind_cur_token] = NULL;
    
    if(CheckRedirectedSignWithinPipes(ind_pipes[1], ind_pipes[ind_cur_pipe - 1], ind_in) || CheckRedirectedSignWithinPipes(ind_pipes[1], ind_pipes[ind_cur_pipe - 1], ind_out)){
        is_syntax_correct = false;
    }

    if(!is_syntax_correct){
        printf("Syntax error");
        exit(0);
    }

    int last_command = cnt_pipe + 1;

    int pipe_fd[cnt_pipe + 1][2];
    for(int i = 0; i < cnt_pipe + 1; ++i) {
        pipe(pipe_fd[i]);
    }

    for(int cur_command = 1; cur_command <= last_command; ++cur_command){

        arguments_for_exec = (char **) malloc((tokenizer->token_count + 1) * sizeof(char *));

        int j = 0;
        size_t start = ind_pipes[cur_command - 1] + 1, end = tokenizer->token_count;
        if(ind_pipes[cur_command] != -1) {
            end = ind_pipes[cur_command];
        }

        for (size_t i = start; i < end; ++i) {
            if (i != ind_out && i != ind_out + 1 && i != ind_in && i != ind_in + 1) {
                arguments_for_exec[j++] = arguments[i];
            }
        }
        arguments_for_exec[j] = NULL;

        pid_t child_pid = fork();

        if (child_pid == 0) { ///in the child process

            if (cur_command == 1) {
                int fin;
                if (cnt_in) {
                    fin = open(arguments[ind_in + 1], O_RDONLY);
                    if (fin == -1) {
                        printf("I/O error");
                        exit(0);
                    }
                    dup2(fin, STDIN_FILENO);
                    close(fin);
                }
            }

            if(cur_command > 1){
                int ind_prev_pipe = cur_command - 2;
                close(pipe_fd[ind_prev_pipe][1]);
                dup2(pipe_fd[ind_prev_pipe][0], STDIN_FILENO);
                close(pipe_fd[ind_prev_pipe][0]);
            }

            if(last_command != cur_command){
                int ind_pipe = cur_command - 1;
                close(pipe_fd[ind_pipe][0]);
                dup2(pipe_fd[ind_pipe][1], STDOUT_FILENO);
                close(pipe_fd[ind_pipe][1]);
            }

            if (cur_command == last_command) {
                int fout;
                if (cnt_out) {
                    fout = open(arguments[ind_out + 1], O_WRONLY | O_CREAT | O_TRUNC, S_IRUSR | S_IWUSR);

                    if (fout == -1) {
                        printf("I/O error");
                        exit(EXIT_FAILURE);
                    }

                    dup2(fout, STDOUT_FILENO);
                    close(fout);
                }
            }

            execvp(arguments_for_exec[0], arguments_for_exec);
            printf("Command not found\n");

            ArgFree(arguments, tokenizer->token_count);
            if(arguments_for_exec != NULL)
                free(arguments_for_exec);

        } else if (child_pid > 0) { //in the parent process
            int status;
            waitpid(child_pid, &status, 0);

            fprintf(stderr, "IN PARENT PROCESS\n");
            if (WIFEXITED(status)) {
                fprintf(stderr, "The child process finished with code: %d\n", WEXITSTATUS(status));
            } else if (WIFSIGNALED(status)) {
                fprintf(stderr, "The child process finished with signal: %d\n", WTERMSIG(status));
            }

            //close(pipe_fd[cur_command - 1][0]); - is essential
            if(cur_command > 1)
                close(pipe_fd[cur_command - 2][0]);
            close(pipe_fd[cur_command - 1][1]);

            if(cur_command == last_command)
                ArgFree(arguments, tokenizer->token_count);
            if(arguments_for_exec != NULL)
                free(arguments_for_exec);

        } else { //error in fork
            fprintf(stderr, "Error in fork\n");
        }
    }

}

