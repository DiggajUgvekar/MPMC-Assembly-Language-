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
    c1 resb 4
    i resb 4
    
section .text
    global _start

_start:
    mov ecx, message
	mov edx, messagelen
	call print
    
	mov ecx, n
	mov edx, 5
	call read
    
    mov ecx, message2
	mov edx, messagelen2
	call print

    call fibo
    
mov eax, 1
int 80h

;--------------------------
;procedures
fibo:
    mov byte [i], '0'
    mov byte [a], '0'
    mov byte [b], '1'
    mov al, byte [i]
    cmp al, byte [n]
    JL L1
    JMP L4
    
    L1:
    mov ecx, a
    mov edx, 1
    call print
    
    inc byte[i]
    mov al,[i]
    
    cmp al, byte[n]
    JL L2
    JMP L4

    L2:
    mov ecx, b
    mov edx, 1
    call print
    
    inc byte[i]
    mov al,[i]
    
    cmp al, byte[n]
    JL L3
    JMP L4
    
    L3:
    call formula
    mov ecx, c1
    mov edx, 1
    call print
    
    mov al, [b]
    mov [a], al

    mov al, [c1]
    mov [b], al

    inc byte [i]
    mov al,[i]
    cmp al, byte[n]
    JL L3
    JMP L4

    L4:
        ret

formula:
    mov eax, [a]
    sub eax, '0'

    mov ebx, [b]
    sub ebx, '0'

    add eax, ebx
    add eax, '0'
    mov [c1], eax
    ret

print:
        mov eax,4
        mov ebx, 1
        int 80h
        ret
read:
        mov eax,3
        mov ebx, 2
        int 80h
        ret  