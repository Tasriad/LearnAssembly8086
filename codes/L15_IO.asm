.model small
.stack 100h
.data
str db 10 dup('$')
N DW ?
.code
main proc
    ;initialize
    mov ax,@data
    mov ds,ax
    
    CALL INPUT_NUMBER
    CALL NEW_LINE
    XOR DX,DX
    MOV BX,10 
    MOV AX,N
    DIV BX
    PUSH DX
    CALL PRINT
    
    
    
main endp
INPUT_NUMBER PROC
    XOR BX, BX
    
    INPUT_LOOP:
    MOV AH, 1
    INT 21H
    
    CMP AL, 13    
    JE END_INPUT_LOOP
    CMP AL, 10
    JE END_INPUT_LOOP  
    CMP AL,32
    JE END_INPUT_LOOP
    

    AND AX, 000FH
    
    MOV CX, AX
    

    MOV AX, 10
    MUL BX
    ADD AX, CX
    MOV BX, AX
    JMP INPUT_LOOP
    
    END_INPUT_LOOP:
    MOV N, BX
        
    RET        
INPUT_NUMBER ENDP   
           
PRINT PROC  
    PUSH BP
    MOV BP,SP
    CMP WORD PTR[BP+4],0
    JG END_IF   
    CMP AX,0
    JNE END_IF 
    JMP RETURN
    
END_IF:     
    XOR DX,DX
    DIV BX
    PUSH DX
    CALL PRINT     
    MOV CX, WORD PTR[BP+4]
    MOV DX,CX    
    ADD DX,48
    MOV AH,2
    INT 21H
    
RETURN:
    POP BP
    RET 2
  
PRINT ENDP

NEW_LINE PROC
    MOV AH,2
    MOV DL,10
    INT 21H
    MOV AH,2
    MOV DL,13
    INT 21H
    RET
    NEW_LINE ENDP

END MAIN