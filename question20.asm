;Count maximum number of continuous zeros in an array
data SEGMENT
    msg1 DB 10,13,"Enter your array: $"
    msg2 DB 10,13,"Maximum number of continuous zeroes are: $"
    newline DB 10,13,"$"
    x DB ?
    y DB ?
    count DB 0
    max DB 0
    temp DB 0
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

    MOV BX,0
enterYourArray:
    MOV AH,01h
    INT 21h
    
    CMP AL,0dh
    JZ startSearch
    MOV [inst+BX],AL
    INC BX
    JMP enterYourArray
    
startSearch:
    CMP BX,0
    DEC BX
    JZ print
    MOV AL,[inst+BX]
    CMP AL,30h
    JZ increment
    MOV count,0
    JMP startSearch     
increment:
    INC count
    MOV AL,count
    CMP AL,max
    JC startSearch
    MOV max,AL
    JMP startSearch
    
print:
    LEA DX,msg2
    MOV AH,09h
    INT 21h
    
    MOV AL,max
    ADD AL,30h
    MOV DL,AL
    MOV AH,02h
    INT 21h 

exit:
    MOV AH,4ch
    INT 21h
    
code ENDS
END start