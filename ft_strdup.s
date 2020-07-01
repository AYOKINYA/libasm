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

section .text
global _ft_strdup
extern _malloc
extern ___error

_ft_strdup:

cmp rdi, 0
je _error

xor rcx, rcx ; set rcx = 0
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
je _error

xor rcx, rcx ; i = 0
xor rdx, rdx
jmp _strdup_loop

_strdup_loop:

mov dl, BYTE[rdi + rcx]
mov BYTE[rax + rcx], dl
cmp dl, 0
je _return

inc rcx ; ++i
jmp _strdup_loop ; process again

_error:
         mov r9, rax
         call ___error
         mov [rax], r9 ; r9 is 12 from malloc failure!
         mov rax, 0
         ret
_return:
ret