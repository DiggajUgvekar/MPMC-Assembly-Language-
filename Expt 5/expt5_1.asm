section .data
		message1 db '12345',10
		messagelen1 equ $-message1

%macro write 2
		mov eax, 4
		mov ebx, 1
		mov ecx, %1
		mov edx, %2
		int 80h
%endmacro

section .text
    global _start

_start:
	write message1, messagelen1

mov eax, 1
mov ebx, 0
int 80h
