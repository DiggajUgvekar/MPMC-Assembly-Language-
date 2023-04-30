section .data
    message1 db 'Enter a number : ',10
    messagelen1 equ $-message1

    message2 db 'The Smallest is ',10
    messagelen2 equ $-message2


section .bss
    num1 resb 5
    num2 resb 5
    num3 resb 5
    small resb 5

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
    mov ecx, message1
    mov edx, messagelen1
    int 80h

    mov eax, 3
    mov ebx, 2
    mov ecx, num3
    int 80h

    mov eax, 4
    mov ebx, 1
    mov ecx, message2
    mov edx, messagelen2
    int 80h

    mov eax,[num1]
    mov ebx,[num2]
    mov ebx,[num3]
    cmp eax,ebx

    JS L1
    JMP L2

    L1:
    cmp eax,ecx
    JS L3
    JMP L4 

    L2:
    cmp ebx, ecx
    JS L5
    JMP L4

    L3:
    mov [small],eax
    JMP Print

    L4:
    mov [small],ecx
    JMP Print

    L5:
    mov [small],ebx
    JMP Print

    Print:
    mov eax, 4
    mov ebx, 1
    mov ecx, small
    int 80h

mov eax, 1
mov ebx, 0
int 80h
