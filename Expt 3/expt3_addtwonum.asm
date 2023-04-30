section .data

		sys_write equ 4
		sys_exit equ 1
		stdin equ 0
		stdout equ 1

		message db 'Enter a num : ',10
		messagelen equ $-message

		message2 db 'The Sum is '
		messagelen2 equ $-message2

		newline db '',10
		newlinelen equ $-newline

		sys_read equ 2
		sys_in equ 3

section .bss
		num resb 10
		num2 resb 10
		result resb 10

section .text
		GLOBAL _start

_start:
	mov eax,sys_write
	mov ebx,stdout
	mov ecx,message
	mov edx,messagelen
	int 80h

	mov eax,sys_in
	mov ebx,sys_read
	mov ecx,num
	mov edx,10
	int 80h

	mov eax,sys_write
	mov ebx,stdout
	mov ecx,message
	mov edx,messagelen
	int 80h

	mov eax,sys_in
	mov ebx,sys_read
	mov ecx,num2
	mov edx,10
	int 80h
	

	
	mov eax,[num]
	sub eax,'0'

	mov ebx,[num2]
	sub ebx,'0'

	add eax,ebx
	add eax,'0'
	mov [result],eax

	mov eax,sys_write
	mov ebx,stdout
	mov ecx,message2
	mov edx,messagelen2
	int 80h

	mov eax,sys_write
	mov ebx,stdout
	mov ecx,result
	mov edx,1
	int 80h

	mov eax,sys_write
	mov ebx,stdout
	mov ecx,newline
	mov edx,newlinelen
	int 80h

	mov eax,sys_exit
	mov ebx, 0
	int 80h
