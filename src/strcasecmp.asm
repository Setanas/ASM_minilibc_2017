	[bits 64]

section .texte
	GLOBAL strcasecmp:function

strcasecmp:
	push rbp
	mov rbp, rsp

	cmp rdi, 0
	je null_params

	cmp rsi, 0
	jne before_while

	mov rsp, rbp
	pop rbp

	mov rax, 0
	ret

null_params:
	mov rsp, rbp
	pop rbp

	mov rax, -1
	ret

before_while:
	xor rcx, 0
	call get_ret_value

	mov rsp, rbp
	pop rbp

	ret

get_ret_value:
	mov r9b, byte[rdi + rcx]
	mov r8b, byte[rsi + rcx]

	cmp r9b, 0
	je end_string

	cmp r9b, 65
	jge superior_r9b

	cmp r8b, 65
	jge superior_r8b

	sub r9b, r8b
	cmp r9b, 0
	jne exit_program

	inc rcx
	jmp get_ret_value

end_string:
	cmp r8b, 0
	je exit_program

	cmp r8b, 65
	jge superior_r8b

	sub r9b, r8b
	jmp exit_program

superior_r9b:
	cmp r9b, 90
	jbe r9b_is_uppercase

	cmp r8b, 65
	jge superior_r8b

	sub r9b, r8b
	cmp r9b, 0
	jne exit_program

	inc rcx
	jmp get_ret_value



r9b_is_uppercase:
	add r9b, 32

	cmp r8b, 65
	jge superior_r8b

	sub r9b, r8b
	cmp r9b, 0
	jne exit_program

	inc rcx
	jmp get_ret_value

superior_r8b:
	cmp r8b, 90
	jbe r8b_is_uppercase

	sub r9b, r8b
	cmp r9b, 0
	jne exit_program

	inc rcx
	jmp get_ret_value

r8b_is_uppercase:
	add r8b, 32

	sub r9b, r8b
	cmp r9b, 0
	jne exit_program

	inc rcx
	jmp get_ret_value


exit_program:
	movsx rax, r9b

	ret