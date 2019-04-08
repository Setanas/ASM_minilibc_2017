	[bits 64]

section .texte
	GLOBAL strcmp:function

strcmp:
	push rbp			;Prologue
	mov rbp, rsp			;Prologue

	cmp rdi, rsi			;Check if rdi and rsi are equal
	jne not_equal			;If they are not equal jump to not_equal

	mov rax, 0			;Value of return is 0
	jmp epilogueend

not_equal:
	xor rcx, 0			;Initialize the incrementor to -1
	jmp get_ret_value		;Call the function which get which value to return


get_ret_value:
	mov r9b, byte[rdi + rcx]
	mov r8b, byte[rsi + rcx]	;Move one byte of rsi in a one byte register

	sub r9b, r8b			;Compare one bye of rdi with the one byte register
	cmp r9b, 0
	jne exit_program
	inc rcx				;Increment rcx
	jmp get_ret_value		;Jump again to get_ret_value because the two byte are the same

exit_program:
	movsx rax, r9b

epilogueend:
	mov rsp, rbp			;Epilogue
	pop rbp				;Epilogue

	ret