section .text
global _ft_write
extern ___error

_ft_write:
          mov rax, 0x2000004
          syscall
          jc  _err
          ret

_err:
         mov r9, rax
         push rbp
         call ___error
         pop rbp
         mov [rax], r9
         mov rax, -1
         ret