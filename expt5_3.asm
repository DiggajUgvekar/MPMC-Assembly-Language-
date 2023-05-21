section .data
		message1 db 'Enter number : ',10
		messagelen1 equ $-message1

		message2 db 'Entered number is '
		messagelen2 equ $-message2
		
		newline db '',10
		newlinelen equ $-newline

%macro write 2
		mov eax, 4
		mov ebx, 1
		mov ecx, %1
		mov edx, %2
		int 80h
%endmacro

%macro read 2
		mov eax, 3
		mov ebx, 2
		mov ecx, %1
		mov edx, %2
		int 80h
%endmacro

section .bss
		num resb 4

section .text
    global _start

_start:
		write message1, messagelen1
		read num, 4
		write message2, messagelen2
		write num, 4
		write newline, newlinelen

mov eax, 1
mov ebx, 0
int 80h
