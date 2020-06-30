section .data
    msg db "Hello World", 10
    msglen equ $-msg

section .text
    global _ft_write
	extern ___error

_ft_write:
  
  mov   rdi, 1
  mov	rsi, msg
  mov	rdx, msglen

  call ___error		  ; error code goes to rax
  mov	r9, rax		  ; error code in rax is copied to r9.
  mov   rax, 1        ; syscall 1 == write // syscall 0 == read, 0x2000003 in macOS
  syscall             ; print the string
  jc _error			  ; if error, jc == 1 and it goes to _error
  jmp _exit
  
  
_error:
	mov [r9], rax
	mov rax, -1
	ret

  _exit:
  	mov rax, rdx
	ret
	
	
;char	*ft_strdup(const char *s)
;{
;	int		len;
;	int		i;
;	char	*temp;
;
;	len = 0;
;	while (s[len] != '\0')
;		++len;
;	temp = (char *)malloc(sizeof(char) * (len + 1));
;	if (temp == 0)
;		return (0);
;	i = 0;
;	while (i < len)
;	{
;		temp[i] = s[i];
;		++i;
;	}
;	temp[i] = '\0';
;	return (temp);
;}

section .data

    msg db "Hello World", 10
    msglen equ $-msg
	src db "annyung", 10
    srclen equ $-src

section .text
    global _ft_strdup
	extern _malloc
	extern ___error

_ft_strdup:

  call ___error
  mov 	r9, rax			;error code in r8
  xor   rcx, rcx       ; set rcx = 0
  xor	dl, dl
  jmp	_strlen_loop

_strlen_loop:

  cmp   BYTE[rdi + rcx], 0  ; null byte yet?
  je    _malloc_process   ; yes, get out of the loop

  inc   rcx            ; char is ok, count it
  jmp   _strlen_loop  ; malloc with rcx
  
_malloc_process :

  inc	rcx
  push	rdi
  mov rdi, rcx
  call _malloc ; on return, rax points to the allocated memory
  pop rdi
  cmp rax, 0
  jmp _error

  mov r8, rcx
  xor rcx, rcx ; i = 0
  jmp    _strdup_loop  ; yes, get out

_strdup_loop:
  
  cmp  rcx, r8
  mov  dl, BYTE[rdi + rcx]
  mov  BYTE[rax + rcx], dl

  
  je _return

  inc   rcx            ; ++i
  jmp   _strdup_loop   ; process again

_strdup_null:
  
  mov  dl, BYTE[rax + rcx]
  mov  dl, 0
  ret

_error:
	mov [r9], 12
	ret

_return:
	ret
