	[bits 64]

section .text
	GLOBAL strchr:function

strchr:
	push rbp		;Prologue
	mov rbp, rsp		;Prologue

	cmp rdi, 0		;Check if we receive a null parameter
	jne after_check		;If we don't receive a null parameter we go to after_check

	mov rax, 0		;Value of return is 0
	mov rsp, rbp		;Epilogue
	pop rbp			;Epilogue

	ret			;Return rax to the function which call strchr

after_check:
	call while_loop 	;We call the while_loop

	mov rsp, rbp		;Epilogue
	pop rbp			;Epilogue

	ret			;Return rax to the function which call strlen

while_loop:
	cmp byte[rdi], 0	;If byte[rdi] == '\0'
	je exit_program		;We jump to exit_program

	cmp byte[rdi], sil	;We compar if byte[rdi] == sil (which contain the char to find)
	je found		;If we find it we jump to found

	inc rdi			;Increment rdi
	jmp while_loop		;If not we rejump to while_loop


exit_program:
	mov rax, 0		;We mov the adress of the byte where we found rsi in rax
	ret			;We return rax to after_check

found:
	mov rax, rdi		;Move the address of the occurence in rax
	ret			;We return rax to after_check