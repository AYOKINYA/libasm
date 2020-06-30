;char *ft_strcpy(char *dest, const char *src)
;{
;	int i = 0;
;
;	while (src[i] != 0)
;	{
;		dest[i] = src[i];
;		i++;
;	}
;	dest[i] = src[i];
;	return (dest);
;}

section .text
global _ft_strcpy

_ft_strcpy:

  xor   rcx, rcx       ; set rcx = 0
  xor	r9, r9

_strcpy_loop:

  cmp   BYTE[rsi + rcx], 0  ; null byte yet?  
  je    _strcpy_null   ; yes, get out

  mov	al, BYTE[rsi + rcx]
  mov	BYTE[rdi + rcx], al
  inc   rcx            ; ++i
  jmp   _strcpy_loop   ; process again

_strcpy_null:

  mov   rax, rdi       ; rax = rdi for return 
  ret                  ; get out