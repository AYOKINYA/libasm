section .text
global _ft_strdup
extern _malloc
extern ___error

_ft_strdup:

call ___error
mov	r9, rax	;error code in r8
xor rcx, rcx ; set rcx = 0
xor	dl, dl
jmp	_strlen_loop

_strlen_loop:

cmp BYTE[rdi + rcx], 0 ; null byte yet?
je _malloc_process ; yes, get out of the loop

inc rcx ; char is ok, count it
jmp _strlen_loop ; malloc with rcx

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
jmp _strdup_loop ; yes, get out

_strdup_loop:

cmp rcx, r8
mov dl, BYTE[rdi + rcx]
mov BYTE[rax + rcx], dl

je _return

inc rcx ; ++i
jmp _strdup_loop ; process again

_strdup_null:

mov dl, BYTE[rax + rcx]
mov dl, 0
ret

_error:
movsx [r9], 12
ret

_return:
ret