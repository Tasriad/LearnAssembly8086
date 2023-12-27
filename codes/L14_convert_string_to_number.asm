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
    
    call to_number
    add ax,1
    call to_string
    
    mov ah,9
    lea dx,msg2
    int 21h
    
    mov ah,9
    lea dx,str
    int 21h
    
    exit:
    mov ah,4ch
    int 21h
    main endp
to_number proc
    mov ch,0
    mov cl,str[1]
    mov si,2
    mov ax,0
    mov bx,10
    conversion:
    mul bx
    sub str[si],'0'
    add al,str[si]
    inc si
    loop conversion
    ret
    to_number endp

to_string proc
    mov bx, 10          ; Set divisor to 10 
    mov si, 0
    mov cx,6
    zero:
    mov str[si],0
    inc si
    loop zero
    lea si, str + 6    ; Point SI to the end of the buffer
    mov cx, 10          ; Set the maximum number of digits

convert_loop_to_string:
    dec si              ; Move SI back
    xor dx, dx          ; Clear any previous remainder
    div bx              ; Divide AX by 10, result in AX, remainder in DX
    add dl, '0'         ; Convert remainder to ASCII
    mov [si], dl        ; Store the ASCII character in the buffer
    dec cx              ; Decrement the digit counter
    test ax, ax         ; Check if quotient is zero
    jnz convert_loop_to_string ; If not, continue the conversion

    ; Adjust the buffer pointer to point to the beginning
    mov si, offset str

    ; Remove leading zeros (optional)
    remove_leading_zeros:
    cmp byte ptr [si], '0'
    jne done_remove_leading_zeros
    inc si
    jmp remove_leading_zeros
    done_remove_leading_zeros:
    ret
to_string endp

    
    
end main