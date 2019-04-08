	[bits 64]

section .texte
	GLOBAL strncmp:function

strncmp:
	push rbp			;Prologue
	mov rbp, rsp			;Prologue

	cmp rdi, 0			;Check if we receive a null parameter in rdi
	je null_params			;If we receive a null parameter we jump to null_params

	cmp rsi, 0			;Check if we receive a null parameter in rsi
	je null_params			;If we receive a null parameter we jump to null_params

	cmp rdx, 0			;Check if rdi and rsi are equal
	jne before_while		;If they are not equal jump to not_equal

	mov rsp, rbp			;Prologue
	pop rbp				;Prologue

	mov rax, 0			;Value of return is 0
	ret				;Return rax to the function which call strcmp

null_params:
	mov rsp, rbp			;Epilogue
	pop rbp				;Epilogue

	mov rax, -1			;Value of return is -1
	ret				;Return rax to the function which call strcmp

before_while:
	xor rcx, 0			;Initialize the incrementor to -1
	call get_ret_value		;Call the function which get which value to return

	mov rsp, rbp			;Epilogue
	pop rbp				;Epilogue

	ret

get_ret_value:
	mov r9b, byte[rdi + rcx]
	mov r8b, byte[rsi + rcx]	;Move one byte of rsi in a one byte register

	sub r9b, r8b			;Compare one bye of rdi with the one byte register
	cmp r9b, 0
	jne exit_program
	inc rcx				;Increment rcx
	cmp rcx, rdx
	je exit_program
	jmp get_ret_value		;Jump again to get_ret_value because the two byte are the same

exit_program:

	movsx rax, r9b

	ret