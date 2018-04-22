;count number of digits in a number
data segment
    msg1 DB 10,13,"Enter your string of characters: $"
    msg2 DB 10,13,"number of digits: $"
    newline DB 10,13,"$"
    countDigits DB 0
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
    JZ checkForDigits
    MOV [inst+BX],AL
    INC BX
    JMP enterCharacters

checkForDigits:
    LEA DX,newLine
    MOV AH,09h
    INT 21h

    MOV CX,BX
    MOV BX,0    

loopForDigits:   
    MOV AL,[inst+BX]
    INC BX
    MOV temp,AL
    CMP AL,30h
    JC next
    MOV AL,temp
    CMP AL,39h
    JNC next
    INC countDigits    
next:
    LOOP loopForDigits
    
    LEA DX,msg2
    MOV AH,09h
    INT 21h

    MOV AL,countDigits
    ADD AL,30h
    MOV DL,AL
    MOV AH,02h
    INT 21h

exit:
    MOV AH,4ch
    INT 21h
code ENDS
END start