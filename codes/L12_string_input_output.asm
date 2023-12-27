.model small
.stack 100h
.data
msg db "Enter a string: $"
msg2 db 10,13,"Output: $"
str db 10 dup('$')
.code
main proc
    mov ax,@data
    mov ds,ax
    
    mov ah,9
    lea dx,msg
    int 21h
    
    mov ah,10
    lea dx,str
    mov str,8
    int 21h
    
    mov ah,9
    lea dx,msg2
    int 21h
    
    mov ah,9
    lea dx,str+2
    int 21h
    
    exit:
    mov ah,4ch
    int 21h
    main endp
end main
    
    