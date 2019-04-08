	[bits 64]

section .text
	GLOBAL strcspn:function

strcspn:
	push rbp
	mov rbp, rsp

	mov rax, 0
	xor rcx, rcx
	xor r8, r8

	cmp rdi, 0
	je exit_function

	cmp rsi, 0
	je exit_function

	jmp count_occurence

count_occurence:
	mov r8b, byte[rdi + rax]
	
	cmp r8b, 0
	je exit_function

	xor rdx, rdx
	jmp find_occurence

find_occurence:
	cmp byte[rsi + rdx], 0
	je inc_rax_jmp_to_count

	cmp byte[rsi + rdx], r8b
	je exit_function

	inc rdx
	jmp find_occurence

inc_rax_jmp_to_count:
	inc rax

	jmp count_occurence

exit_function:
	mov rsp, rbp
	pop rbp

	ret

