section .data
		sys_read equ 2
		sys_in equ 3
		sys_write equ 4
		sys_exit equ 1
		stdin equ 0
		stdout equ 1

		message db 'Enter a num : ',10
		messagelen equ $-message

		message2 db 'The Sum is ',10
		messagelen2 equ $-message2
		

section .bss
		num resb 5
		num2 resb 5
		result resb 5

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
	mov ecx,num
	mov edx,2
	int 80h

	mov eax,sys_write
	mov ebx,stdout
	mov ecx,message
	mov edx,messagelen
	int 80h

	mov eax,sys_in
	mov ebx,sys_read
	mov ecx,num2
	mov edx,2
	int 80h
	

	
	mov eax,[num]
	sub eax,'0'

	mov ebx,[num2]
	sub ebx,'0'

	add eax,ebx
	add eax,'0'
	mov [result],eax

	mov eax,sys_write
	mov ebx,stdout
	mov ecx,message2
	mov edx,messagelen2
	int 80h

	mov eax,sys_write
	mov ebx,stdout
	mov ecx,result
	mov edx,1
	int 80h

	mov eax,sys_exit
	mov ebx, 0
	int 80h
