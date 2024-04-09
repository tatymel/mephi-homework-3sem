        .global sum
        .global sum_struct
        .global sum_array
        .global sum_args

// input:
//    rdi: первое int64_t число
//    rsi: второе int64_t число
//
// output:
//    rax: сумма чисел
//
sum:
    mov %rdi, %rax
    add %rsi, %rax
    ret

// input:
//    rdi: указатель на структуру
//
// struct {
//     int64_t a;
//     int64_t b;
//     int64_t sum;
// };
//
// output:
//    в поле sum нужно записать сумму a и b
//
sum_struct:
    mov (%rdi), %rax
    mov 8(%rdi), %rbx
    add %rbx, %rax
    mov %rax, 16(%rdi)
    ret

// input:
//    rdi: указатель на массив int64_t
//    rsi: количество элементов в массиве
//
// output:
//    rax: сумма элементов массива
//
sum_array:
    mov $0, %rax
    mov %rsi, %rcx
    mov %rdi, %rsi
loop:
    cmp $0, %rcx
    je finish

    add (%rsi), %rax
    add $8, %rsi
    dec %rcx
    jmp loop

finish:
    ret

// input:
//    rdi: количество элементов на стеке (сразу после адреса возврата из функции)
//
// output:
//    rax: сумма элементов со стека
//
sum_args:
    mov $0, %rax
    movq %rdi, %rcx
    lea 0x8(%rsp), %rsi

loop_arg:
    cmpq $0, %rcx
    je finish_arg

    addq (%rsi), %rax
    addq $0x8, %rsi
    dec %rcx
    jmp loop_arg

finish_arg:
    ret
