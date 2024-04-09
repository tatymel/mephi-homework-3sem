#include <stdlib.h>
#include <sys/mman.h>
#include <signal.h>
#include <errno.h>
#include <string.h>
#include <stdio.h>
#include <assert.h>

extern size_t PAGE_SIZE;
extern double* SQRTS;
extern const int MAX_SQRTS;

double* prev_addr = NULL;

void CalculateSqrts(double* sqrt_pos, int start, int n);

void HandleSigsegv(int sig, siginfo_t* siginfo, void* ctx) {
    if(sig == SIGSEGV){
        double* addr = (double*)siginfo->si_addr;
        double *real_addr = NULL;

        if(SQRTS <= addr && addr < SQRTS + MAX_SQRTS * sizeof(double)){
            while(real_addr < SQRTS || real_addr == NULL){
                real_addr = mmap(addr, PAGE_SIZE, PROT_READ | PROT_WRITE, MAP_PRIVATE | MAP_ANONYMOUS, -1, 0);
                
                if(real_addr == MAP_FAILED){
                    fprintf(stderr, "Couldn't mmap() region in HandleSigsegv: %s\n", strerror(errno));
                    exit(1);
                }

                if(prev_addr != NULL){
                    if (munmap(prev_addr, PAGE_SIZE) == -1) {
                        fprintf(stderr, "Couldn't munmap() region in HandleSigsegv: %s\n", strerror(errno));
                        exit(1);
                    }
                    prev_addr = NULL;
                }
            }
            CalculateSqrts(real_addr, (int)((double*)real_addr - SQRTS), (int)(PAGE_SIZE / sizeof(double)));
            
            prev_addr = real_addr;
        }
    }
}
