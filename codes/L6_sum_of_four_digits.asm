.model small
.stack 100h
.data
msg db 'Enter a number: $'
msg2 db 'Sum is: $'
temp db ?
sum db ?
.code
main proc
    mov ax, @data
    mov ds, ax
    
    mov ah, 9
    lea dx, msg
    int 21h
    
    mov ah, 1
    int 21h
    sub al, '0'  ; convert ASCII character to numeric value
    
    mov bl, al
    
    mov ah, 2
    mov dl, 10
    int 21h
    mov dl, 13
    int 21h 
    
    mov ah, 9
    lea dx, msg
    int 21h
    
    mov ah, 1
    int 21h
    sub al, '0'  ; convert ASCII character to numeric value
    
    add bl, al
    
    mov ah, 2
    mov dl, 10
    int 21h
    mov dl, 13
    int 21h
    
    mov ah, 9
    lea dx, msg
    int 21h
    
    mov ah, 1
    int 21h
    sub al, '0'  ; convert ASCII character to numeric value
    
    add bl, al
    
    mov ah, 2
    mov dl, 10
    int 21h
    mov dl, 13
    int 21h
    
    mov ah, 9
    lea dx, msg
    int 21h
    
    mov ah, 1
    int 21h
    sub al, '0'  ; convert ASCII character to numeric value
    
    add bl, al
    
    mov sum, bl
    
    mov ah, 2
    mov dl, 10
    int 21h
    mov dl, 13
    int 21h
    
    mov ah, 9
    lea dx, msg2
    int 21h
    
    mov ah, 2
    mov dl, sum
    add dl, '0'  ; convert numeric value to ASCII character
    int 21h
    
    exit:
    mov ah, 4ch
    int 21h
main endp
end main
