#include <sys/types.h>
#include <sys/wait.h>
#include <unistd.h>
#include "tokenizer.h"
void TakeToken(struct Token* token,  char** dst) {
    *dst = (char *) malloc(token->len + 1);
    memcpy(*dst, token->start, token->len);
    (*dst)[token->len] = '\0';
}
void ArgFree(char **arguments, size_t token_count){
    for(int i = 0; i < token_count; ++i){
            free(arguments[i]);
    }
    free(arguments);
}
void Exec(struct Tokenizer* tokenizer) {
    if(tokenizer->token_count == 0)
        exit(0);

    char **arguments = (char**)malloc((tokenizer->token_count + 1)* sizeof(char*));
    struct Token* cur_token = tokenizer->head;
    size_t ind_cur_token = 0;

    while(cur_token){
        TakeToken(cur_token, &arguments[ind_cur_token++]);
        cur_token = cur_token->next;
    }
    arguments[ind_cur_token] = NULL;

    pid_t child_pid = fork();
    if(child_pid == 0){ //in the child process

        execvp(arguments[0], arguments);

        //'exec' call resulted in an error
        printf("Command not found\n");
        ArgFree(arguments, tokenizer->token_count);

    }else if(child_pid > 0){ //in the parent process
        int status;
        waitpid(child_pid, &status, 0);

        if (WIFEXITED(status)) {
            fprintf(stderr, "The child process finished with code: %d\n", WEXITSTATUS(status));
        } else if (WIFSIGNALED(status)) {
            fprintf(stderr, "The child process finished with signal: %d\n", WTERMSIG(status));
        }
        ArgFree(arguments, tokenizer->token_count);

    }else{ //error in fork
        fprintf(stderr, "Error in fork\n");
    }
}

