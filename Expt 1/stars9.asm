section .data
		stars times 9 db '*'

section .text
		GLOBAL _start

_start:
		mov edx,9
		mov ecx,stars
		mov ebx,1
		mov eax,4
		int 80h

mov eax,1
mov ebx,0
int 80h
