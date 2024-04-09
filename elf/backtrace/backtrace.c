#include "backtrace.h"


#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <sys/mman.h>
#include <fcntl.h>
#include <elf.h>
#include <stdbool.h>
#include <string.h>

// Input:
//   - backtrace - массив, который требуется заполнить адресами возврата из стека
//   - limit - размер массива backtrace
// Output:
//   - количество элементов, записанных в массив
//   - backtrace[0] равен адресу возврата из функции Backtrace

void* elf_ptr;
off_t file_size;

int Backtrace(void* backtrace[], int limit){
    void** frame_base;
    asm ("mov %%rbp, %0" : "=r"(frame_base));

    int cnt = 0;
    while(cnt < limit){
        backtrace[cnt] = frame_base[1];

        bool isMain = !(strcmp("main", AddrToName(backtrace[cnt])));
        ++cnt;

        if(elf_ptr != NULL)
                munmap(elf_ptr, file_size);

        if(isMain){
            break;
        }

        frame_base = frame_base[0];
    }
    return cnt;
}

// Input:
//   - addr - указатель на инструкцию внутри произвольной функции
// Output:
//   - статически выделенную строку c именем функции, которой принадлежит инструкция

// Функция для преобразования адреса в имя функции
char* AddrToName(void* addr) {
    char* name;
   
    // open ELF file
    int fd = open("/proc/self/exe", O_RDONLY);
    if (fd == -1) {
        perror("open");
        exit(1);
    }
    
    // Получаем размер файла
    file_size = lseek(fd, 0, SEEK_END);
    if (file_size == -1) {
        perror("lseek");
        close(fd);
        exit(1);
    }
    lseek(fd, 0, SEEK_SET);
    

    elf_ptr = mmap(NULL, file_size, PROT_READ, MAP_PRIVATE, fd, 0);
    if (elf_ptr == MAP_FAILED) {
        perror("mmap");
        close(fd);
        exit(1);
    }

    
    // get ELF header
    Elf64_Ehdr* elf_header = (Elf64_Ehdr*)elf_ptr;
    
    // check сигнатуру ELF file
    //int memcmp ( const void * ptr1, const void * ptr2, size_t num );
    //ELFMAG - это макрос, представляющий собой символьную строку с заголовком ELF файла
    //SEELFMAG - это макрос, представляющий длину этой строки.
    if (memcmp(elf_header->e_ident, ELFMAG, SELFMAG) != 0) {
        fprintf(stderr, "Not a valid ELF file.\n");
        munmap(elf_ptr, file_size);
        close(fd);
        exit(1);
    }
    
    // get pointer to ---Section header--- ELF file
    Elf64_Shdr* section_header = (Elf64_Shdr*)(elf_ptr + elf_header->e_shoff);
    
    // find section header for .symtab
    Elf64_Shdr* symtab_section = NULL;
    char* strtab = NULL;
    int num_sections = elf_header->e_shnum;
    for (int i = 0; i < num_sections; ++i) {
        if (section_header[i].sh_type == SHT_SYMTAB) {
            symtab_section = &section_header[i];
            // find секцию строк таблицы символов
            strtab = (char*)(elf_ptr + section_header[section_header[i].sh_link].sh_offset);
            break;
        }
    }
    
    // check, if find section header for .symtab
    if (!symtab_section) {
        fprintf(stderr, "No symbol table found.\n");
        munmap(elf_ptr, file_size);
        close(fd);
        exit(1);
    }
    
    // get pointer to Symbol table
     Elf64_Sym* symbol_table = (Elf64_Sym*)(elf_ptr + symtab_section->sh_offset);

    // Определяем cnt символов в таблице символов
    int num_symbols = symtab_section->sh_size / sizeof(Elf64_Sym);
    
    // find function которой принадлежит addr
    for (int i = 0; i < num_symbols; ++i) {
        if (ELF64_ST_TYPE(symbol_table[i].st_info) == STT_FUNC) {
            Elf64_Addr symbol_addr = symbol_table[i].st_value;
            if (symbol_addr <= (Elf64_Addr)addr && (Elf64_Addr)addr < symbol_addr + symbol_table[i].st_size) {
                name = strtab + symbol_table[i].st_name;
                break;
            }
        }
    }

    //munmap(elf_ptr, file_size);
    close(fd);
    return name;
}

void PrintBt(){
    void* bt[256];
    int sz = Backtrace(bt, 256);
    fprintf(stderr, "sz: %d \n", sz);
    while(sz > 0){
        sz--;
        fprintf(stderr, "%p ", bt[sz]);
        fprintf(stderr, "%s\n", AddrToName(bt[sz]));
    }

}
