	[bits 64]

section .text
	GLOBAL memcpy:function

memcpy:
	push rbp		;Prologue
	mov rbp, rsp		;Prologue

	cmp rdi, 0		;Check if we receive a null parameter
	jne after_check		;If we don't receive a null parameter, jump to after_check

	xor rax, rax		;Value of return is 0, rax = 0
	mov rsp, rbp		;Epilogue
	pop rbp			;Epilogue

	ret			;Return rax to the function which call memcpy

after_check:
	mov rax, rdi		;Put the address of rdi in rax
	cmp rdx, 0		;Compare if rdx == 0
	jne before_copy		;If rdx != 0 jump to before_while

	xor rax, rax		;Value of return is 0 (we put 0 in rax)
	mov rsp, rbp		;Epilogue
	pop rbp			;Epilogue

	ret			;Return rax to the function which call memcpy

before_copy:
	dec rdx			;Decrement rdx
	cmp rsi, 0		;Compare if rsi is NULL
	jne copy_while		;Jump to copy_while if rsi != NULL

	xor rax, rax		;Value of return is 0 (we put 0 in rax)
	mov rsp, rbp		;Epilogue
	pop rbp			;Epilogue

	ret			;Return rax to the function which call memcpy

copy_while:
	mov cl, byte[rsi + rdx]	;Move one byte of rdi[rdx] to one byte register cl
	mov [rdi + rdx], cl	;Move the one byte register cl in rdi[rdx]
	dec rdx			;Decrement rdx
	cmp rdx, 0		;Compare if rdx == 0
	je exit_function	;If rdx == 0 jump to copy_while
	jmp copy_while		;Else rego to copy_while

exit_function:
	mov cl, byte[rsi + rdx]	;Move one byte of rdi[rdx] to one byte register cl
	mov [rdi + rdx], cl	;Move the one byte register cl in rdi[rdx]

	mov rsp, rbp		;Epilogue
	pop rbp			;Epilogue

	ret			;Return to the function which call memcpy