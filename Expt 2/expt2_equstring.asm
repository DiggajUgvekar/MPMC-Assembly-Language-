section .data
		sys_write equ 4
		sys_exit equ 1
		stdin equ 0
		stdout equ 1

		string db "Microprocessor",10
		stringlen equ $-string
		string2 db "Microcontroller",10
		stringlen2 equ $-string2

section .text
		GLOBAL _start

_start:
	mov eax,sys_write
	mov ebx,stdout
	mov ecx,string
	mov edx,stringlen
	int 80h

	mov eax,sys_write
	mov ebx,stdout
	mov ecx,string2
	mov edx,stringlen
	int 80h

	mov eax,sys_exit
	mov ebx, 0
	int 80h
