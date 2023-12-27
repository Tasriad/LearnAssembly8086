.Model small
.stack 100h
 
.code
MAIN PROC

mov ah,1
int 21h
sub al,'0'
mov bl,al

mov ah,1
int 21h
sub al,'0'
mov bh,al

mov al,0
add al,bl
add al,bh
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