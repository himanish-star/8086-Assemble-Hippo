;frequency of occurrence of vowels in a string

DATA SEGMENT
   	ARR DB 10 DUP(10)
  	MSG1 DB 10,13,'ENTER STRING (PRESS ENTER TO STOP) : $'
   	MSG2 DB 10,13,'NUMBER OF VOWELS : $'
	TEMP DB ?
DATA ENDS

CODE SEGMENT
ASSUME CS:CODE,DS:DATA

START:
	MOV AX,DATA
	MOV DS,AX


	MOV BX,00H
       	MOV CX,00H
       	LEA DX,MSG1
       	MOV AH,09H
       	INT 21H

INPUT:
       	MOV AH,01H
       	INT 21H
       	CMP AL,0DH
       	JE COUNTVOWELS

       	MOV [ARR + BX],AL
       	INC BX
       	JMP INPUT

COUNTVOWELS:
	DEC BX
       	CMP [ARR + BX],41H
       	JE INCREMENTOR
       	CMP [ARR + BX],45H
       	JE INCREMENTOR
       	CMP [ARR + BX],49H
       	JE INCREMENTOR
       	CMP [ARR + BX],4FH
       	JE INCREMENTOR
       	CMP [ARR + BX],55H
       	JE INCREMENTOR
	CMP BX,0
	JZ PRINT
       	JMP COUNTVOWELS

INCREMENTOR:
       	INC CX
	CMP BX,0
	JZ PRINT
       	JMP COUNTVOWELS

PRINT:
       	LEA DX,MSG2
       	MOV AH,09H
       	INT 21H

       	MOV AH,0
       	MOV AX,CX
       	AAA
	MOV TEMP,CL
       	ADD AH,30H
       	ADD AL,30H
       	MOV CX,AX

       	MOV AH,02H
       	MOV DL,CH
       	INT 21H

       	MOV AH,02H
       	MOV DL,CL
       	INT 21H

   	MOV AH,4CH
   	INT 21H

CODE ENDS
END START