#pragma once

#include <stdint.h>
#include <stdio.h>
#include <stdatomic.h>
#include <unistd.h>
#include <stdbool.h>

inline void AtomicAdd(int64_t* atomic, int64_t value) {
    __sync_synchronize();
    asm(
        "lock; addq %1, %0"
        : "+m"(*atomic)
        : "r"(value)
        :"memory"
    );
}

inline void AtomicSub(int64_t* atomic, int64_t value) {
    __sync_synchronize();
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

struct SeqLock {
    int64_t counter;
    struct SpinLock spinlock;
};

inline void SeqLock_Init(struct SeqLock* lock) {
    lock->counter = 0;
    SpinLock_Init(&lock->spinlock);
}

inline int64_t SeqLock_ReadLock(struct SeqLock* lock) {

    __sync_synchronize();
    int64_t seq = 0;
    asm(" movq %1, %0" : "=r"(seq) : "m"(lock->counter) : "memory");
    // __sync_synchronize();
    //if(seq & 1){
    //sleep(0.1);
    //}
    //fprintf(stderr, "%ld\n", seq);
    __sync_synchronize();
    return seq;
}

inline int SeqLock_ReadUnlock(struct SeqLock* lock, int64_t value) {
    SpinLock_Lock(&lock->spinlock);
    __sync_synchronize();
    int64_t res = AtomicCas(&lock->counter, value, lock->counter);
    SpinLock_Unlock(&lock->spinlock);
    return res;

}

inline void SeqLock_WriteLock(struct SeqLock* lock) {
    SpinLock_Lock(&lock->spinlock);
    __sync_synchronize();
    
    while(lock->counter & 1){
        //fprintf(stderr, "lock_cnt %ld\n", lock->counter);
    }
    __sync_synchronize();
    AtomicAdd(&lock->counter, 1);
}

inline void SeqLock_WriteUnlock(struct SeqLock* lock) {
    AtomicAdd(&lock->counter, 1);
    __sync_synchronize();
    SpinLock_Unlock(&lock->spinlock);
}