	[bits 64]

section .text
	GLOBAL rindex:function

rindex:
	push rbp
	mov rbp, rsp

	cmp rdi, 0
	jne after_check

	mov rax, 0
	mov rsp, rbp
	pop rbp

	ret

after_check:
	xor rcx, rcx
	call while_loop

	mov rsp, rbp
	pop rbp

	ret

while_loop:
	inc rdi
	inc rcx

	cmp byte[rdi], 0
	je find_last_occurence


	jmp while_loop

find_last_occurence:
	cmp byte[rdi], sil
	je found_it

	cmp rcx, 0
	je no_occurence

	dec rcx
	dec rdi

	jmp find_last_occurence

no_occurence:
	mov rax, 0
	ret

found_it:
	mov rax, rdi
	ret