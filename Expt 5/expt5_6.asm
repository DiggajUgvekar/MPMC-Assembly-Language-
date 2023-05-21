section .data
    message db 'Enter a number: ', 10
    messagelen equ $ - message

    message2 db 'Fibonacci series: ', 10
    messagelen2 equ $ - message2
	
	space db ' '
	spacelen equ $-space
section .bss
    n resb 4
    a resb 4
    b resb 4
    c resb 4
    i resb 4

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

%macro fibo 3
    mov eax, dword [%1]
    sub eax, '0'

    mov ebx, dword [%2]
    sub ebx, '0'

    add eax, ebx
    add eax, '0'
    mov dword [%3], eax
%endmacro

section .text
global _start

_start:
    write message, messagelen
    read n, 4
    write message2, messagelen2

    mov byte [i], '0'
    mov byte [a], '0'
    mov byte [b], '1'

    cmp byte [n], '0'
    JE L4
    JMP L1

L1:
    write a, 4
    write space, spacelen
    inc byte [i]
    mov al, byte [i]
    cmp al, byte [n]
    JE L4
    JMP L2

L2:
    write b, 4
    write space, spacelen
    inc byte [i]
    mov al, byte [i]
    cmp al, byte [n]
    JE L4
    JMP L3

L3:
    fibo a, b, c
    write c, 4
    write space, spacelen
    mov al, byte [b]
    mov byte [a], al

    mov al, byte [c]
    mov byte [b], al

    inc byte [i]
    mov al, byte [i]
    cmp al, byte [n]
    JE L4
    JMP L3

L4:
    mov eax, 1
    xor ebx, ebx
    int 80h
