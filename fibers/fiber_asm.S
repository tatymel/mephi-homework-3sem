    .global switch_ctx

    .text
.extern handler
switch_ctx:
    subq $8, %rdi
    movq 0x8(%rsp), %rax
    movq %rax, (%rdi)
    ret
    

    

