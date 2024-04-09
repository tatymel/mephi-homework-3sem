#pragma once
#pragma once
#pragma once

#include <stdint.h>
#include <stdio.h>
#include <stdatomic.h>
#include <unistd.h>
#include <stdbool.h>


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

struct RwLock {
    int64_t read_count;
    int64_t writer;
    int64_t want_to_write;
    struct SpinLock spin_lock;
};

inline void RwLock_Init(struct RwLock* lock) {
    lock->read_count = 0;
    lock->writer = 0;
    lock->want_to_write = 0;
    SpinLock_Init(&lock->spin_lock);
    __sync_synchronize();
}

inline void RwLock_ReadLock(struct RwLock* lock) {
    SpinLock_Lock(&lock->spin_lock);
    __sync_synchronize();
    while(AtomicCas(&lock->want_to_write, 0, 0) == 0 || AtomicCas(&lock->writer, 0, 0) == 0){
        SpinLock_Unlock(&lock->spin_lock);

        sleep(0.1);
        __sync_synchronize();

        SpinLock_Lock(&lock->spin_lock);
    }

    AtomicAdd(&lock->read_count, 1);
    __sync_synchronize();
    SpinLock_Unlock(&lock->spin_lock);
}

inline void RwLock_ReadUnlock(struct RwLock* lock) {
    AtomicSub(&lock->read_count, 1);
}

inline void RwLock_WriteLock(struct RwLock* lock) { 
    SpinLock_Lock(&lock->spin_lock);
    __sync_synchronize();
    AtomicXchg(&lock->want_to_write, 1);

    while(AtomicCas(&lock->read_count, 0, 0) == 0 || AtomicCas(&lock->writer, 0, 0) == 0){
       AtomicXchg(&lock->want_to_write, 1);

        __sync_synchronize();
        SpinLock_Unlock(&lock->spin_lock);
        __sync_synchronize();

        sleep(0.01);
        
    __sync_synchronize();
        SpinLock_Lock(&lock->spin_lock);
        __sync_synchronize();
    }
    
    AtomicXchg(&lock->writer, 1);
    AtomicXchg(&lock->want_to_write, 0);
    __sync_synchronize();
}

inline void RwLock_WriteUnlock(struct RwLock* lock) {
    __sync_synchronize();
    AtomicXchg(&lock->writer, 0);

    __sync_synchronize();
    SpinLock_Unlock(&lock->spin_lock);
    __sync_synchronize();
}
