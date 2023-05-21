section .data
    message db 'Enter you name : '
    messagelen equ $-message

section .bss
    name resw 20
    count resb 5

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

section .text
    global _start

_start:
    write message, messagelen
    read name, 20
    
    mov byte[count],'1'
    jmp loop
    
loop:
    write count,5
    write name, 20
    
    inc byte[count]
    cmp byte[count],'9'
    jle loop

mov eax, 1
mov ebx, 0
int 80h