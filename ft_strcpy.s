section .text
global _ft_strcpy

_ft_strcpy:

  xor   rcx, rcx       ; set rcx = 0
  xor   rdx, rdx

_strcpy_loop:

  cmp   BYTE[rsi + rcx], 0  ; null byte yet?  
  je    _strcpy_null   ; yes, get out

  mov	dl, BYTE[rsi + rcx]
  mov	BYTE[rdi + rcx], dl
  inc   rcx            ; ++i
  jmp   _strcpy_loop   ; process again

_strcpy_null:

  mov   dl, 0
  mov   BYTE[rdi + rcx], dl
  mov   rax, rdi       ; rax = rdi for return 
  ret                  ; get out