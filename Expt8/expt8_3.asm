section .data
    message db 'Enter number of elements : '
    messagelen equ $-message

		message2 db 'Enter elements : '
    messagelen2 equ $-message2

		message3 db 'Count of even numbers : '
    messagelen3 equ $-message3
	
		message4 db 'Count of odd numbers : '
    messagelen4 equ $-message4

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
		n_odd resb 10
		n_even resb 10

section .text
		global _start

_start:
	write message,messagelen
	read num,10

	write message2,messagelen2
	
	mov byte[n_even],0
	mov byte[n_odd],0
	mov byte[i],0
	mov esi,array

	input:
		read element,2
		mov ebx,[element]
		mov [esi],ebx	
		inc esi
		inc byte[i]

		mov al,[i]
		mov bl,[num]
		sub bl,'0'
		CMP al,bl
		JL input

		mov byte[i],0
		mov esi,array

  check:
		mov al,[esi]
		mov bl,'2'
		sub bl,'0'
		div bl

		cmp ah,0
		JE even
		JMP odd

	even:
		inc byte[n_even]
	JMP loop

	odd:
		inc byte[n_odd]
		JMP loop

	loop:
		inc esi
		inc byte[i]
		mov al,[i]
		mov bl,[num]
		sub bl,'0'
		cmp al,bl
		JL check
		JE output

	output:

		add[n_even],byte '0'
		add[n_odd],byte '0'

		write message3,messagelen3
		write n_even,5
		write newline,1

		write message4,messagelen4
		write n_odd,5

		write newline,1

mov eax,1
mov ebx,0
int 80h
