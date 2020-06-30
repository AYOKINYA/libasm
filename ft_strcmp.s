section .text
global _ft_strcmp

_ft_strcmp:

  xor   rcx, rcx       ; set rcx = 0
  xor	  al, al
  jmp _strcmp_loop

_strcmp_loop:

  cmp   BYTE[rsi + rcx], 0  ; null byte yet?  
  je    _strcmp_null   ; yes, get out

  cmp   BYTE[rdi + rcx], 0  ; null byte yet?  
  je    _strcmp_null   ; yes, get out

  mov   al, BYTE[rdi + rcx]
  cmp   al, BYTE[rsi + rcx]  ; null byte yet?  
  jne    _strcmp_null   ; yes, get out

  inc   rcx            ; ++i
  jmp   _strcmp_loop   ; process again

_strcmp_null:

  mov	al, BYTE[rdi + rcx]
  sub	al, BYTE[rsi + rcx]
  movsx   rax, al      ; rax = dl for return, movsx for signed result and extension of dl
  ret                  ; get out and return