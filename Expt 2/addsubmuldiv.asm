section .data
		sys_read equ 2
		sys_in equ 3
		sys_write equ 4
		sys_exit equ 1
		stdin equ 0
		stdout equ 1

		message db 'Enter num1  : ',10
		messagelen equ $-message

		message2 db 'Enter num2  : ',10
		messagelen2 equ $-message2
		
		newline db '',10
		newlinelen equ $-newline
		
		addtext db 'Addition of num1 and num2 is : '
		addtextlen equ $-addtext
		
		subtext db 'Subtraction of num1 and num2 is : '
		subtextlen equ $-subtext
		
		multext db 'Multiplication of num1 and num2 is : '
		multextlen equ $-multext
		
		quotext db 'Quotient of num1 and num2 is : '
		quotextlen equ $-quotext
		
		remtext db 'Reminder of num1 and num2 is : '
		remtextlen equ $-remtext
		
section .bss
		num1 resb 5
		num2 resb 5
		sum resb 5
		subt resb 5
		multi resb 5
		quo resb 5
		rem resb 5
section .text
		global _start

_start:
	mov eax,sys_write
	mov ebx,stdout
	mov ecx,message
	mov edx,messagelen
	int 80h

	mov eax,sys_in
	mov ebx,sys_read
	mov ecx,num1
	mov edx,2
	int 80h

	mov eax,sys_write
	mov ebx,stdout
	mov ecx,message2
	mov edx,messagelen2
	int 80h

	mov eax,sys_in
	mov ebx,sys_read
	mov ecx,num2
	mov edx,2
	int 80h
	
	;addition
	mov eax,[num1]
	sub eax,'0'

	mov ebx,[num2]
	sub ebx,'0'

	add eax,ebx
	add eax,'0'
	mov [sum],eax
	
	
	mov eax,sys_write
	mov ebx,stdout
	mov ecx,addtext
	mov edx,addtextlen
	int 80h

	mov eax,sys_write
	mov ebx,stdout
	mov ecx,sum
	mov edx,1
	int 80h
	
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
	
	mov eax,sys_write
	mov ebx,stdout
	mov ecx,newline
	mov edx,newlinelen
	int 80h

    ;multiplication
	mov al,[num1]
	sub al,'0'

	mov bl,[num2]
	sub bl,'0'

	mul bl
	add al,'0'
	mov [multi],al

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

    mov eax,sys_write
	mov ebx,stdout
	mov ecx,newline
	mov edx,newlinelen
	int 80h
	
	;Quotient & Reminder
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

	mov eax,sys_exit
	mov ebx, 0
	int 80h
