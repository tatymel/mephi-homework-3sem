#include <sys/types.h>
#include <sys/wait.h>
#include <unistd.h>
#include <stdbool.h>
#include <sys/fcntl.h>
#include "tokenizer.h"

void TakeToken(struct Token* token,  char** dst) {
    *dst = (char *) malloc(token->len + 1);
    memcpy(*dst, token->start, token->len);
    (*dst)[token->len] = '\0';
}

void ArgFree(char **arguments, size_t token_count){
    if(arguments != NULL){
        for(int i = 0; i < token_count; ++i){
            free(arguments[i]);
        }
        free(arguments);
    }
}

void Exec(struct Tokenizer* tokenizer) {
    if(tokenizer->token_count == 0)
        exit(0);

    char **arguments = (char**)malloc((tokenizer->token_count + 1) * sizeof(char*));
    char **arguments_for_exec = NULL;

    struct Token* cur_token = tokenizer->head;
    int ind_cur_token = 0;
    int ind_in = -2, ind_out = -2;
    int cnt_in = 0, cnt_out = 0;
    bool is_syntex_cor = true;

    while(cur_token){
        if(cur_token->type == TT_INFILE){ // TT_INFILE == "<"
            if(ind_in != -2 || cur_token->next == NULL || (cur_token->next != NULL && cur_token->next->type != TT_WORD)){
                is_syntex_cor = false;
            }
            ind_in = ind_cur_token;
            cnt_in++;
        }else if(cur_token->type == TT_OUTFILE) { //TT_OUTFILE == ">"
            if(ind_out != -2 || cur_token->next == NULL || (cur_token->next != NULL && cur_token->next->type != TT_WORD)){
                is_syntex_cor = false;
            }
            ind_out = ind_cur_token;
            cnt_out++;
        }

        TakeToken(cur_token, &arguments[ind_cur_token++]);
        cur_token = cur_token->next;
    }
    arguments[ind_cur_token] = NULL;

    if(!is_syntex_cor){
        printf("Syntax error");
        exit(0);
    }

    arguments_for_exec = (char **) malloc((tokenizer->token_count + 1 - cnt_in * 2 - cnt_out * 2) * sizeof(char *));
    int j = 0;
    for (size_t i = 0; i < tokenizer->token_count + 1; ++i) {
        if (i != ind_out && i != ind_out + 1 && i != ind_in && i != ind_in + 1) {
            arguments_for_exec[j++] = arguments[i];
        }
    }

    pid_t child_pid = fork();
    if(child_pid == 0){ ///in the child process

        if(!cnt_out && !cnt_in) {
            execvp(arguments_for_exec[0], arguments_for_exec);

            //'exec' call resulted in an error
            printf("Command not found\n");

        }else{
            int fin, fout;

            if(cnt_in){
                fin = open(arguments[ind_in + 1], O_RDONLY);
                if(fin == -1) {
                    printf("I/O error");
                    exit(0);
                }

                dup2(fin, STDIN_FILENO);
                close(fin);
            }

            if(cnt_out){
                fout = open(arguments[ind_out + 1], O_WRONLY | O_CREAT | O_TRUNC, S_IRUSR | S_IWUSR);

                if (fout == -1) {
                    printf("I/O error");
                    exit(EXIT_FAILURE);
                }

                dup2(fout, STDOUT_FILENO);
                close(fout);
            }

            execvp(arguments_for_exec[0], arguments_for_exec);
            printf("Command not found\n");
        }
        ArgFree(arguments, tokenizer->token_count);
        free(arguments_for_exec);

    }else if(child_pid > 0){ //in the parent process
        int status;
        waitpid(child_pid, &status, 0);

        if (WIFEXITED(status)) {
            fprintf(stderr, "The child process finished with code: %d\n", WEXITSTATUS(status));
        } else if (WIFSIGNALED(status)) {
            fprintf(stderr, "The child process finished with signal: %d\n", WTERMSIG(status));
        }

        ArgFree(arguments, tokenizer->token_count);
        free(arguments_for_exec);

    }else{ //error in fork
        fprintf(stderr, "Error in fork\n");
    }
}

