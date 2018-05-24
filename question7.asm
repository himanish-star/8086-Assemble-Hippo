;lcm of two numbers

data segment
	msg1 db 10,13,"Enter number 1: $"
	msg2 db 10,13,"Enter number 2: $"
	msg3 db 10,13,"LCM of the two numbers is: $"
	num1 db ?
	num2 db ?
	product dw ?
	hcf db ?
	x db ?
	y db ?
	lcm db ?
data ends

code segment
assume cs:code,ds:data
start:
	mov ax,data
	mov ds,ax
	
	lea dx,msg1
	mov ah,09h
	int 21h
	
	mov ah,01h
	int 21h
	
	sub al,30h
	mov num1,al

	lea dx,msg2
	mov ah,09h
	int 21h
	
	mov ah,01h
	int 21h
	
	sub al,30h
	mov num2,al

	;then calculate hcf and divide the product of the two numbers by their hcf to get the lcm
	;also note that in this I am using single digit numbers
	;however this code can be easily expanded for multi digit numbers

product_calculate:
	mov al,num1
	mov bl,num2
	mul bl
	mov product,ax
	
hcf_calulate:
	mov al,num1
	mov x,al
	mov al,num2
	mov y,al
eulerModulo:
	mov bl,x
	mov ah,0
	mov al,y
	div bl
	cmp ah,0
	jz hcf_found
	mov al,x
	mov y,al
	mov x,ah
	jmp eulerModulo
hcf_found:
	mov al,x
	mov hcf,al

lcm_calculate:
	mov bl,hcf
	mov ax,product
	div bl
	mov lcm,al

	lea dx,msg3
	mov ah,09h
	int 21h

	mov al,lcm
	mov ah,0
	mov bl,10
	div bl
	add al,30h
	mov dl,al
	mov ah,02h
	int 21h

	mov al,lcm
	mov ah,0
	mov bl,10
	div bl
	add ah,30h
	mov dl,ah
	mov ah,02h
	int 21h
exit:
	mov ah,4ch
	int 21h
code ends
end start