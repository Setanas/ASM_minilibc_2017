	[bits 64]

section .text
	GLOBAL strlen:function

strlen:
	push rbp		;Prologue
	mov rbp, rsp		;Prologue

	cmp rdi, 0		;Check if we receive a null parameter
	jne after_check		;If we don't receive a null parameter we go to after_check

	mov rax, 0		;Value of return is 0
	mov rsp, rbp		;Epilogue
	pop rbp			;Epilogue

	ret			;Return rax to the function which call strlen

after_check:	
	mov rsi, -1		;Initialize the register rsi to -1 to increment in the while
	call while_loop 	;We call the while_loop

	mov rsp, rbp		;Epilogue
	pop rbp			;Epilogue

	ret			;Return rax to the function which call strlen

while_loop:
	inc rsi			;Increment rsi

	cmp byte[rdi + rsi], 0	;We check if rdi[rsi] != '\0'
	jne while_loop		;If rdi[rsi] == '\0' we jump to while_loop

	mov rax, rsi		;Mov the incrementor to rax
	ret			;Return rax to after_check