section .data
    message db 'Enter a number : '
    messagelen equ $-message

    message2 db 'Factorial is '
    messagelen2 equ $-message2

section .bss
    n resb 5
    i resb 5
    fact resb 5

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
    
    call factorial

    mov ecx, fact
	mov edx, 1
	call print
    
mov eax, 1
int 80h

;--------------------------
;procedures
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
factorial:
        mov byte[i],'1'
        mov byte[fact], '1'

        L1:
        mov eax, [fact]
        sub eax,'0'
        mov ebx, [i]
        sub ebx, '0'
        mul ebx
        add eax,'0'
        mov [fact],eax
        inc byte[i]

        mov al,[i]
        cmp al,byte[n]
        JLE L1
        ret