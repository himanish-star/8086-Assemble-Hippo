;Find sum of digits of a number of any length

data segment
	msg1 db 10,13,"Enter your number: $"
	msg2 db 10,13,"Sum of digits: $"
	temp1 db ?
	temp2 db ?
	sum_of_digits db ?
data ends

code segment
assume cs:code,ds:data

start:
	mov ax,data
	mov ds,ax

	mov sum_of_digits,0

	lea dx,msg1
	mov ah,09h
	int 21h

enterDigits:
	mov ah,01h
	int 21h
	
	cmp al,0dh
	jz display_ans
	sub al,30h
	add al,sum_of_digits
	mov sum_of_digits,al
	jmp enterDigits
	
display_ans:
	lea dx,msg2
	mov ah,09h
	int 21h

	;this code will work until and unless the sum of the digits is <100
	
	mov al,sum_of_digits
	mov ah,0
	mov bl,0ah
	div bl

	mov dl,al
	add dl,30h
	mov ah,02h
	int 21h

	mov al,sum_of_digits
	mov ah,0
	mov bl,0ah
	div bl

	mov dl,ah
	add dl,30h
	mov ah,02h
	int 21h

exit:
	mov ah,4ch
	int 21h
code ends
end start