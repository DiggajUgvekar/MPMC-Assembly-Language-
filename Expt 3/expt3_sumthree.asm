section .data
    sys_write equ 4
	sys_exit equ 1
	stdin equ 0
	stdout equ 1
	sys_read equ 2
	sys_in equ 3
    
    message1 db 'Enter Number : ',10
    messagelen1 equ $-message1
    
    message2 db 'Sum is ',10
    messagelen2 equ $-message2

    newline db '',10
	newlinelen equ $-newline
    
section .bss
    num1 resb 5
    num2 resb 5
    num3 resb 5
    sum resb 5

section .text
    GLOBAL _start
    
_start:
    mov eax,sys_write
	mov ebx,stdout
	mov ecx,message1
    mov edx,messagelen1
	int 80h
    
    mov eax,sys_in
	mov ebx,sys_read
	mov ecx,num1
	mov edx,5
	int 80h
    
    mov eax,sys_write
	mov ebx,stdout
	mov ecx,message1
    mov edx,messagelen1
	int 80h
    
    mov eax,sys_in
	mov ebx,sys_read
	mov ecx,num2
	mov edx,5
	int 80h
    
    mov eax,sys_write
	mov ebx,stdout
	mov ecx,message1
    mov edx,messagelen1
	int 80h
    
    mov eax,sys_in
	mov ebx,sys_read
	mov ecx,num3
	mov edx,5
	int 80h
    
    mov eax,[num1]
    sub eax,'0'
    mov ebx,[num2]
    sub ebx,'0'
    mov ecx,[num3]
    sub ecx,'0'
    
    add eax, ebx
	add eax, ecx
	add eax,'0'
	mov [sum],eax
    
    mov eax,sys_write
	mov ebx,stdout
	mov ecx,message2
	mov edx,messagelen2
	int 80h

	mov eax,sys_write
	mov ebx,stdout
    mov ecx,sum
	mov edx,1
	int 80h
mov eax, 1
mov ebx, 0
int 80h
