	[bits 64]

section .text
	GLOBAL memmove:function

memmove:
	push rbp		;Prologue
	mov rbp, rsp		;Prologue

	cmp rdi, 0		;Check if we receive a null parameter
	jne after_check		;If we don't receive a null parameter, jump to after_check

	xor rax, rax		;Value of return is 0, rax = 0
	jmp epilogueend

after_check:
	mov rax, rdi		;Put the address of rdi in rax
	cmp rdx, 0		;Compare if rdx == 0
	jne before_copy		;If rdx != 0 jump to before_while

	xor rax, rax		;Value of return is 0 (we put 0 in rax)
	jmp epilogueend

before_copy:
	cmp rsi, 0		;Compare if rsi is NULL
	jne check_higher	;Jump to check_higher if rsi != NULL

	xor rax, rax		;Value of return is 0 (we put 0 in rax)
	jmp epilogueend

check_higher:
	cmp rdi, rsi
	jg higher

	xor r8, 0
	jmp copy_lower

copy_lower:
	mov cl, byte[rsi + r8]
	mov [rdi + r8], cl
	inc r8
	cmp rdx, r8
	je epilogueend
	jmp copy_lower

higher:
	dec rdx			;Decrement rdx

	jmp copy_higher

copy_higher:
	mov cl, byte[rsi + rdx]	;Move one byte of rdi[rdx] to one byte register cl
	mov [rdi + rdx], cl	;Move the one byte register cl in rdi[rdx]
	dec rdx			;Decrement rdx
	cmp rdx, 0		;Compare if rdx == 0
	je exit_function_higher	;If rdx == 0 jump to copy_higher
	jmp copy_higher		;Else rego to copy_higher

exit_function_higher:
	mov cl, byte[rsi + rdx]	;Move one byte of rdi[rdx] to one byte register cl
	mov [rdi + rdx], cl	;Move the one byte register cl in rdi[rdx]

	jmp epilogueend

epilogueend:
	mov rsp, rbp			;Epilogue
	pop rbp				;Epilogue

	ret