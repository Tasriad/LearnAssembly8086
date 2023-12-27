.model small
.stack 100h
.code
main proc 
    mov al,30
    mov bl,12
    div bl
    mov bx,ax
    mov ah, 2
    mov dl,bl
    add dl,48
    int 21h
    mov dl,bh
    add dl,48
    int 21h
    exit:
    mov ah,4ch
    int 21h
    main endp
end main