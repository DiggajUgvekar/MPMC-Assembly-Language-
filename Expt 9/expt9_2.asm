section .data
	message db "Enter number of elements: "
	messagelen equ $-message
	message2 db "Enter elements: "
	message2len equ $-message2
	message3 db "Enter element to search: "
	message3len equ $-message3
	message4 db "Found at index: "
	message4len equ $-message4
	message5 db "Not found:"
	message5len equ $-message5
	newline db '',10
	newlinelen equ $-newline

%macro write 2
	mov eax,4
	mov ebx,1
	mov ecx,%1
	mov edx,%2
	int 80h
%endmacro
	
%macro read 2
	mov eax,3
	mov ebx,2
	mov ecx,%1
	mov edx,%2
	int 80h
	mov eax,3
	mov ebx,2
	mov ecx,trash
	mov edx,1
	int 80h
%endmacro
	
input:
	mov ecx,0
repeat_input:	
	cmp ecx,edx
	jge next_input
	mov esi,eax
	add esi,ecx
	pushad
	read esi,1
	popad
	inc ecx
	jmp repeat_input
next_input:
	ret

binary_search:
	and edi,000fh
	mov [lb],byte 0		
	mov [ub],dl		
repeat_search:
	mov cl,[lb]
	mov dl,[ub]		
	cmp cl,dl
	jg next_search		
	pushad
	mov al,[lb]		
	add al,[ub]
	cbw
	mov bl,2
	div bl
	mov [mid],al
	popad	
	mov edx,[mid]
	and edx,000fh
	mov esi,dword [eax+edx]
	and esi,000fh		
	cmp edi,esi
	je matched		
	jl lower_part		
upper_part:
	mov bl,[mid]
	add bl,1
	mov [lb],bl		
	jmp repeat_search
lower_part:
	mov bl,[mid]
	sub bl,1
	mov [ub],bl		
	jmp repeat_search	
matched:
	add edx,'0'	
	mov [index],edx			
	pushad
	write message4,message4len		
	write index,1		
	popad				
	ret				
next_search:
	write message5,message5len
	ret
	
section .bss
	n resb 4
	num resb 4
	arr resb 10
	index resb 4
	lb resb 1
	ub resb 1
	mid resb 1
	trash resb 1

section .text
    global _start

_start:
	write message,messagelen
	read n,1
	sub [n],byte '0'
	write message2,message2len
	mov eax,arr
	mov edx,[n]
	call input
	write message3,message3len
	read num,1
	mov eax,arr
	mov edx,[n]
	mov edi,[num]
	call binary_search
	write newline,newlinelen
mov eax,1
mov ebx,0
int 80h
