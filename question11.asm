;nine numbers, there are 4 numbers in pairs of two, find the odd one (eg. 4 3 2 1 1 2 3 4 9)

data segment
	count1 db 0
	count2 db 0
	count3 db 0
	count4 db 0
	count5 db 0
	count6 db 0
	count7 db 0
	count8 db 0
	count9 db 0
	count0 db 0
	msg1 db 10,13,"Enter your string of numbers: $"
	msg2 db 10,13,"The odd one out is: $"
	temp db ?
data ends

code segment
assume cs:code,ds:data
start:
	mov ax,data
	mov ds,ax
	
	lea dx,msg1
	mov ah,09h
	int 21h
	
enterString:
	mov ah,01h
	int 21h
	
	cmp al,0dh
	jz display
	sub al,30h
	
check0:
	cmp al,0
	jnz check1
	inc count0
	
check1:
	cmp al,1
	jnz check2
	inc count1

check2:
	cmp al,2
	jnz check3
	inc count2

check3:
	cmp al,3
	jnz check4
	inc count3

check4:
	cmp al,4
	jnz check5
	inc count4

check5:
	cmp al,5
	jnz check6
	inc count5

check6:
	cmp al,6
	jnz check7
	inc count6

check7:
	cmp al,7
	jnz check8
	inc count7

check8:
	cmp al,8
	jnz check9
	inc count8

check9:
	cmp al,9
	jnz enterString
	inc count9

	jmp enterString
	
display:
checkC0:
	mov al,count0
	cmp al,1
	jnz checkC1
	mov temp,0
	jmp oddOne
	
checkC1:
	mov al,count1
	cmp al,1
	jnz checkC2
	mov temp,1
	jmp oddOne

checkC2:
	mov al,count2
	cmp al,1
	jnz checkC3
	mov temp,2
	jmp oddOne

checkC3:
	mov al,count3
	cmp al,1
	jnz checkC4
	mov temp,3
	jmp oddOne

checkC4:
	mov al,count4
	cmp al,1
	jnz checkC5
	mov temp,4
	jmp oddOne

checkC5:
	mov al,count5
	cmp al,1
	jnz checkC6
	mov temp,5
	jmp oddOne

checkC6:
	mov al,count6
	cmp al,1
	jnz checkC7
	mov temp,6
	jmp oddOne

checkC7:
	mov al,count7
	cmp al,1
	jnz checkC8
	mov temp,7
	jmp oddOne

checkC8:
	mov al,count8
	cmp al,1
	jnz checkC9
	mov temp,8
	jmp oddOne

checkC9:
	mov al,count9
	cmp al,1
	jnz oddOne
	mov temp,9
	jmp oddOne

oddOne:
	lea dx,msg2
	mov ah,09h
	int 21h

	mov dl,temp
	add dl,30h
	mov ah,02h
	int 21h
	
exit:
	mov ah,4ch
	int 21h
code ends
end start