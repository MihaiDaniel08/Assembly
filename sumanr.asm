.model small
.stack 100h
.data

a dw 0
b dw 0
msg1 db "Introdu numerele(dupa fiecare apasa enter): $"
msg2 db "Suma numerelor este: $"

.code
	main:
	
		mov ax,@data
		mov ds,ax
		
		mov dx, offset msg1
		mov ah,09
		int 21h
	
		mov cx,10
		
		citescTasta1:
				mov ah,01h
				int 21h
				
				cmp al,13
				je citescTasta2
			
				sub al,48
				mov bl,al
				mov ax,a
				mul cx
				add ax,bx
				
				mov a,ax
				
			jmp citescTasta1
			
		citescTasta2:
			mov ah,01h
			int 21h
				
			cmp al,13
			je sumaNR
			
			sub al,48
			mov bl,al
			mov ax, b
			mul cx
			add ax,bx
				
			mov b,ax
				
		jmp citescTasta2
		
		sumaNR:
		
			mov dx, offset msg2
			mov ah,09
			int 21h
		
			mov ax,b
			add a,ax
		
			mov ax,a
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
				
			terminat:
				mov ah,4ch
				int 21h
				
	end main