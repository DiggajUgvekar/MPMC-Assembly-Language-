section .data
	message db "Enter number of elements: "
	messagelen equ $-message
	message2 db "Enter the elements in the array: "
	message2len equ $-message2
	message3 db "The sorted array is: " 
	message3len equ $-message3
	message4 db "Pass "
	message4len equ $-message4
	message5 db " : "
	message5len equ $-message5
	newline db 10
	space db ' '	

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
	write message2,message2len
	mov [i],dword '0'
loop1:
	mov esi,[i]
	cmp esi,[n]
	jge end
	sub esi,'0'
	add esi,arr
	read esi,1
	inc dword[i]
	jmp loop1	
end:
	ret

display:
	mov [i],dword '0'
loop2:
	mov esi,[i]
	cmp esi,[n]
	jge end2
	sub esi,'0'
	add esi,arr
	write esi,1
	write space,1
	inc dword[i]
	jmp loop2	
end2:
	write newline,1	
	ret

insertion_sort:
	mov eax,1 		
	mov bl,[n]		
	sub bl,'0'
loop3:
	cmp al,bl		
	jge end3
	pushad
	write message4,message4len
	write j,9
	write message5,message5len
	call display
	popad	
	mov ecx,0
	mov cl,al
	sub cl,1		
	mov dl,[arr+eax]		
loop4:
	cmp cl,0		
	jl update
	cmp dl,[arr+ecx]		
	jge update	
	mov dh,[arr+ecx]
	mov [arr+ecx+1],dh	
	dec ecx			
	jmp loop4
update:
	mov [arr+ecx+1],dl	
	inc al			
	inc byte[j]
	jmp loop3
end3:
	write message4,message4len
	write j,9
	write message5,message5len
	call display
ret


section .bss
	n resb 4
	arr resb 10
	i resb 4
	j resb 9
	trash resb 1

section .text
    global _start

_start:
	write message,messagelen
	read n,1	
	mov eax,'0'
	mov [j],eax
	call input
	write newline,1
	call insertion_sort
	write newline,1
	write message3,message3len
	call display
	mov eax,1
	mov ebx,0
	int 80h
