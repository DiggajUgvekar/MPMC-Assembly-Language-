section .data
    message db 'Enter a number : '
    messagelen equ $-message

    addtext db 'The Addition is '
    addtextlen equ $-addtext

section .bss
    num1 resb 4
    num2 resb 4
    addi resb 4
    
%macro write 2
    mov eax, 4
    mov ebx, 1
    mov ecx, %1
    mov edx, %2
    int 80h
%endmacro

%macro read 2
    mov eax, 3
    mov ebx, 0
    mov ecx, %1
    mov edx, %2
    int 80h
%endmacro

section .text
    global _start

_start:
    write message, messagelen
    read num1, 4
    write message, messagelen
    read num2, 4

    mov esi, 2
    mov ecx, 3
    
    clc
    add_loop:
    mov al, [num1 + esi]
    adc al, [num2 + esi]
    aaa
    pushf
    or al, 30h
    popf

    mov [addi + esi],al
    dec esi
    loop add_loop

    write addtext, addtextlen
    write addi,3

mov eax, 1
mov ebx, 0
int 80h