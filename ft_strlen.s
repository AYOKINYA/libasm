section .data

    msg db "Hello World", 10
    msglen equ $-msg

section .text
    global _start

_start:
  
  mov   rdi, msg
  call _ft_strlen

  ;write
  mov   rdx, rax      ; count = msglen(rax)
  mov   rax, 1        ; syscall 1 == write
  mov   rdi, 1        ; fd = 1 == stdout
  mov   rsi, msg    ; the string to write
 
  syscall             ; print the string

  mov rax, 60     ; sys_exit
  mov rdx, 0      ; exit(0)
  syscall

_ft_strlen:
  push  rcx            ; save and clear out counter
  xor   rcx, rcx       ; set rcx = 0

_strlen_loop:

  cmp   BYTE[rdi + rcx], 0  ; null byte yet?
  je    _strlen_null   ; yes, get out

  inc   rcx            ; char is ok, count it
  jmp   _strlen_loop   ; process again

_strlen_null:

  mov   rax, rcx       ; rcx = the length (put in rax)
  pop   rcx            ; restore rcx
  ret                  ; get out