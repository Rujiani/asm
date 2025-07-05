bits	64
;	Heap sort
section	.data
n:
	dd	10
mas:
	dd	8, 7, 1, 9, 5, 2, 6, 0, 4, 3
section	.text
global	_start
_start:
	mov	rbx, mas
	mov	esi, [n]
	mov	rdi, rsi
	dec	rdi
	jle	m8
	shr	rsi, 1
m1:
	or	rsi, rsi
	jnz	m2
	cmp	rdi, 1
	jz	m7
	mov	eax, [rbx]
	xchg	eax, [rbx+rdi*4]
	mov	[rbx], eax
	dec	rdi
	jmp	m3
m2:
	dec	rsi
m3:
	mov	eax, [rbx+rsi*4]
	push	rsi
	mov	rcx, rsi
m4:
	shl	rcx, 1
	inc	rcx
	cmp	rcx, rdi
	je	m5
	jg	m6
	mov	edx, [rbx+rcx*4]
	cmp	edx, [rbx+rcx*4+4]
	jge	m5
	inc	rcx
m5:
	cmp	eax, [rbx+rcx*4]
	jge	m6
	mov	edx, [rbx+rcx*4]
	mov	[rbx+rsi*4], edx
	mov	rsi, rcx
	jmp	m4
m6:
	mov	[rbx+rsi*4], eax
	pop	rsi
	jmp	m1
m7:
	mov	eax, [rbx]
	cmp	eax, [rbx+4]
	jle	m8
	xchg	eax, [rbx+4]
	mov	[rbx], eax
m8:
	mov	eax, 60
	mov	edi, 0
	syscall
