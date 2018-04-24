;find x ^y using subroutine
data SEGMENT
    msg1 DB 10,13,"Enter x: $"
    msg2 DB 10,13,"Enter y: $"
    msg3 DB 10,13,"x^y: $"
    newline DB 10,13,"$"
    x DB ?
    y DB ?
    temp1 DB ?
    temp2 DB ?
    product DW ?
    inst DB DUP(0)
data ENDS

code SEGMENT
assume CS:code,DS:data

multiply PROC
    MOV AX,DX
    MOV temp1,CH
    MOV temp2,CL
    MOV CH,0
    MOV CL,x
    MUL CX
    MOV DX,AX
    MOV CH,temp1
    MOV CL,temp2
    RET
multiply ENDP

start:
    MOV AX,data
    MOV DS,AX

    LEA DX,msg1
    MOV AH,09h
    INT 21h

    MOV AH,01h
    INT 21h

    SUB AL,30h
    MOV x,AL

    LEA DX,msg2
    MOV AH,09h
    INT 21h

    MOV AH,01h
    INT 21h
    
    SUB AL,30h
    MOV y,AL
    
    MOV DH,0
    MOV DL,x
    DEC y
    MOV CL,y
    MOV CH,0

looper:
    CALL multiply
    LOOP looper

    MOV DI,0
    MOV DX,0
    MOV product,AX
    
generator:
    MOV CX,10
    DIV CX
    MOV [inst+DI],DL
    INC DI
    MOV DX,0
    CMP AX,0
    JZ displayMessage
    JMP generator

displayMessage:
    LEA DX,msg3
    MOV AH,09h
    INT 21h

print:
    DEC DI
    MOV AL,[inst+DI]
    ADD AL,30h
    MOV DL,AL
    MOV AH,02h
    INT 21h
    CMP DI,0
    JZ exit
    JMP print

exit:
    MOV AH,4ch
    INT 21h
    
code ENDS
END start