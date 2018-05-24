;HCF of two numbers
data SEGMENT
    msg1 DB 10,13,"Enter x: $"
    msg2 DB 10,13,"Enter y: $"
    msg3 DB 10,13,"HCF(x,y): $"
    newline DB 10,13,"$"
    x DB ?
    y DB ?
    temp1 DB ?
    temp2 DB ?
    product DW ?
data ENDS

code SEGMENT
assume CS:code,DS:data

start:
    	MOV AX,data
   	MOV DS,AX

    	LEA DX,msg1
    	MOV AH,09h
    	INT 21h

	mov ah,01h
	int 21h
	sub al,30h
	mov x,al
	
	LEA DX,msg2
    	MOV AH,09h
    	INT 21h

	mov ah,01h
	int 21h
	sub al,30h
	mov y,al

eD:
	mov ah,0
	mov bl,x
	mov al,y
	div bl
	cmp ah,0
	jz display
	mov bh,x
	mov y,bh
	mov x,ah
	jmp eD

display:
	lea dx,msg3
	mov ah,09h
	int 21h

	mov dl,x
	add dl,30h
	
	mov ah,02h
	int 21h
	
exit:
    	mov ah,4ch
    	int 21h

code ENDS
END start