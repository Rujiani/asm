bits	64
;	res=(a+b)*d*e/c-(c+d)/a
section	.data
res:
	dq	0
a:
	dw	2
b:
	dw	2
c:
	dw	3
d:
	dw	5
e:
	dw	6
section	.text
global	_start
_start:
	movsx	ebx, word[a]
	or	ebx, ebx
	jz	err
	movsx	ecx, word[c]
	jecxz	err
	movsx	edi, word[d]
	movsx	eax, word[e]
	imul	edi
	idiv	ecx
	movsx	esi, word[b]
	add	esi, ebx
	imul	esi
	mov	esi, eax
	sal	rdx, 32
	or	rsi, rdx
	mov	eax, ecx
	add	eax, edi
	cdq
	idiv	ebx
	cdqe
	sub	rsi, rax
	mov	[res], rsi
	mov	eax, 60
	mov	edi, 0
	syscall
err:
	mov	eax, 60
	mov	edi, 1
	syscall
