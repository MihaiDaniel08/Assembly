.model small
.stack 100h

print macro msg
		mov dx, offset msg
		mov ah,09
		int 21h
endm

.data
msg1 db ,  "introduceti un sir de caractere: $"
src db 80

db 30 dup(?)
msg2 db , " introduceti caracterul cautat: $"
msg3 db , " caracter gasit $"
msg4 db , " caracter negasit $"

.code
   start:
mov ax, @data
mov ds, ax

mov es, ax
print msg1 ; calling a macro to display
lea dx, src
mov ah, 0ah; function code to read string
int 21h

print msg2
mov ah, 01h ;read a Char
int 21h
mov cl, src+1
mov ch, 00
lea di, src
add di, 0002

cld
repne scasb ;scanning elements
je found
print msg4
jmp exit

found:
print msg3

exit:
mov ah, 4ch
int 21h

end start