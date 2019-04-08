	[bits 64]

section .text
	GLOBAL memset:function

memset:
	push rbp		;Prologue
	mov rbp, rsp		;Prologue

	cmp rdi, 0		;Check if we receive a null parameter
	jne after_check		;If we don't receive a null parameter we go to after_check
	
	mov rax, 0		;Value of return is 0
	mov rsp, rbp		;Epilogue
	pop rbp			;Epilogue

	ret			;Return rax to the function which call memset

after_check:
	mov rcx, 0		;Initialise the incrementor to 0
	cmp rdx, 0		;Compare if the size rdx == 0
	jne while_loop		;If rdx != 0 jump in while_loop
	
	mov rax, 0		;
	mov rsp, rbp		;Epilogue
	pop rbp			;Epilogue
	ret			;Return to the function calling memset

while_loop:
	cmp rcx, rdx		;Compare if incrementor rcx == rdx
	je exit_program		;If rcx == rdx, jump to exit_program

	mov [rdi], sil		;Mov the character we receive in second parameter in byte[rdi]

	inc rcx			;Increment rcx
	inc rdi			;Increment rdi to mov the pointor

	jmp while_loop		;Jump to the while_loop

exit_program:
	mov rsp, rbp		;Epilogue
	pop rbp			;Epilogue
	ret			;Return to the function calling memset