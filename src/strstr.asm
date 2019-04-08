	[bits 64]

section .text
	GLOBAL strstr:function

strstr:
	push rbp
	mov rbp, rsp

	cmp rdi, 0
	je null_parameter

	cmp rsi, 0
	jne after_check

	mov rax, 0

	mov rsp, rbp
	pop rbp

	ret

null_parameter:
	mov rax, 0

	mov rsp, rbp
	pop rbp

	ret

after_check:
	xor rcx, rcx
	xor rdx, rdx

	jmp while_loop

while_loop:
	cmp byte[rdi], 0
	je exit_function

	mov r8b, [rdi]
	mov r9b, [rsi]

	cmp r8b, r9b
	je find_all_string

	inc rdi
	jmp while_loop

find_all_string:
	cmp byte[rsi + rcx], 0
	je string_found

	mov r8b, [rdi + rcx]
	mov r9b, [rsi + rcx]

	cmp r8b, r9b
	jne not_an_occurence

	inc rcx
	jmp find_all_string

string_found:
	mov rax, rdi

	mov rsp, rbp
	pop rbp

	ret

not_an_occurence:
	xor rcx, rcx
	inc rdi
	jmp while_loop

exit_function:
	mov rax, 0

	mov rsp, rbp
	pop rbp

	ret