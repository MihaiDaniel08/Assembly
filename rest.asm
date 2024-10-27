;restul impartirii
.model small
.stack 100h
.data

sumacif dw 0
n dw 0
restul dw 0

.code

	main:
	
			mov ax,@data
			mov ds,ax
		
			mov cx,10
			
			citire:
					mov ah,01h
					int 21h
					
					cmp al,13
					je restulIMP
				
					sub al,48
					mov bl,al
					mov ax, n
					mul cx
					add ax,bx
					add sumacif,bx
					
					mov n,ax
					
				jmp citire
		
		restulIMP:
		
			mov dl, 10
			mov ah, 02h
			int 21h
			mov dl, 13
			mov ah, 02h
			int 21h
		
			mov dx,0
			mov ax,n
			
			mov bx,sumacif
			
			div bx
			mov restul,dx
		
			mov ax,restul
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
				
			jmp terminat	
			
			terminat:
				mov ah,4ch
				int 21h
	
	
	
	end main