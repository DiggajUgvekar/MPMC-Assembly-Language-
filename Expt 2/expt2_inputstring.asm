section .data
		sys_read equ 2
		sys_in equ 3
		sys_write equ 4
		sys_exit equ 1
		stdin equ 0
		stdout equ 1
		message db 'Enter your name : ',10
		messagelen equ $-message

		message2 db 'Name is ',10
		messagelen2 equ $-message2

section .bss
		num resw 20

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
			mov ecx,message2
			mov edx,messagelen2
			int 80h

			mov eax,sys_write
			mov ebx,stdout
			mov ecx,num
			int 80h

	mov eax,sys_exit
	mov ebx, 0
	int 80h
			
