bits	64
;	Quick sort
section	.data
n:
	dd	10
mas:
	dd	8, 7, 1, 9, 5, 2, 6, 0, 4, 3
section	.text
global	_start
_start:
	mov	rdi, mas
	xor	rsi, rsi
	mov	edx, [n]
	dec	edx
	call	quick
	mov	eax, 60
	mov	edi, 0
	syscall
quick:
	or	rsi, rsi
	jl	m8
	cmp	rsi, rdx
	jge	m8
	mov	r8, rsi
	mov	r9, rdx
	mov	eax, [rdi+r8*4]
m1:
	cmp	eax, [rdi+r9*4]
	jg	m3
m2:
	dec	r9
	cmp	r8, r9
	je	m7
	jmp	m1
m3:
	mov	ecx, [rdi+r9*4]
	mov	[rdi+r8*4], ecx
	jmp	m5
m4:
	cmp	eax, [rdi+r8*4]
	jl	m6
m5:
	inc	r8
	cmp	r8, r9
	je	m7
	jmp	m4
m6:
	mov	ecx, [rdi+r8*4]
	mov	[rdi+r9*4], ecx
	jmp	m2
m7:
	mov	[rdi+r9*4], eax
	push	rdi
	push	rdx
	push	r9
	mov	rdx, r9
	dec	rdx
	call	quick
	pop	r9
	pop	rdx
	pop	rdi
	mov	rsi, r9
	inc	rsi
	call	quick
m8:
	ret
