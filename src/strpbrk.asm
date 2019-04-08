	[bits 64]

section .text
	GLOBAL strpbrk:function

strpbrk:
	push rbp
	mov rbp, rsp

	mov rax, 0

	cmp rdi, 0
	je exit_function

	cmp rsi, 0
	je exit_function

	jmp while_first_string

while_first_string:
	cmp byte[rdi], 0
	je exit_function

	xor rcx, rcx	
	jmp find_occurence_in_second_string

find_occurence_in_second_string:
	mov r8b, byte[rsi + rcx]

	cmp r8b, 0
	je not_found

	cmp byte[rdi], r8b
	je found

	inc rcx
	jmp find_occurence_in_second_string

not_found:
	inc rdi
	jmp while_first_string

found:
	mov rax, rdi
	je exit_function

exit_function:
	mov rsp, rbp
	pop rbp

	ret