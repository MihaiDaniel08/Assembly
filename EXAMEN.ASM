.model small
.stack 100h
.data
	a dw 2, 8, 4, 2

.code
	
start:
	mov ax, @data
	mov ds, ax
	
	xor ax, ax
	mov cx, a
    mov si, 2
	mov ax, a[si]
	
et1:
	
	add si, 2
	sub ax, a[si+1]
	loop et1
	
	mov ax, 4C00h
	int 21h

end start 
	
