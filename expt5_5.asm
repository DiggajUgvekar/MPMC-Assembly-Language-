section .data

		message db 'Enter a num : ',10
		messagelen equ $-message

		addtext db 'The Addition is '
		addtextlen equ $-addtext

		subtext db 'The Subtraction is '
		subtextlen equ $-subtext

		multext db 'The Multiplication is '
		multextlen equ $-multext

		quotext db 'The Quotient is '
		quotextlen equ $-quotext

		remtext db 'The Remainder is '
		remtextlen equ $-remtext

		newline db '',10
		newlinelen equ $-newline


section .bss
		num1 resb 10
		num2 resb 10
		result resb 10	
		rem resb 10	

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

%macro addition 3
	mov eax,[%1]
	sub eax,'0'

	mov ebx,[%2]
	sub ebx,'0'

	add eax,ebx
	add eax,'0'
	mov [%3],eax
%endmacro

%macro subtraction 3
	mov eax,[%1]
	sub eax,'0'

	mov ebx,[%2]
	sub ebx,'0'

	sub eax,ebx
	add eax,'0'
	mov [%3],eax
%endmacro

%macro multiplication 3
mov eax,[%1]
	sub eax,'0'

	mov ebx,[%2]
	sub ebx,'0'

	mul ebx
	add eax,'0'
	mov [multi],eax
%endmacro

%macro division 4
	mov al,[%1]
	sub al,'0'

	mov bl,[%2]
	sub bl,'0'

	div bl
	add al,'0'
	mov [%3],al
	add ah,'0'
	mov [%4],ah
%endmacro



section .text
		GLOBAL _start

_start:
	write message,messagelen
	read num1, 5
	write message,messagelen
	read num2, 5
	
		
	write addtext,addtextlen
	addition num1,num2,result
	write result,1
	write newline,newlinelen

	write subtext,subtextlen
	subtraction num1,num2,result
	write result,1
	write newline,newlinelen

	write multext,multextlen
	multiplication num1,num2,result
	write result,1
	write newline,newlinelen

	write quotext,quotextlen
	division num1,num2,result,rem
	write result,1
	write newline,newlinelen
	write remtext,remtextlen
	write rem,1

mov eax, 1
mov ebx, 0
int 80h	

