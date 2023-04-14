section .data
        sys_write equ 4
		sys_exit equ 1
		stdin equ 0
		stdout equ 1
		
		original db 'Micro Analysis',10
		originalen equ $-original
		
		message db 'Original String : '
		messagelen equ $-message
		
		message2 db 'Replaced String : '
		messagelen2 equ $-message2

section .text
		GLOBAL _start

_start:
		mov eax,sys_write
	    mov ebx,stdout
    	mov ecx,message
    	mov edx,messagelen
    	int 80h
    	
    	mov eax,sys_write
	    mov ebx,stdout
    	mov ecx,original
    	mov edx,originalen
    	int 80h
    	
    	mov [original], dword'Marco'
    	
    	mov eax,sys_write
	    mov ebx,stdout
    	mov ecx,message2
    	mov edx,messagelen2
    	int 80h
    	
    	mov eax,sys_write
	    mov ebx,stdout
    	mov ecx,original
    	mov edx,originalen
    	int 80h

mov eax,1
mov ebx,0
int 80h
