.model small
.stack 100h
.data 
msg1 db "Enter first number: $"
msg2 db "Enter second number: $"
msg3 db "Sum is: $"

num1 db ?
num2 db ?
sum db ?

.code
main proc
    mov ax,@data
    mov ds,ax
    
    ;display message for 1st input
    mov ah,9 ; 9 value is displaying string
    lea dx,msg1 ;lea : load effective address
    int 21h
    
    ;get first number as input
    mov ah,1
    int 21h
    sub al,'0' ;convert to ASCII
    mov num1,al
    
    mov ah,2
    mov dl,10
    int 21h
    mov dl,13
    int 21h 
    
    ;display message for 2nd input
    mov ah,9
    lea dx,msg2
    int 21h
    
    ;get second number as input
    mov ah,1
    int 21h
    sub al,'0'
    mov num2,al
    
    mov ah,2
    mov dl,10
    int 21h
    mov dl,13
    int 21h
    
    ;add the numbers
    mov al,num1
    add al,num2
    mov sum,al
    
    ;display sum message
    mov ah,9
    lea dx,msg3
    int 21h
    
    ;display sum
    mov dl,sum
    add dl,'0'
    mov ah,2
    int 21h
    
    ;beep sound 
    mov ah,2
    mov dl,07
    int 21h
    
    exit:
    mov ah,4ch
    int 21h
    main endp
end main
    
    