section .data

		sys_write equ 4
		sys_exit equ 1
		stdin equ 0
		stdout equ 1
		sys_read equ 2
		sys_in equ 3

		message db 'Enter length : ',10
		messagelen equ $-message

		message2 db 'Enter breath : ',10
		messagelen2 equ $-message2
		
		message3 db 'Enter base : ',10
		messagelen3 equ $-message3

		message4 db 'Enter height : ',10
		messagelen4 equ $-message4

		message5 db 'Enter side of triangle : ',10
		messagelen5 equ $-message5

		area db 'The Area of rectangle is '
		arealen equ $-area

		perimeter db 'The Perimeter of rectangle is '
		perilen equ $-perimeter

		area2 db 'The Area of Triangle is '
		arealen2 equ $-area2

		perimeter2 db 'The Perimeter of Triangle is '
		perilen2 equ $-perimeter2

		newline db '',10
		newlinelen equ $-newline

section .bss
		length resb 10
		breadth resb 10
		base resb 10
		height resb 10
		side1 resb 10
		side2 resb 10
		side3 resb 10
		temp resb 10
		area_1 resb 10	
		perimeter_1 resb 10
		area_2 resb 10	
		perimeter_2 resb 10

section .text
		GLOBAL _start

_start:
			;input length, breadth
			mov eax,sys_write
			mov ebx,stdout
			mov ecx,message
			mov edx,messagelen
			int 80h

			mov eax,sys_in
			mov ebx,sys_read
			mov ecx,length
			mov edx,10
			int 80h
			
			mov eax,sys_write
			mov ebx,stdout
			mov ecx,message2
			mov edx,messagelen2
			int 80h

			mov eax,sys_in
			mov ebx,sys_read
			mov ecx,breadth
			mov edx,10
			int 80h
			
			;calculate area
			mov eax,[length]
			sub eax,'0'

			mov ebx,[breadth]
			sub ebx,'0'

			mul ebx
			add eax,'0'
			mov [area_1],eax
			
			;display area
			mov eax,sys_write
			mov ebx,stdout
			mov ecx,area
			mov edx,arealen
			int 80h
		
			mov eax,sys_write
			mov ebx,stdout
			mov ecx,area_1
			mov edx,1
			int 80h
			
			mov eax,sys_write
			mov ebx,stdout
			mov ecx,newline
			mov edx,newlinelen
			int 80h

			;calculate perimeter
			mov eax,[length]
			sub eax,'0'

			mov ebx,[breadth]
			sub ebx,'0'

			add ebx,eax
			mov eax,2
			mul ebx
			add eax,'0'
			mov [perimeter_1],eax
			
			;display perimeter
			mov eax,sys_write
			mov ebx,stdout
			mov ecx,perimeter
			mov edx,perilen
			int 80h

			mov eax,sys_write
			mov ebx,stdout
			mov ecx,perimeter_1
			mov edx,1
			int 80h

			mov eax,sys_write
			mov ebx,stdout
			mov ecx,newline
			mov edx,newlinelen
			int 80h

			;input base and height
			mov eax,sys_write
			mov ebx,stdout
			mov ecx,message3
			mov edx,messagelen3
			int 80h

			mov eax,sys_in
			mov ebx,sys_read
			mov ecx,base
			mov edx,10
			int 80h

			mov eax,sys_write
			mov ebx,stdout
			mov ecx,message4
			mov edx,messagelen4
			int 80h

			mov eax,sys_in
			mov ebx,sys_read
			mov ecx,height
			mov edx,10
			int 80h


			;input 3 sides
			mov eax,sys_write
			mov ebx,stdout
			mov ecx,message5
			mov edx,messagelen5
			int 80h

			mov eax,sys_in
			mov ebx,sys_read
			mov ecx,side1
			mov edx,10
			int 80h

			mov eax,sys_write
			mov ebx,stdout
			mov ecx,message5
			mov edx,messagelen5
			int 80h

			mov eax,sys_in
			mov ebx,sys_read
			mov ecx,side2
			mov edx,10
			int 80h

			mov eax,sys_write
			mov ebx,stdout
			mov ecx,message5
			mov edx,messagelen5
			int 80h

			mov eax,sys_in
			mov ebx,sys_read
			mov ecx,side3
			mov edx,10
			int 80h

			;area of triangle
			mov al,[base]
			sub al,'0'
			
			mov bl,[height]
			sub bl,'0'
		
			mul bl
			mov bl, 2
			div bl
			add al, '0'
			mov [area_2],al


			mov eax,sys_write
			mov ebx,stdout
			mov ecx,area2
			mov edx,arealen2
			int 80h

			mov eax,sys_write
			mov ebx,stdout
			mov ecx,area_2
			mov edx,1
			int 80h

			mov eax,sys_write
			mov ebx,stdout
			mov ecx,newline
			mov edx,newlinelen
			int 80h

			;perimeter of triangle
			mov eax, [side1]
			sub eax, '0'
			mov ebx, [side2]
			sub ebx, '0'
			mov ecx, [side3]
			sub ecx, '0'
			
			add eax, ebx
			add eax, ecx
			add eax,'0'
			mov [perimeter_2],eax

			;display perimeter
			mov eax,sys_write
			mov ebx,stdout
			mov ecx,perimeter2
			mov edx,perilen2
			int 80h

			mov eax,sys_write
			mov ebx,stdout
			mov ecx,perimeter_2
			mov edx,1
			int 80h

			mov eax,sys_write
			mov ebx,stdout
			mov ecx,newline
			mov edx,newlinelen
			int 80h

	mov eax,sys_exit
	mov ebx, 0
	int 80h

