.model small
.stack 200h
.data
	msg db "Hello world!$"
	.code
		incepem:
			mov ax, @data
			mov ds, ax
			
			mov dx, offset msg
			mov ah, 09
			int 21h
			
			mov ah,4ch
			int 21h
		end incepem
