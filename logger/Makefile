ifeq ($(OS), Windows_NT)
    USER_OS := Windows
else
    USER_OS := $(shell uname -s)
endif

ifneq ($(USER_OS), Darwin)
	ASAN_OPTIONS := detect_leaks=1
endif

RESULT := main
CFLAGS := -g -fsanitize=address,undefined -Wall -Werror

all: run

run: compile
	ASAN_OPTIONS=$(ASAN_OPTIONS) python3 test.py

compile: Makefile main.c
	gcc $(CFLAGS) main.c -o $(RESULT)

clean:
	rm -f $(RESULT)
