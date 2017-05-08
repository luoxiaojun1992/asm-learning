#! /bin/bash
nasm -f macho64 test.asm
ld -o test -e _start test.o
