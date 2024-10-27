.model small
.stack 100h
.data

	 n dw 0
	 deAfisat dw 1
	 msg1 db "Introdu un numar: $"
	 msg2 db "Suma numerelor este: $"
	 suma dw 0
	 
.code

	afisCHR proc
	
		mov ah,02h
		int 21h
		ret
		
	afisCHR endp
	
	exit proc
	
		mov ah,4ch
		int 21h
		
	exit endp

	main:
	
		afisSpatiu macro caracter
			mov dl, caracter
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
				je afisNRimpare
			
				sub al,48
				mov bl,al
				mov ax, n
				mul cx
				add ax,bx
				
				mov n,ax
				
			jmp citescTasta
		
		afisNRimpare:
		
			mov ax,deAfisat
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
					call afisCHR

				loop afisare
				
				afisSpatiu " "
			
				mov ax,deAfisat
				add suma,ax
				
				add deAfisat,2
				dec n
				cmp n,0
				je afisSuma
		
		jmp afisNRimpare
		
		
		afisSuma:
		
			mov dl, 10
			mov ah, 02h
			int 21h
			mov dl, 13
			mov ah, 02h
			int 21h
			
			mov dx, offset msg2
			mov ah,09
			int 21h
			
			
			mov ax,suma
			mov bx,10
			mov cx,0
			
			descompunereSuma:
				mov dx,0
				div bx
			
				push dx
				inc cx
			
				cmp ax,0
				je afisareSuma
			
			jmp descompunereSuma
		
		
				afisareSuma:
					pop dx
					add dl,48
					call afisCHR

				loop afisareSuma
		
		inchidereProgram:
			call exit
		
	end main