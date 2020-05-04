section .data

    msg db "Hello World", 10
    msglen equ $-msg

section .text
    global _start
_start:

    mov rax, 1      ; sys_write
    mov rdi, 1      ; fd = 1
    mov rsi, msg    ; buf = msg
    mov rdx, msglen ; count = msglen
    syscall

    mov rax, 60     ; sys_exit
    mov rdx, 0      ; exit(0)
    syscall