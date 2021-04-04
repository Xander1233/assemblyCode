; To start:
; nasm -felf64 hello.asm && ld hello.o && ./a.out
;
; ~ Xandrrrr
;   Github: Xander1233

global _start

section .text

_start:
        mov rax, 1
        mov rdi, 1
        mov rsi, helloWorldOutputMessage
        mov rdx, sizeOfMessage
        syscall
        mov rax, 60
        xor rdi, rdi
        syscall

section .data

helloWorldOutputMessage: db "Hello, World", 10
sizeOfMessage equ 13
