section .data
		sys_read equ 2
		sys_in equ 3
		sys_write equ 4
		sys_exit equ 1
		stdin equ 0
		stdout equ 1
		
		message db 'Enter number : ',10
		messagelen equ $-message

		message2 db 'Numbers are : ',10
		messagelen2 equ $-message2

section .bss
		num1 resb 4
		num2 resb 4

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
	mov ecx,num1
	int 80h

	mov eax,sys_write
	mov ebx,stdout
	mov ecx,message
	mov edx,messagelen
	int 80h

	mov eax,sys_in
	mov ebx,sys_read
	mov ecx,num2
	int 80h

	mov eax,sys_write
	mov ebx,stdout
	mov ecx,message2
	mov edx,messagelen2
	int 80h

	mov eax,sys_write
	mov ebx,stdout
	mov ecx,num1
	mov edx,num2
	int 80h

	mov eax,sys_exit
	mov ebx, 0
	int 80h
