section .data
    message1 db 'Enter a number : ',10
    messagelen1 equ $-message1

    message2 db 'The Largest is ',10
    messagelen2 equ $-message2

section .bss
    num1 resb 5
    num2 resb 5
    large resb 5

section .text
    GLOBAL _start

_start:
    mov eax, 4
    mov ebx, 1
    mov ecx, message1
    mov edx, messagelen1
    int 80h

    mov eax, 3
    mov ebx, 2
    mov ecx, num1
    int 80h
    
    mov eax, 4
    mov ebx, 1
    mov ecx, message1
    mov edx, messagelen1
    int 80h

    mov eax, 3
    mov ebx, 2
    mov ecx, num2
 int 80h
    
    mov eax, 4
    mov ebx, 1
    mov ecx, message2
    mov edx, messagelen2
    int 80h

    mov eax,[num1]
    mov ebx,[num2]
    cmp eax,ebx

    JG L1
    JMP L2

    L1:
    mov [large],eax
    JMP Print

    L2:
    mov [large],ebx
    JMP Print

    Print:
    mov eax, 4
    mov ebx, 1
    mov ecx, large
    int 80h

mov eax, 1
mov ebx, 0
int 80h
