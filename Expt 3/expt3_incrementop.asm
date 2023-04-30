section .data
    sys_write equ 4
	sys_exit equ 1
	stdin equ 0
	stdout equ 1
	sys_read equ 2
	sys_in equ 3

    message1 db 'Enter Number : ',10
    messagelen1 equ $-message1
    
    message2 db 'Next 4 Numbers : ',10
    messagelen2 equ $-message2

    newline db '',10
	newlinelen equ $-newline

section .bss
    num resb 5

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
	mov ecx,num
	mov edx,5
	int 80h
    
    mov eax,sys_write
	mov ebx,stdout
	mov ecx,message2
    mov edx,messagelen2
	int 80h
	
    ;increament 1
    mov eax,[num]
    sub eax, '0'
    INC eax
    add eax, '0'
    mov [num],eax

    mov eax,sys_write
	mov ebx,stdout
	mov ecx,num
    mov edx,5
	int 80h
    
    ;increament 2
    mov eax,[num]
    sub eax, '0'
    INC eax
    add eax, '0'
    mov [num],eax

    mov eax,sys_write
	mov ebx,stdout
	mov ecx,num
    mov edx,5
	int 80h
    
    ;increament 3
    mov eax,[num]
    sub eax, '0'
    INC eax
    add eax, '0'
    mov [num],eax

    mov eax,sys_write
	mov ebx,stdout
	mov ecx,num
    mov edx,5
	int 80h

    ;increament 4
    mov eax,[num]
    sub eax, '0'
    INC eax
    add eax, '0'
    mov [num],eax

    mov eax,sys_write
	mov ebx,stdout
	mov ecx,num
    mov edx,5
	int 80h

mov eax, 1
mov ebx, 0
int 80h