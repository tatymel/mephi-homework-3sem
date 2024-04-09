        .global savectx
        .global jumpctx

//rdi: pointer to Context
//Функция `savectx` сохраняет текущий контекст и возвращает 0.
//После этого, пользователь может вызвать `jumpctx` и исполнение программы продолжится так,
//будто функция `savectx` вернула 1.

//Получается из функции `savectx` можно "вернуться несколько раз", это чем-то похоже на системный вызов `fork`.

savectx:
    mov (%rsp), %rax
    mov %rax, (%rdi)

    lea 0x8(%rsp), %rax
    mov %rax, 0x8(%rdi)

    mov %rbp, 0x10(%rdi)

    mov $0, %rax
    ret



jumpctx:
    mov (%rdi), %rdx

    mov 0x8(%rdi), %rsp
    mov 0x10(%rdi), %rbp

    mov $1, %rax
    jmp *%rdx
