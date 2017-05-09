global _start

section .data
    test_str            :  db    "test", 0xa
    test_str_len        :  equ   $ - test_str

    eol                 :  db    0xa
    eol_len             :  equ   $ - eol

    sys_write           :  equ   0x2000004
    sys_read            :  equ   0x2000003
    sys_exit            :  equ   0x2000001
    stdin               :  equ   0
    stdout              :  equ   1

    x:
	db 1
	db 2
	db 3
        db 4
        db 5

    sum: db 0

section .bss

section .text

exit:
    ; 退出syscall  
    mov rax, sys_exit          ; syscall需要用到的参数，表示退出syscall  
    mov rdi, stdin  
    syscall

_start:
    mov rax, 3
    mov rcx, x
    mov rbx, 0
l1:
    add rbx, [rcx]
    add rcx, 1
    dec rax
    jnz l1
    add rbx, '0'
    mov [rel sum], rbx 

    mov rax, sys_write
    mov rdi, stdout
    mov rsi, sum
    mov rdx, 1
    syscall

    mov rax, sys_write
    mov rdi, stdout
    mov rsi, eol
    mov rdx, eol_len
    syscall

    jmp exit
