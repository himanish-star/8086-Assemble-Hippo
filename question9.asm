;reversing a given string
data SEGMENT
    msg1 DB 10,13,"Enter your string of characters: $"
    msg2 DB 10,13,"Reversed String: $"
    newline DB 10,13,"$"
    inst DB DUP(0)
    length DB ?
    temp DB ?
data ENDS

code SEGMENT
assume CS:code,DS:data
start:
    MOV AX,data
    MOV DS,AX

    LEA DX,msg1
    MOV AH,09h
    INT 21h
    
    MOV BX,0

enterCharacters:
    MOV AH,01h
    INT 21h

    CMP AL,0dh
    JZ reverseString
    MOV [inst+BX],AL
    INC BX
    JMP enterCharacters

reverseString:
    LEA DX,msg2
    MOV AH,09h
    INT 21h
    MOV CX,BX    

looper:
    DEC BX
    MOV AL,[inst+BX]
    MOV DL,AL
    MOV AH,02h
    INT 21h
    LOOP looper

exit:
    MOV AH,4ch
    INT 21h
code ENDS
END start
