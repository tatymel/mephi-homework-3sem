#pragma once
#pragma once

#include <stdint.h>
#include <stdio.h>
#include <stdatomic.h>

inline void AtomicAdd(int64_t* atomic, int64_t value) {
    asm(
        "lock; addq %1, %0"
        : "+m"(*atomic)
        : "r"(value)
        :"memory"
    );
}

inline void AtomicSub(int64_t* atomic, int64_t value) {
    asm(
        "lock; subq %1, %0"
        : "+m"(*atomic)
        : "r"(value)
        :"memory"
    );
}

inline int64_t AtomicXchg(int64_t* atomic, int64_t value) {
    asm volatile(
        "xchgq %1, %0\n\t"  
        : "+r"(value), "+m"(*atomic)
        : 
        : "memory"
    );
    return value; 
}

inline int64_t AtomicCas(int64_t* atomic, int64_t expected, int64_t value) {
    int64_t result = 0;
    asm volatile (
        "lock cmpxchgq %3, %1\n\t"   // Compare and exchange
        "setz %b0\n\t"   
        : "+r" (result), "+m" (*atomic), "+a" (expected)
        : "r" (value)
        : "memory"
    );
    return result;
}

struct SpinLock {
    int64_t atomic; // 0 - free
};

inline void SpinLock_Init(struct SpinLock* lock) {
    lock->atomic = 0;
}

inline void SpinLock_Lock(struct SpinLock* lock) {
    __sync_synchronize();
    while(AtomicCas(&lock->atomic, 0, 1) == 0){}
}

inline void SpinLock_Unlock(struct SpinLock* lock) {
    __sync_synchronize();
    AtomicSub(&lock->atomic, 1);
}
