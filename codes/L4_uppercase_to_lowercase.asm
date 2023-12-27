.model small
.stack 100h
.data
CR equ 0DH
LF equ 0AH
msg1 db 'Enter a letter: $'
msg2 db CR,LF,'Lower case version is: $'
c db ?
.code
main proc
    mov ax,@data
    mov ds,ax
    
    mov ah,9
    lea dx,msg1
    int 21h
    
    mov ah,1 
    int 21h
    add al,20h ;20h for difference in 'a' and 'A'
    mov c,al
    
    mov ah,9
    lea dx,msg2
    int 21h
    
    mov ah,2
    mov dl,c
    int 21h
    
    exit:
    mov ah,4ch
    int 21h
    main endp
end main