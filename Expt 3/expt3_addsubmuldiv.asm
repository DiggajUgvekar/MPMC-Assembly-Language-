section .data

		sys_write equ 4
		sys_exit equ 1
		stdin equ 0
		stdout equ 1

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

		remtext db 'The Reminder is '
		remtextlen equ $-remtext

		newline db '',10
		newlinelen equ $-newline

		sys_read equ 2
		sys_in equ 3

section .bss
		num1 resb 10
		num2 resb 10
		addition resb 10
		subt resb 10
		multi resb 10
		quo resb 10	
		rem resb 10	

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
			mov edx,10
			int 80h

			mov eax,sys_write
			mov ebx,stdout
			mov ecx,message
			mov edx,messagelen
			int 80h

			mov eax,sys_in
			mov ebx,sys_read
			mov ecx,num2
			mov edx,10
			int 80h

			;addition
			mov eax,[num1]
			sub eax,'0'

			mov ebx,[num2]
			sub ebx,'0'

			add eax,ebx
			add eax,'0'
			mov [addition],eax

			mov eax,sys_write
			mov ebx,stdout
			mov ecx,addtext
			mov edx,addtextlen
			int 80h

			mov eax,sys_write
			mov ebx,stdout
			mov ecx,addition
			mov edx,1
			int 80h
			
			;newline
			mov eax,sys_write
			mov ebx,stdout
			mov ecx,newline
			mov edx,newlinelen
			int 80h

			;subtraction
			mov eax,[num1]
			sub eax,'0'

			mov ebx,[num2]
			sub ebx,'0'

			sub eax,ebx
			add eax,'0'
			mov [subt],eax

			mov eax,sys_write
			mov ebx,stdout
			mov ecx,subtext
			mov edx,subtextlen
			int 80h

			mov eax,sys_write
			mov ebx,stdout
			mov ecx,subt
			mov edx,1
			int 80h

			;newline
			mov eax,sys_write
			mov ebx,stdout
			mov ecx,newline
			mov edx,newlinelen
			int 80h

			;multiplication
			mov eax,[num1]
			sub eax,'0'

			mov ebx,[num2]
			sub ebx,'0'

			mul ebx
			add eax,'0'
			mov [multi],eax

			mov eax,sys_write
			mov ebx,stdout
			mov ecx,multext
			mov edx,multextlen
			int 80h

			mov eax,sys_write
			mov ebx,stdout
			mov ecx,multi
			mov edx,1
			int 80h
			
			;newline
			mov eax,sys_write
			mov ebx,stdout
			mov ecx,newline
			mov edx,newlinelen
			int 80h

			;division
			mov al,[num1]
			sub al,'0'

			mov bl,[num2]
			sub bl,'0'

			div bl
			add al,'0'
			mov [quo],al
			add ah,'0'
			mov [rem],ah

			mov eax,sys_write
			mov ebx,stdout
			mov ecx,quotext
			mov edx,quotextlen
			int 80h

			mov eax,sys_write
			mov ebx,stdout
			mov ecx,quo
			mov edx,1
			int 80h
			
			;newline
			mov eax,sys_write
			mov ebx,stdout
			mov ecx,newline
			mov edx,newlinelen
			int 80h

			mov eax,sys_write
			mov ebx,stdout
			mov ecx,remtext
			mov edx,remtextlen
			int 80h

			mov eax,sys_write
			mov ebx,stdout
			mov ecx,rem
			mov edx,1
			int 80h

			;newline
			mov eax,sys_write
			mov ebx,stdout
			mov ecx,newline
			mov edx,newlinelen
			int 80h
	mov eax,sys_exit
	mov ebx, 0
	int 80h

