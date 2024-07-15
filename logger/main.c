#include <stdio.h>
#include <stdlib.h>
#include <dirent.h>
#include <signal.h>
#include <string.h>
#include <unistd.h>

const size_t BUFFER_SIZE = 1024;
const size_t NAME_SIZE = 32;

volatile sig_atomic_t isRotated = 0;
int cnt_logfiles = 0;

void handler(int signum){
    if(signum == SIGHUP)
        isRotated = 1;
}

void do_rotate(FILE *cur_logfile, const char* name_log){
    char new_name[NAME_SIZE], old_name[NAME_SIZE];
    for(int i = cnt_logfiles; i > 1; --i){
        sprintf(new_name, "%s.%d", name_log, i);
        sprintf(old_name, "%s.%d", name_log, i - 1);
        rename(old_name, new_name);
    }
    sprintf(new_name, "%s.%d", name_log, 1);
    rename(name_log, new_name);
}
int main(int argc, char *argv[]){

    const char *name_log = argv[1];

    //set up signal handler
    struct sigaction sa;
    sa.sa_handler = handler;
    sigemptyset(&sa.sa_mask); 
    sa.sa_flags = 0;   
    sigaction(SIGHUP, &sa, NULL);

    FILE *cur_logfile;
    if((cur_logfile = fopen(name_log, "w")) == NULL){
        printf("Error while creating file ""logfile""\n");
        exit(1);
    }
    cnt_logfiles++;

    char buffer[BUFFER_SIZE];
    while(!feof(stdin)){
        while(fgets(buffer, BUFFER_SIZE, stdin) != NULL){
            if(isRotated){
                do_rotate(cur_logfile, name_log);
                fclose(cur_logfile);  
                cur_logfile = fopen(name_log, "w");
                cnt_logfiles++;
                isRotated = 0;
            }

            fputs(buffer, cur_logfile);
            fflush(cur_logfile);
        }
    }
    fclose(cur_logfile);  
    exit(0);
}
