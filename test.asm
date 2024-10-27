.model small
.stack 100h
.data
    mesaj1 db "Scrie un mesaj:$"
    mesaj2 db "Cauta un mesaj:$"
    mesaj3 db "Mesajul a fost gasit$"
    mesaj4 db "Mesajul nu a fost gasit$"
    a db 20h dup("$");
    b db 20h dup("$");
    k dw 0
    f db 0
.code
main:

 print macro p
    mov dx, offset p
    mov ah, 09h
    int 21h
 endm

 initializare:

    mov ax, @data
    mov ds, ax
    mov es, ax
    mov si, 0000h
    mov di, 0000h
    print mesaj1

 citire1:
    mov ah, 01h
    int 21h
    mov a[si], al
    inc si
    inc k
    cmp al, 0dh
    jne citire1

    print mesaj2

 citire2:
    mov ah, 01h
    int  21h
    mov b[di], al
    inc di
    inc cl
    cmp al, 0dh
    jne citire2

    mov f, cl
    mov si, 0000h
    mov di, 0000h
    mov ax, 0000h

 comparare:
    mov bh, a[si]
    mov bl, b[di]
    inc si
    inc di
    cmp bh, bl
    jne urmatorul
    loop comparare
    jmp gasit

 urmatorul:
    inc ax
    mov si, ax
    mov cl, f
    mov di, 0000h
    mov bx, k
    cmp ax, bx
    jl comparare
    jmp negasit

 gasit: 

     print mesaj3
     call amTerminat

 negasit:
 
     print mesaj4

 amTerminat proc

    mov ah,4ch
    int 21h

 amTerminat endp

end main