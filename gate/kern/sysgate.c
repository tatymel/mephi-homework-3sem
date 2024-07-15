#include <kern/sysgate.h>
#include <kern/syscall.h>
#include <inc/stdio.h>
 long read_msr(int msr){
    long res = 0;
    asm volatile
    (
        "movl %1, %%ecx\n\t"
        "xor %%edx, %%edx\n\t"
        "xor %%eax, %%eax\n\t"
        "rdmsr\n\t"
        "shl $32, %%rdx\n\t"
        "orq %%rdx, %%rax\n\t"
        "movq %%rax, %0\n\t"
        : "=r"(res)
        : "r"(msr)
        : "rdx", "rax", "ecx"
    );

    return res;
}

void write_msr(int msr, long value){
    asm volatile
    (
        "movl %0, %%ecx\n\t"
        "movq %1, %%rax\n\t"
        "movq %1, %%rdx\n\t"
        "shl $32, %%rax\n\t"
        "shr $32, %%rax\n\t"
        "shr $32, %%rdx\n\t"
        "wrmsr\n\t"
        : 
        : "r"(msr), "r"(value)
        : "rdx", "rax", "ecx"
    );
}

extern void _syscall_enter();
extern void _start_user();
void sysgate() {
    long msr = read_msr(IA32_EFER);
    msr |= (0x1);
    write_msr(IA32_EFER, msr);

    long sys_entr_addr = (long)&_syscall_enter;
    write_msr(IA32_LSTAR, sys_entr_addr);
    
    long start_user_addr = (long)&_start_user;
    asm volatile (
        "movq %0, %%rcx\n\t"
        "sysretq\n\t"  
        :
        : "r"(start_user_addr)
        : "rcx"
    );
}
