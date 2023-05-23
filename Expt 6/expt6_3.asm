section .data
		message db 'Enter a num : ',10
		messagelen equ $-message

		addtext db 'The Addition is '
		addtextlen equ $-addtext

		subtext db 'The Subtraction is '
		subtextlen equ $-subtext

		multext db 'The Multiplication is '
		multextlen equ $-multext

		quotext db 'The Quotient is '
		quotextlen equ $-quotext

		remtext db 'The Remainder is '
		remtextlen equ $-remtext

		newline db '',10
		newlinelen equ $-newline

section .bss
		num1 resb 10
		num2 resb 10
		addi resb 10
		subt resb 10
		multi resb 10
		quo resb 10	
		rem resb 10	
    
section .text
		GLOBAL _start

_start:
    mov ecx, message
	mov edx, messagelen
	call print

    mov ecx, num1
	mov edx, 10
	call read

    mov ecx, message
	mov edx, messagelen
	call print

    mov ecx, num2
	mov edx, 10
	call read

    call addition

    mov ecx, addtext
	mov edx, addtextlen
	call print
    mov ecx, addi
	mov edx, 1
	call print
    mov ecx, newline
	mov edx, newlinelen
	call print

    call subtraction

    mov ecx, subtext
	mov edx, subtextlen
	call print
    mov ecx, subt
	mov edx, 1
	call print
    mov ecx, newline
	mov edx, newlinelen
	call print

    call multiplication

    mov ecx, multext
	mov edx, multextlen
	call print
    mov ecx, multi
	mov edx, 1
	call print
    mov ecx, newline
	mov edx, newlinelen
	call print

    call division

    mov ecx, quotext
	mov edx, quotextlen
	call print
    mov ecx, quo
	mov edx, 1
	call print
    mov ecx, newline
	mov edx, newlinelen
	call print

    mov ecx, remtext
	mov edx, remtextlen
	call print
    mov ecx, rem
	mov edx, 1
	call print
    mov ecx, newline
	mov edx, newlinelen
	call print
    
mov eax, 1
mov ebx, 0
int 80h

;-----------------------------
;procedures
addition:
    mov eax,[num1]
	sub eax,'0'

    mov ebx,[num2]
    sub ebx,'0'

    add eax,ebx
    add eax,'0'
    mov [addi],eax
    ret

subtraction:
    mov eax,[num1]
    sub eax,'0'

    mov ebx,[num2]
    sub ebx,'0'

    sub eax,ebx
    add eax,'0'
    mov [subt],eax
    ret

multiplication:
    mov eax,[num1]
    sub eax,'0'

    mov ebx,[num2]
    sub ebx,'0'

    mul ebx
    add eax,'0'
    mov [multi],eax
    ret

division:
    mov al,[num1]
    sub al,'0'

    mov bl,[num2]
    sub bl,'0'

    div bl
    add al,'0'
    mov [quo],al
    add ah,'0'
    mov [rem],ah
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