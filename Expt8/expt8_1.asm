section .data
    message db 'Enter number of elements : '
    messagelen equ $-message

		message2 db 'Enter elements : '
    messagelen2 equ $-message2

		message3 db 'Contents of Array : '
    messagelen3 equ $-message3
	
		newline db '',10
		newlinelen equ $-newline
array times 10 dw 0
len equ 10

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
		num resb 10
		i resb 10
		element resb 10

section .text
		global _start

_start:
	write message,messagelen
	read num,10

	write message2,messagelen2
	mov byte[i],0

	mov esi,array

input:

	read element,2
	mov ebx,[element]
	mov[esi],ebx

	inc esi
	inc byte[i]

	mov al,[i]
	mov bl,[num]
	sub bl,'0'
	CMP al,bl
	JE exit
	JMP input

exit:

	write message3,messagelen3
	mov byte[i],0
	mov esi,array

out:

	mov ebx,[esi]
	mov [element],ebx
	write newline,1
	write element,1
	
	
	inc esi
  inc byte[i]

	mov al,[i]
	mov bl,[num]
	sub bl,'0'
	CMP al,bl

	JL out

write newline,1
mov eax,1
mov ebx,0
int 80h

	

