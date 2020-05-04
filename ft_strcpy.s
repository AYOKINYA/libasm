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
    global _start

_start:
  
  mov   rdi, msg
  call _ft_strcpy

  ;write
  mov   rdx, rax      ; count = msglen(rax)
  mov   rax, 1        ; syscall 1 == write
  mov   rdi, 1        ; fd = 1 == stdout
  mov   rsi, msg    ; the string to write
 
  syscall             ; print the string

  mov rax, 60     ; sys_exit
  mov rdx, 0      ; exit(0)
  syscall

_ft_strcpy:

  xor   rcx, rcx       ; set rcx = 0

_strcpy_loop:

  cmp   BYTE[rsi + rcx], 0  ; null byte yet?  
  je    _strlen_null   ; yes, get out

  
  mov	BYTE[rdi + rcx], BYTE[rsi + rcx]
  inc   rcx            ; ++i
  jmp   _strlen_loop   ; process again

_strcpy_null:

  mov   rax, rdi       ; rax = rdi for return 
  ret                  ; get out


  strcpy: 
	push %ebp 
	mov %esp, %ebp 
	push %edi 
	push %esi 
	push %ecx 
	xor %ecx, %ecx 
	mov 0x8(%ebp), %edi 
	mov 0xc(%ebp), %esi 
  
	.strcmp_lp: 
		cmpb $0x0, (%esi) 
		movb $0x0, (%edi) 
		je .strcmp_lp_fin 
		movb (%esi), %al 
		movb %al, (%edi) 
		inc %esi 
		inc %edi 
		inc %ecx 
		jmp .strcmp_lp 
	.strcmp_lp_fin: 
		mov %ecx, %eax 
		pop %ecx pop %esi
		pop %edi 
		leave
		ret $0x4

출처: https://revdev.tistory.com/17 [Segmentation Fault]