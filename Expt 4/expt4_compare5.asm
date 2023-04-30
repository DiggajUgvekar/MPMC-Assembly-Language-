section .data
    message1 db 'Enter a number : ',10
    messagelen1 equ $-message1

    message2 db 'Equal to 5',10
    messagelen2 equ $-message2

    message3 db 'Greater than 5',10
    messagelen3 equ $-message3

    message4 db 'Less than 5',10
    messagelen4 equ $-message4

section .bss
    num resb 5
    ;text resw 20

section .text
    global _start

_start:
    mov eax, 4
    mov ebx, 1
    mov ecx, message1
    mov edx, messagelen1
    int 80h

    mov eax, 3
    mov ebx, 2
    mov ecx, num
    int 80h

    mov al,[num]
    sub al, '0'
    mov bl, '5'
    sub bl, '0'
    cmp al, bl

    JE L1
    JG L2
    JMP L3

    L1:
    mov eax, 4
    mov ebx, 1
    mov ecx, message2
    mov edx, messagelen2
    int 80h
    JMP L4

    L2:
    mov eax, 4
    mov ebx, 1
    mov ecx, message3
    mov edx, messagelen3
    int 80h
    JMP L4

    L3:
    mov eax, 4
    mov ebx, 1
    mov ecx, message4
    mov edx, messagelen4
    int 80h
    
    L4:
    mov eax,1
    mov ebx,0
    int 80h
