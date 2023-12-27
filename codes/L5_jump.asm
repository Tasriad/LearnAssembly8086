.model small
.stack 100h
.data
CR equ 0DH
LF equ 0AH
msg1 db 'First $'
msg2 db CR,LF,'Second $'
msg3 db CR,LF,'Third $'
.code
main proc
    mov ax,@data
    mov ds,ax
    
    level1:
    mov ah,9
    lea dx,msg1
    int 21h
    jmp level3
    
    level2:
    mov ah,9
    lea dx,msg2
    int 21h
    jmp exit
    
    level3:
    mov ah,9
    lea dx,msg3
    int 21h
    jmp level2
    
    exit:
    mov ah,4ch
    int 21h
    main endp
end main
