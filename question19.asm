;check if a number is palindrome or not (max up to 4 digits)
data SEGMENT
    msg1 DB 10,13,"Enter number(max upto 4 digits): $"
    msg2 DB 10,13,"Number is palindrome :)$"
    msg3 DB 10,13,"Number is not palindrome :($"
    newline DB 10,13,"$"
    temp DB ?
    product DW ?
    inst DB DUP(0)
data ENDS

code SEGMENT
assume CS:code,DS:data
start:
    MOV AX,data
    MOV DS,AX
    
    LEA DX,msg1
    MOV AH,09h
    INT 21h

    MOV CX,4
    MOV BX,0

enterDigits:
    MOV AH,01h
    INT 21h
    
    MOV [inst+BX],AL
    INC BX
    LOOP enterDigits

    MOV DI,0
    MOV CX,4
    dec bx
startCheck:
    MOV AL,[inst+BX]
    DEC BX
    MOV temp,AL
    MOV AL,[inst+DI]
    INC DI
    CMP AL,temp
    JNZ notPalindrone
    LOOP startCheck

palindrone:
    LEA DX,msg2
    MOV AH,09h
    INT 21h
    JMP exit

notPalindrone:
    LEA DX,msg3
    MOV AH,09h
    INT 21h

exit:
    MOV AH,4ch
    INT 21h
    
code ENDS
END start