section .text
global _ft_read
extern ___error

_ft_read:
          mov rax, 0x2000003
          syscall
          jc  _err
          ret

_err:
         mov r9, rax
         call ___error
         mov [rax], r9
         mov rax, -1
         ret