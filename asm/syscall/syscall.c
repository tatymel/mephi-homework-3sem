#include "syscall.h"
// Opens the file specified by pathname.
int open(const char* pathname, int flags) {
    size_t result;
    asm("mov $2, %%rax\n\t"
        "mov %1, %%rdi\n\t"
        "mov %2, %%rsi\n\t"
        "syscall\n\t"
        "mov %%rax, %0"
        : "=r" (result)
        : "m" (pathname), "m" (flags)
    );
    return (int)result;
}

ssize_t read(int fd, void* buf, size_t count) {
    ssize_t size;
    asm(
        "mov $0, %%rax\n\t"
        "mov %1, %%rdi\n\t"
        "mov %2, %%rsi\n\t"
        "mov %3, %%rdx\n\t"
        "syscall\n\t"
        "mov %%rax, %0"
        : "=r" (size)
        : "m"(fd), "m"(buf), "m"(count)
    );
    return size;
}

ssize_t write(int fd, const void* buf, ssize_t count) {
    ssize_t size;
    asm(
        "mov $1, %%rax\n\t"
        "mov %1, %%rdi\n\t"
        "mov %2, %%rsi\n\t"
        "mov %3, %%rdx\n\t"
        "syscall\n\t"
        "mov %%rax, %0"
        : "=r" (size)
        : "m"(fd), "m"(buf), "m"(count)
    );
    return size;
}

int pipe(int pipefd[2]) {
    ssize_t result;
    asm(
        "mov $22, %%rax\n\t"
        "mov %1, %%rdi\n\t"
        "syscall\n\t"
        "mov %%rax, %0"
        : "=r" (result)
        : "m"(pipefd)
    );
    return (int)result;
}

int close(int fd) {
    size_t result;
    asm("mov $3, %%rax\n\t"
        "mov %1, %%rdi\n\t"
        "syscall\n\t"
        "mov %%rax, %0"
        : "=r" (result)
        : "m" (fd)
    );
    return (int)result;
}

int dup(int oldfd) {
    size_t result;
    asm("mov $32, %%rax\n\t"
        "mov %1, %%rdi\n\t"
        "syscall\n\t"
        "mov %%rax, %0"
        : "=r" (result)
        : "m" (oldfd)
    );
    return (int)result;
}

void exit(int status) {
    asm("mov $60, %%rax\n\t"
        "mov %0, %%rdi\n\t"
        "syscall\n\t"
        :
        : "m" (status)
    );
}

pid_t fork() {
    size_t pid;
    asm("mov $57, %%rax\n\t"
        "syscall\n\t"
        "mov %%rax, %0"
        : "=r" (pid)
    );
    return (pid_t)pid;
}

pid_t waitpid(pid_t pid, int* wstatus, int options) {
    size_t res_pid;
    asm("mov $61, %%rax\n\t"
        "mov %1, %%rdi\n\t"
        "mov %2, %%rsi\n\t"
        "mov %3, %%rdx\n\t"
        "syscall\n\t"
        "mov %%rax, %0"
        : "=r" (res_pid)
        : "m" (pid), "m" (wstatus), "m" (options)
    );
    return (pid_t)res_pid;
}

int execve(const char* filename, char* const argv[], char* const envp[]) {
    size_t result;
    asm("mov $59, %%rax\n\t"
        "mov %1, %%rdi\n\t"
        "mov %2, %%rsi\n\t"
        "mov %3, %%rdx\n\t"
        "syscall\n\t"
        "mov %%rax, %0"
        : "=r" (result)
        : "m" (filename), "m" (argv), "m" (envp)
    );
    return (int)result;
}
