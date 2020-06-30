    section .text
    global _ft_strlen

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