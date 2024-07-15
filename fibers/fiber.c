#include "fiber.h"
#include <stdint.h>
#include <stdio.h> 
#include <stdbool.h>
#include <stdlib.h>

const int64_t STACK_SIZE = 4096;

struct MyFiber{
    struct MyFiber* next;
    struct MyFiber* prev;
    void* stack;
    void* rsp;
    void* rbp;
    bool pastHandler;
};

struct MyFiber* cur;

void fiber_free(struct MyFiber* to_delete){
    struct MyFiber* next = cur;
    struct MyFiber* prv = to_delete->prev;
    next->prev = prv;
    prv->next = next;
    free(to_delete->stack);
    free(to_delete);
}

void handler(){
    asm
    (
        "movq 0x10(%%rsp), %%rax\n\t"
        "movq 0x8(%%rsp), %%rdi\n\t"
        "call *%%rax\n\t"
        : 
        :
        : "rax",  "memory"
    );
    
    cur = cur->next;
    asm
    (
        "movq %0, %%rsp\n\t"
        "movq %1, %%rbp\n\t"
        : 
        : "r"(cur->rsp), "r"(cur->rbp)
        : "memory"
    );

    fiber_free(cur->prev);
}

void FiberSpawn(void (*func)(void*), void* data){
    if(cur == NULL){ // have to make fiber of the main
        struct MyFiber* main_fiber = malloc(sizeof(struct MyFiber));
        main_fiber->next = NULL;
        main_fiber->prev = NULL;
        main_fiber->stack = NULL;
        main_fiber->rsp = NULL;
        main_fiber->rbp = NULL;
        main_fiber->pastHandler = true;
        cur = main_fiber;    
    }

    struct MyFiber* new_fiber = malloc(sizeof(struct MyFiber));

    new_fiber->next = NULL;
    new_fiber->prev = NULL;
    new_fiber->pastHandler = false;
    new_fiber->stack = malloc(STACK_SIZE);

    new_fiber->rsp = new_fiber->stack + STACK_SIZE - 1;
    while(((uintptr_t)new_fiber->rsp & (0xF)) != 0){new_fiber->rsp-=1;}
    new_fiber->rbp = new_fiber->rsp;

    asm 
    (
        "movq %1, (%0)\n\t"
        "movq %2, -0x8(%0)\n\t"
        "movq %3, -0x10(%0)\n\t"
        "subq $16, %0\n\t"
        : "+r"(new_fiber->rsp)
        : "r"(func), "r"(data), "r"(&handler)
        : "memory"  
    );
    
    struct MyFiber* prv = cur->prev;
    if(prv == NULL){ //cur == main
        prv = cur;
        cur->prev = new_fiber;
        cur->next = new_fiber;
    }else{
        cur->prev = new_fiber;
        prv->next = new_fiber;
    }
    new_fiber->next = cur;
    new_fiber->prev = prv;
}

void FiberYield(){
    asm
    (
        "movq %%rsp, %0\n\t"
        "movq %%rbp, %1\n\t"
        : "=r"(cur->rsp), "=r"(cur->rbp) 
        :
        : "memory"  
    );

    cur = cur->next;
    asm
    (
            "movq %0, %%rsp\n\t"
            "movq %1, %%rbp\n\t"
            : 
            : "r"(cur->rsp), "r"(cur->rbp) 
    );
    
    if(cur->pastHandler){
        asm
        (
            "popq %%rbp\n\t"
            "ret"
            : : : "memory"
        );
    }else if(!cur->pastHandler){
        cur->pastHandler = true;
        asm("ret");
    }
}

void main_delete(){
        free(cur);
}

int FiberTryJoin(){
    if(cur->prev == cur){
        main_delete(cur);
        return 1;
    }
    return 0;
}
