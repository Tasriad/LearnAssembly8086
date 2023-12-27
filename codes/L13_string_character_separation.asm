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
    
    mov ch,0
    mov cl,str[1]
    mov si,2
    mov ah,2
    
    output:
    mov dl,str[si]
    int 21h
    inc si
    mov dl,' '
    int 21h
    loop output
    
    exit:
    mov ah,4ch
    int 21h
    main endp
end main
    
    