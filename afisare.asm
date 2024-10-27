.model small
.stack 100h
.data
 numar dw 0
 creste dw 1
 nrcifre dw 0
 copie dw 0
 
.code

printSpace:
    mov dl, ' '
    mov ah, 2
    int 21h
    ret

main:
	mov ax,@data
	mov ds,ax
	
	
	
	citireTasta:
			mov ah,01h
			int 21h
			
			cmp al,13
			je cox
			
			sub al,48
			mov bl,al
			mov ax, numar
			mul cx
			add ax,bx
			
			mov numar,ax
			
		jmp citireTasta
	
	
	cox:
	
	mov ax,numar
	mov copie,ax
	
	descompunereCitire:
				mov ax, numar
				mov dx,0
				div cx
				push dx
			
				inc [nrcifre]
				cmp ax,0
				je amTerminatDescompunere
				
				mov numar,ax
			jmp descompunereCitire
	
	
	amTerminatDescompunere:
				mov dx,0
				pop dx
				add dl,48
				mov ah,02h
				int 21h
			
				dec [nrcifre]
				cmp nrcifre,0
				je impare
			
			jmp amTerminatDescompunere
	
	
	
	
	
	;DE AICI AFISEAZA PRIMELE "NUMAR" NUMERE PRIME, DECI TREBUIE SA IL CITESC PE NUMAR DE LA TASTATURA
	
	impare:
	
	mov ax,copie
	mov numar,ax
	call printSpace
	
	bucla:
	
	
	
		mov ax,creste
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
			
			call printSpace
		
			add creste,2
			dec numar
			cmp numar,0
			je amTerminatTot
	
	jmp bucla
	
	amTerminatTot:
		mov ah,4ch
		int 21h
	
end main