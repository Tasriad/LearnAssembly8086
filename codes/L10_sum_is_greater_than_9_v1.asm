.Model small
.stack 100h

.data
a db 10
b db 9
 
.code
MAIN PROC
mov ax,@data
mov ds,ax

mov al,a
mov bl,b

add al,bl
mov ah,0
aaa
add al,30h
add ah,30h
mov bx,ax

mov ah,2
mov dl,bh
int 21h
mov ah,2
mov dl,bl
int 21h

main endp
end main