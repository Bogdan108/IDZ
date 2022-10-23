	.file	"main_first.c"
	.intel_syntax noprefix
	.text
	.section	.rodata
.LC0:
	.string	"read"
.LC1:
	.string	"r"
.LC2:
	.string	"w"
.LC3:
	.string	"%d"
.LC4:
	.string	"Not enough arguments!"
	.text
	.globl	main
	.type	main, @function
main:
	push	rbp
	mov	rbp, rsp
	sub	rsp, 80
	mov	DWORD PTR -68[rbp], edi
	mov	QWORD PTR -80[rbp], rsi
	mov	rax, QWORD PTR fs:40
	mov	QWORD PTR -8[rbp], rax
	xor	eax, eax
	mov	DWORD PTR -48[rbp], 1
	mov	DWORD PTR -52[rbp], 0
	cmp	DWORD PTR -68[rbp], 1
	jle	.L2
	mov	rax, QWORD PTR -80[rbp]
	add	rax, 8
	mov	rax, QWORD PTR [rax]
	lea	rsi, .LC0[rip]
	mov	rdi, rax
	call	strcmp@PLT
	test	eax, eax
	jne	.L3
	mov	rax, QWORD PTR -80[rbp]
	add	rax, 16
	mov	rax, QWORD PTR [rax]
	lea	rsi, .LC1[rip]
	mov	rdi, rax
	call	fopen@PLT
	mov	QWORD PTR -40[rbp], rax
	mov	rax, QWORD PTR -80[rbp]
	add	rax, 32
	mov	rax, QWORD PTR [rax]
	lea	rsi, .LC2[rip]
	mov	rdi, rax
	call	fopen@PLT
	mov	QWORD PTR -32[rbp], rax
	jmp	.L4
.L3:
	mov	rax, QWORD PTR -80[rbp]
	add	rax, 16
	mov	rax, QWORD PTR [rax]
	lea	rsi, .LC2[rip]
	mov	rdi, rax
	call	fopen@PLT
	mov	QWORD PTR -32[rbp], rax
	mov	rax, QWORD PTR -80[rbp]
	add	rax, 32
	mov	rax, QWORD PTR [rax]
	lea	rsi, .LC1[rip]
	mov	rdi, rax
	call	fopen@PLT
	mov	QWORD PTR -40[rbp], rax
.L4:
	sub	DWORD PTR -48[rbp], 1
.L2:
	cmp	DWORD PTR -48[rbp], 0
	je	.L5
	lea	rax, -56[rbp]
	mov	rsi, rax
	lea	rdi, .LC3[rip]
	mov	eax, 0
	call	__isoc99_scanf@PLT
	jmp	.L6
.L5:
	lea	rdx, -56[rbp]
	mov	rax, QWORD PTR -40[rbp]
	lea	rsi, .LC3[rip]
	mov	rdi, rax
	mov	eax, 0
	call	__isoc99_fscanf@PLT
.L6:
	mov	eax, DWORD PTR -56[rbp]
	test	eax, eax
	jg	.L7
	lea	rdi, .LC4[rip]
	mov	eax, 0
	call	printf@PLT
	mov	eax, 0
	jmp	.L13
.L7:
	mov	eax, DWORD PTR -56[rbp]
	sal	eax, 2
	cdqe
	mov	rdi, rax
	call	malloc@PLT
	mov	QWORD PTR -24[rbp], rax
	cmp	DWORD PTR -48[rbp], 0
	je	.L9
	mov	eax, DWORD PTR -56[rbp]
	mov	rdx, QWORD PTR -24[rbp]
	mov	rsi, rdx
	mov	edi, eax
	call	readArray@PLT
	jmp	.L10
.L9:
	mov	eax, DWORD PTR -56[rbp]
	mov	rdx, QWORD PTR -40[rbp]
	mov	rcx, QWORD PTR -24[rbp]
	mov	rsi, rcx
	mov	edi, eax
	call	readArrayFile@PLT
	mov	rax, QWORD PTR -40[rbp]
	mov	rdi, rax
	call	fclose@PLT
.L10:
	mov	eax, DWORD PTR -56[rbp]
	lea	rdx, -52[rbp]
	mov	rcx, QWORD PTR -24[rbp]
	mov	rsi, rcx
	mov	edi, eax
	call	findMin@PLT
	mov	DWORD PTR -44[rbp], eax
	mov	edx, DWORD PTR -56[rbp]
	mov	eax, DWORD PTR -52[rbp]
	sub	edx, eax
	mov	eax, edx
	sal	eax, 2
	cdqe
	mov	rdi, rax
	call	malloc@PLT
	mov	QWORD PTR -16[rbp], rax
	mov	edx, DWORD PTR -56[rbp]
	mov	ecx, DWORD PTR -44[rbp]
	mov	rsi, QWORD PTR -16[rbp]
	mov	rax, QWORD PTR -24[rbp]
	mov	rdi, rax
	call	generateArray@PLT
	cmp	DWORD PTR -48[rbp], 0
	je	.L11
	mov	edx, DWORD PTR -56[rbp]
	mov	eax, DWORD PTR -52[rbp]
	sub	edx, eax
	mov	rax, QWORD PTR -16[rbp]
	mov	esi, edx
	mov	rdi, rax
	call	writeArray@PLT
	jmp	.L12
.L11:
	mov	edx, DWORD PTR -56[rbp]
	mov	eax, DWORD PTR -52[rbp]
	mov	ecx, edx
	sub	ecx, eax
	mov	rdx, QWORD PTR -32[rbp]
	mov	rax, QWORD PTR -16[rbp]
	mov	esi, ecx
	mov	rdi, rax
	call	writeArrayFile@PLT
	mov	rax, QWORD PTR -32[rbp]
	mov	rdi, rax
	call	fclose@PLT
.L12:
	mov	rax, QWORD PTR -16[rbp]
	mov	rdi, rax
	call	free@PLT
	mov	rax, QWORD PTR -24[rbp]
	mov	rdi, rax
	call	free@PLT
	mov	eax, 0
.L13:
	mov	rcx, QWORD PTR -8[rbp]
	xor	rcx, QWORD PTR fs:40
	je	.L14
	call	__stack_chk_fail@PLT
.L14:
	leave
	ret
	.size	main, .-main
	.ident	"GCC: (Ubuntu 9.4.0-1ubuntu1~20.04.1) 9.4.0"
	.section	.note.GNU-stack,"",@progbits
