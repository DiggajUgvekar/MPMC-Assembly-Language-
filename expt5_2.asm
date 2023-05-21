section .data
		message1 db 'Hello World',10
		messagelen1 equ $-message1
		
		message2 db 'New Text',10
		messagelen2 equ $-message2
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
	write message2, messagelen2
mov eax, 1
mov ebx, 0
int 80h
