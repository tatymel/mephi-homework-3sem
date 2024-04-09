#include "malloc.h"

void* malloc(size_t size){
    size_t prot = PROT_READ | PROT_WRITE;
    size_t flags = MAP_ANONYMOUS | MAP_PRIVATE;

    size_t len = size + sizeof(size_t);

    void* ptr = mmap(NULL, len, prot, flags, -1, 0);

    *((size_t*)ptr) = size;
    return ptr + sizeof(size_t);
}
void* realloc(void* ptr, size_t size){
    ptr -= sizeof (ptr);
    size_t old_size = *((size_t*)(ptr)) + sizeof(size_t);
    size_t new_size = size + sizeof(size_t);
    size_t flags = MREMAP_MAYMOVE;

    ptr = mremap(ptr, old_size, new_size, flags,NULL);

    *((size_t*)ptr) = size;
    return ptr + sizeof(size_t);
}
void free(void* ptr){
    ptr -= sizeof(size_t);
    size_t size = *((size_t*)(ptr)) + sizeof(size_t);

    munmap(ptr, size);
}
