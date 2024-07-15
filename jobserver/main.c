#include <stdio.h>
#include <stdlib.h>
#include <dirent.h>
#include <signal.h>
#include <sys/wait.h>
#include <sys/ioctl.h>
#include <string.h>
#include <unistd.h>
#include <err.h>

const size_t MAX_PATH_SIZE = 1024;
const char* token = "0";

int cnt_parallel_task;
int pipe_fd[2];

void recursion(DIR* d, const char* path){
    struct dirent* dp;
    while((dp = readdir(d)) != NULL){
         if (strcmp(dp->d_name, ".") == 0 || strcmp(dp->d_name, "..") == 0){
            continue;
        }
        char nxt_path[MAX_PATH_SIZE];
        snprintf(nxt_path, MAX_PATH_SIZE, "%s/%s", path,  dp->d_name);

        if(dp->d_type == DT_DIR){
            int pid = fork();
            if (pid < 0) {
                err(1, "fork");
                exit(EXIT_FAILURE);
            } else if (pid == 0) {
                DIR* nxt_dp = opendir(nxt_path);
                if (d == NULL) {
                    err(1, "opendir in recursion");
                } 

                recursion(nxt_dp, nxt_path);
                closedir(nxt_dp);
                exit(EXIT_SUCCESS);
            }

            
        }else if(dp->d_type == DT_REG && access(nxt_path, X_OK) == 0){
            char t;
            read(pipe_fd[0], &t, 1);

            pid_t pid = fork();
            if(pid < 0){
                err(1, "fork");
                exit(EXIT_FAILURE);
            }
            if(pid == 0){
                execl(nxt_path, nxt_path, NULL);
                err(1, "execl");
                exit(EXIT_FAILURE);         
            }else{
                int status;
                waitpid(pid, &status, 0);
                write(pipe_fd[1], &token, 1); 
            }
            
        }
    }
    free(dp);
}
int main(int argc, char *argv[]){
     if(argc < 2) {
        fprintf(stderr, "Usage: %s <number_of_parallel_tasks>\n", argv[0]);
        exit(EXIT_FAILURE);
    }
    cnt_parallel_task = atoi(argv[1]);

    fprintf(stderr, "cnt_parallel task = %d\n", cnt_parallel_task);

    if(pipe(pipe_fd) < 0) {
        err(1, "pipe");
        exit(EXIT_FAILURE);    
    }

    for (int i = 0; i < cnt_parallel_task; i++) {
        write(pipe_fd[1], token, 1);
    }

    DIR* d = opendir(".");
    if (d == NULL) {
        err(1, "opendir");
        exit(EXIT_FAILURE);    
    }
    recursion(d, ".");
    while (wait(NULL) > 0);

    closedir(d);
    close(pipe_fd[0]);
    close(pipe_fd[1]);


    fprintf(stderr, "end\n");
    exit(0);
}