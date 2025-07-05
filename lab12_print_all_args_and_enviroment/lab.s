bits	64
;	Print all args and enviroment
section	.data
nl	db	10
msg1:
	db	"Args:", 10
msg1len	equ	$-msg1
msg2:
	db	"Enviroment:", 10
msg2len	equ	$-msg2
section	.text
global	_start	
_start:
	mov	edi, 1
	mov	rsi, msg1
	mov	edx, msg1len
	mov	eax, 1
	syscall
	mov	rbx, rsp
	add	rbx, 8
m1:
	mov	rsi, [rbx]
	mov	rdx, [rbx]
m2:
	cmp	byte[rdx], 0
	jz	m3
	inc	rdx
	jmp	m2
m3:
	sub	rdx, rsi
	mov	eax, 1
	syscall
	mov	rsi, nl
	mov	edx, 1
	mov	eax, 1
	syscall
	add	rbx, 8
	cmp	dword[rbx], 0
	jnz	m1
	add	rbx, 8
	mov	rsi, msg2
	mov	edx, msg2len
	mov	eax, 1
	syscall
m4:
	mov	rsi, [rbx]
	mov	rdx, [rbx]
m5:
	cmp	byte[rdx], 0
	jz	m6
	inc	rdx
	jmp	m5
m6:
	sub	rdx, rsi
	mov	eax, 1
	syscall
	mov	rsi, nl
	mov	edx, 1
	mov	eax, 1
	syscall
	add	rbx, 8
	cmp	dword[rbx], 0
	jnz	m4
	mov	eax, 60
	mov	edi, 0
	syscall
