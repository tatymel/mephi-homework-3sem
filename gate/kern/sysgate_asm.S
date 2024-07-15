    .extern sys_retire
    .extern sys_work
    
    .global _syscall_enter
    .text


func_sys_work:
    movq %rsi, %rdi
    call sys_work
    jmp _syscall_ret
    
func_sys_retire:
    call sys_retire
    jmp _syscall_ret


_syscall_enter:
    pushq %rbp
    movq %rsp, %rbp
    pushq %rcx
    pushq %r11
    cmpl $1, %edi
    je func_sys_work
    cmpl $1, %edi
    jne func_sys_retire
_syscall_ret:
    movq $5, %rax
    popq %r11
    popq %rcx
    popq %rbp
    sysretq
