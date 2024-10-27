;fibbonaci x2
.model small
.stack 100h
.data

msg1 db "Scrie boss un numar: $"
msg2 db "Ai vrut un numar ia poftim: $"
msg3 db "Ia 3 numere: $"
msg4 db "Se genereaza: $"
 n dw 0
 x dw 0
 y dw 1
 z dw 0
NRdeAfis dw 0

.code

	main:
	
	caracter macro chr
			mov dl, chr
			mov ah, 2
			int 21h
		endm
	
	mov ax,@data
		mov ds,ax
		
		mov dx, offset msg1
		mov ah,09
		int 21h
		
		mov cx,10
		
		citescTasta:
				mov ah,01h
				int 21h
				
				cmp al,13
				je fibbo
			
				sub al,48
				mov bl,al
				mov ax, n
				mul cx
				add ax,bx
				
				mov n,ax
				
			jmp citescTasta
			
		fibbo:
			mov ax,0
			cmp n,ax
			je unNR
			
			mov ax,2
			cmp n,ax
			je treiNR
			
			mov ax,2
			cmp n,ax
			jg formezFibbo
		
		
		unNR:
			mov dx, offset msg2
			mov ah,09
			int 21h
			
			caracter "0"
		jmp terminat
		
		treiNR:
			mov dx, offset msg3
			mov ah,09
			int 21h
			
			caracter "0"
			caracter " "
			caracter "2"
			
			caracter " "
			caracter "2"
			
		jmp terminat
		
		formezFibbo:
		
			mov dx, offset msg4
			mov ah,09
			int 21h
			
			caracter "0"
			caracter " "
			caracter "2"
			caracter " "
			
			start:
			
			mov ax,x
			mov z,ax
			mov ax,y
			add z,ax
			
			mov ax,z
			mov bx,2
			mul bx
			mov NRdeAfis,ax
			mov ax,NRdeAfis
			
			
			cmp ax,n
			jl afisareFibbo
			je afisareFibbo
			jmp terminat
			
			
			afisareFibbo:
			
				mov ax,NRdeAfis
				mov bx,10
				mov cx,0
				
				descompunere:
					mov dx,0
					div bx
				
					push dx
					inc cx
				
					cmp ax,0
					je afisare
				
				jmp descompunere
			
			
					afisare:
						pop dx
						add dl,48
						mov ah,02h
						int 21h

					loop afisare
					
				caracter " "
				
				mov ax,y
				mov x,ax
				mov ax,z
				mov y,ax
				
			jmp start

	terminat:
				mov ah,4ch
				int 21h
	end main