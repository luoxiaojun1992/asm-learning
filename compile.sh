#! /bin/bash
appName=$1
nasm -f macho64 $appName.asm
ld -o $appName -e _start $appName.o
