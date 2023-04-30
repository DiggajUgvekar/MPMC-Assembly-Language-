section .data
    message1 db 'Enter a number : ',10
    messagelen1 equ $-message1

    message2 db 'Even!!',10
    messagelen2 equ $-message2

    message3 db 'Odd!!',10
    messagelen3 equ $-message3

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
    mov bl, '2'
    sub bl, '0'
    div bl

    ;check the reminder is zero
    cmp ah,0

    JE L1       ;rem is zero
    JMP L2      ;rem is not zero

    L1:
    mov eax, 4
    mov ebx, 1
    mov ecx, message2
    mov edx, messagelen2
    int 80h
    JMP L3

    L2:
    mov eax, 4
    mov ebx, 1
    mov ecx, message3
    mov edx, messagelen3
    int 80h
    
    L3:
    mov eax, 1
    mov ebx, 0
    int 80h