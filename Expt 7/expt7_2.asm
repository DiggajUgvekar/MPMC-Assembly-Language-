section .data
    message db 'Enter a number : '
    messagelen equ $-message

    subtext db 'The Subtraction is '
    subtextlen equ $-subtext

section .bss
    num1 resb 4
    num2 resb 4
    subt resb 4
    
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
    sub_loop:
    mov al, [num1+esi]
    sbb al, [num2+esi]
    aas
    pushf
    or al, 30h
    popf
    
    mov [subt+esi], al
    dec esi
    loop sub_loop
    
    write subtext, subtextlen
    write subt, 3
    
mov eax, 1
mov ebx, 0
int 80h