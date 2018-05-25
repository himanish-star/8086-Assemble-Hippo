;PRIME FOR ASCII VALUES 48-148


DATA SEGMENT
    MSG1 DB 10,13,'ENTER NUMBER :$'
    MSG2 DB 10,13,'PRIME$'
    MSG3 DB 10,13,'NOT PRIME $'
    TEMP DB ?

DATA ENDS

CODE SEGMENT

    ASSUME DS:DATA,CS:CODE

    START:

        MOV AX,DATA
        MOV DS,AX

        MOV BX,04H

        LEA DX,MSG1
        MOV AH,09H
        INT 21H

        MOV AH,01H
        INT 21H

        SUB AL,30H ; CHECKS PRIME OF 48<ASCII<148

        MOV TEMP,AL

        CMP TEMP,07H
        JE PRIME

        CMP TEMP,01H
        JNG NOTPRIME

    DIVISION:

        CMP BL,TEMP
        JG PRIME
        MOV AL,TEMP
        DIV BX
        CMP DX,00H
        JE NOTPRIME
        INC BX
        CMP BX,09H
        JE PRIME
        JMP DIVISION

    NOTPRIME :

        LEA DX,MSG3
        MOV AH,09H
        INT 21H

        MOV AH,4CH
        INT 21H

    PRIME :

        LEA DX,MSG2
        MOV AH,09H
        INT 21H

        MOV AH,4CH
        INT 21H

CODE ENDS
END START


