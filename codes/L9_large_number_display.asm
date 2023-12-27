.model small
.stack 100h
.data
prompt db "Enter a number: $"
msg db 10,13,"Output: $"
number db 5 dup(0)
.code
main proc
    ;initialization
    mov ax,@data
    mov ds,ax
    ;display prompt
    mov ah,9
    lea dx,prompt
    int 21h
    ;load array
    lea si,number
    ;input loop
    input:
    mov ah,1
    int 21h
    mov [si],al
    cmp al,0dh
    je output
    inc si
    jmp input
    ;output loop
    output:
    mov ah,9
    lea dx,msg
    int 21h
    lea si,number 
    mov cx,5
    mov ah,2
    mov dl,[si]
    output_loop:
    int 21h
    inc si
    mov dl,[si]
    loop output_loop
    
    exit:
    mov ah,4ch
    int 21h
    main endp
end main
    
    
    
    
    