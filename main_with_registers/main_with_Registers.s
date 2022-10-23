	.file	"main.c"
	.intel_syntax noprefix
	.text
	.section	.rodata
.LC0:
	.string	"%d"
	.text
	.globl	readArray 
	.type	readArray, @function
	# начало работы функции readArray
readArray:
	push	rbp
	mov	rbp, rsp
	sub	rsp, 32
	# переменную cout, переданную в функцию кладём на стек функции по смещению -20[rbp]
    # переменную cout, переданную в функцию положим в регистр R12
	mov	r12d, edi
	# адрес массива, переданный в функцию кладём на стек функции по смещению -32[rbp]
    # адрес массива, переданный в функцию положим в регистр R13
	mov	r13, rsi
	# кладем 0 в локальную переменную i, которая на ходится на стеке по смещению -4[rbp]
    # пусть локальная переменная i, будет располагаться в регистре R14
	mov	r14d, 0
	jmp	.L2
.L3:
	# считывание и запись в массив значений циклом
	mov	eax, r14d
	cdqe
	lea	rdx, 0[0+rax*4]
	mov	rax, r13
	add	rax, rdx
	mov	rsi, rax
	lea	rdi, .LC0[rip]
	mov	eax, 0
	call	__isoc99_scanf@PLT
	add	r14d, 1
.L2:
	# условие на продолжение выполнения цикла
	mov	eax, r14d
	# сравниваем i с копией cout, переданной в функцию
	cmp	eax, r12d
	jl	.L3
	nop
	nop
	leave
	ret
	.size	readArray, .-readArray
	.globl	findMin
	.type	findMin, @function

findMin:
	#начало работы функции findMin
	push	rbp
	mov	rbp, rsp
	# кладём переменную size_array на стек функции со смещением -20[rbp]
    # положим переменную size_array в регистр R12
	mov	r12d, edi
	# кладём  адрес на массив array на стек функции со смещением -32[rbp]
    # положим адрес на массив array в регистр R13
	mov	r13, rsi
	# кладём  адрес на переменную minValueAmount  на стек функции по смещению  
	# и сразу присваиваем переменной значение 1
    # положим адрес на переменную minValueAmount в регистр R14
	mov	r14, rdx
	mov	rax, r14
	mov	DWORD PTR [rax], 1
	# кладём в локальную переменную valueMin первый элемент массива array
	mov	rax, r13
	mov	eax, DWORD PTR [rax]
    # локальная переменная valueMin находилась на стеке по смещению -8[rbp]
    # положим её в регистр R15
	mov	r15d, eax # локальная переменная valueMin
	# кладём в локальную переменную i значение 1, переменная i расположена на стеке по смещению -4[rbp]
    # положим лок. переменную i в регистр ebx
	mov	ebx, 1
	jmp	.L5
.L8:
	mov	eax, ebx
	cdqe
	lea	rdx, 0[0+rax*4]
	mov	rax, r13
	add	rax, rdx
	mov	eax, DWORD PTR [rax]
	cmp	r15d, eax
	jle	.L6
	mov	eax, ebx
	cdqe
	lea	rdx, 0[0+rax*4]
	mov	rax, r13
	add	rax, rdx
	mov	eax, DWORD PTR [rax]
	mov	r15d, eax
	mov	rax, r14
	mov	DWORD PTR [rax], 1
	jmp	.L7
.L6:
	mov	eax, ebx
	cdqe
	lea	rdx, 0[0+rax*4]
	mov	rax, r13
	add	rax, rdx
	mov	eax, DWORD PTR [rax]
	cmp	r15d, eax
	jne	.L7
	mov	rax, r14
	mov	eax, DWORD PTR [rax]
	lea	edx, 1[rax]
	mov	rax, r14
	mov	DWORD PTR [rax], edx
.L7:
	add	ebx, 1
.L5:
	mov	eax, ebx
	cmp	eax, r12d
	jl	.L8
	# кладём в eax значение локальное переменной valueMin для возарта его
	# в вызывающую функцию
	mov	eax, r15d
	pop	rbp
	ret
	.size	findMin, .-findMin
	.globl	generateArray
	.type	generateArray, @function
generateArray:
	# начало работы функции generateArray
	push	rbp
	mov	rbp, rsp
	# кладём адрес на массив array на стек по смещению -24[rbp]
    # положим адрес на массив array в регистр R12
	mov	r12, rdi
	# кладём адрес на массив new_array на стек по смещению -32[rbp]
    # положим адрес на массив new_array в регистр R13
	mov	r13, rsi
	# кладём переменную size_array на стек по смещению -36[rbp]
    # положим переменную size_array в  регистр R14
	mov	r14d, edx
	# кладём переменную min_value на стек по смещению -40[rbp]
    # положим переменную min_value в регистр R15
	mov	r15d, ecx
	# задаём локальную переменную i в функции и присваиваем ей 0 она лежит по смещению -8[rbp]
    # положим переменную i в регистр rbx
	mov	ebx, 0
	# задаём локальную переменную j в функции и присваиваем ей 0
	mov	DWORD PTR -4[rbp], 0
	jmp	.L11
.L13:
	mov	eax, DWORD PTR -4[rbp]
	cdqe
	lea	rdx, 0[0+rax*4]
	mov	rax, r12
	add	rax, rdx
	mov	eax, DWORD PTR [rax]
	cmp	r15d, eax
	je	.L12
	mov	eax, DWORD PTR -4[rbp]
	cdqe
	lea	rdx, 0[0+rax*4]
	mov	rax, r12
	add	rax, rdx
	mov	edx, ebx
	movsx	rdx, edx
	lea	rcx, 0[0+rdx*4]
	mov	rdx, r13
	add	rdx, rcx
	mov	eax, DWORD PTR [rax]
	mov	DWORD PTR [rdx], eax
	add	ebx, 1
.L12:
	add	DWORD PTR -4[rbp], 1
.L11:
	mov	eax, DWORD PTR -4[rbp]
	cmp	eax, r14d
	jl	.L13
	nop
	nop
	pop	rbp
	ret
	.size	generateArray, .-generateArray
	.section	.rodata
.LC1:
	.string	"%d "
	.text
	.globl	writeArray
	.type	writeArray, @function
writeArray:
	# начало работы функции writeArray
	push	rbp
	mov	rbp, rsp
	sub	rsp, 32
	# кладём адрес на массив new_array -24[rbp]
    # положим адрес на массив new_array в регистр R12
	mov	r12, rdi
	# кладём размер этого массива на стек по смещению -28[rbp]
    # положим размер массива в регистр R13
	mov	r13d, esi
	# задаём локальную переменную i и присваиваем ей 0 она лежит по смещению -4[rbp]
    # положим переменную i в регистр R14
	mov	r14d, 0
	jmp	.L15
.L16:
	mov	eax, r14d
	cdqe
	lea	rdx, 0[0+rax*4]
	mov	rax, r12
	add	rax, rdx
	mov	eax, DWORD PTR [rax]
	mov	esi, eax
	lea	rdi, .LC1[rip]
	mov	eax, 0
	call	printf@PLT
	add	r14d, 1
.L15:
	mov	eax, r14d
	cmp	eax, r13d
	jl	.L16
	nop
	nop
	leave
	ret
	.size	writeArray, .-writeArray
	.section	.rodata
.LC2:
	.string	"Not enough arguments!"
	.text
	.globl	main
	.type	main, @function
	# начало функции main
main:
	# пушим указатель фрейма
	push	rbp
	mov	rbp, rsp
	# расширяем стек функции для локальных переменных
	sub	rsp, 48
	#  кладем кнарейку на стек функции
	mov	rax, QWORD PTR fs:40
	mov	QWORD PTR -8[rbp], rax
	xor	eax, eax
	# в переменную minValueAmount кладём 0
	mov	DWORD PTR -32[rbp], 0 # minValueAmount
	#  кладем значение адреса переменной size_array в rax
	lea	rax, -36[rbp] # size_array
	mov	rsi, rax
	# передача адреса на форматную строку
	lea	rdi, .LC0[rip]
	mov	eax, 0
	call	__isoc99_scanf@PLT
	# проверяем что значение size_array > 0
	mov	eax, DWORD PTR -36[rbp]
	test	eax, eax
	jg	.L18
	lea	rdi, .LC2[rip]
	mov	eax, 0
	call	printf@PLT
	mov	eax, 0
	jmp	.L20
.L18:
	# передаём в функцию malloc переменную 4*size_array - количество байт
	mov	eax, DWORD PTR -36[rbp]
	sal eax,2
	cdqe
	mov	rdi, rax
	#  сам вызов
	call	malloc@PLT
	# кладем адрес на выделенную память в указатель array
	mov	QWORD PTR -24[rbp], rax
	# кладём переменные size_array, array в регистры для передачи в функцию readArray
	mov	eax, DWORD PTR -36[rbp] # size_array
	mov	rdx, QWORD PTR -24[rbp] # array
	mov	rsi, rdx
	mov	edi, eax
	call	readArray
	# кладём переменные size_array,array,&minValueAmount в регистры для передачи в функцию findMin
	mov	eax, DWORD PTR -36[rbp]
	lea	rdx, -32[rbp]
	mov	rcx, QWORD PTR -24[rbp]
	mov	rsi, rcx
	mov	edi, eax
	call	findMin
	# кладём в переменную valueMin минимальное число
	mov	DWORD PTR -28[rbp], eax #  valueMin 
	# вычисляем size_array - minValueAmount
	mov	edx, DWORD PTR -36[rbp]
	mov	eax, DWORD PTR -32[rbp] # minValueAmount
	sub	edx, eax
	# кладём в регистр разницу для выделения динамической памяти
	mov	eax, edx
	sal eax,2
	cdqe
	mov	rdi, rax
	call	malloc@PLT
	# кладем адрес на выделенную память в указатель new_array
	mov	QWORD PTR -16[rbp], rax #  new_array  
	# кладём переменные array, new_array, size_array, valueMin в регистры для передачи в функцию generateArray
	mov	edx, DWORD PTR -36[rbp]
	mov	ecx, DWORD PTR -28[rbp]
	mov	rsi, QWORD PTR -16[rbp]
	mov	rax, QWORD PTR -24[rbp]
	mov	rdi, rax
	call	generateArray
	# кладём переменные new_array, (size_array - minValueAmount) в регистры для передачи в функцию 
	# writeArray
	mov	edx, DWORD PTR -36[rbp]
	mov	eax, DWORD PTR -32[rbp]
	sub	edx, eax
	mov	rax, QWORD PTR -16[rbp]
	mov	esi, edx
	mov	rdi, rax
	call	writeArray
	# кладем указатели на динамическую память и освобождаем её free
	mov	rax, QWORD PTR -16[rbp]
	mov	rdi, rax
	call	free@PLT
	mov	rax, QWORD PTR -24[rbp]
	mov	rdi, rax
	call	free@PLT
	# кладём в регистр eax возвращаемое функцией main значение
	mov	eax, 0
.L20:
	# проверка стека функции на целостность (канарейка)
	mov	rcx, QWORD PTR -8[rbp]
	xor	rcx, QWORD PTR fs:40
	je	.L21
	call	__stack_chk_fail@PLT
.L21:
	leave
	ret
	.size	main, .-main
	.ident	"GCC: (Ubuntu 9.4.0-1ubuntu1~20.04.1) 9.4.0"
	.section	.note.GNU-stack,"",@progbits
