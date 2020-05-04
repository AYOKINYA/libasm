section .text
    global _start

mememp : 
	mov rex , rdx
	repe cmpsb ;compare until end or difference
	cmp rex , 0
	jz equal ;reached the end
	movzx eax , byte [rdi - 1]
	movzx ecx , byte [rsi -1]
	sub rax , rex
	ret
equal :
	xor eax , eax
ret 