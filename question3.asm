data segment
    	msg1 db "Soumya Himanish Mohapatra$"
data ends

code segment
assume cs:code,ds:data

print proc 
	lea dx,msg1
	mov ah,09h
	int 21h
	ret
print endp

mov_cur proc
	mov ah,02h
	mov bh,00h
	mov dh,0ah
	mov dl,0ch
	int 10h	
	ret
mov_cur endp

back_color proc
	mov ah,06h
	mov al,00h
	mov bh,24h
	mov cx,0
	mov dx,184fh
	int 10h
	ret
back_color endp

change_color proc
	mov ah,09h
	mov bl,12
	mov bh,0
	mov cx,25
	int 10h
	ret
change_color endp

blink_text proc
	mov ah,06h
	mov al,00h
	mov bh,1ch
	mov cx,0
	mov dx,184fh	
	int 10h
	ret
blink_text endp

start:    
    	mov ax,data
	mov ds,ax	
	
blinkLoop:
	mov si,0004h
	call mov_cur
	call back_color	
	call print

delay1:
	mov ax,si
	cmp ax,0
	dec si
	jnz delay1
	
	call mov_cur
	call blink_text
	call print	
	
	mov si,0004h
delay2:
	mov ax,si
	cmp ax,0
	dec si
	jnz delay2
	
	jmp blinkLoop    
	
exit:
	mov ah,4ch
	int 21h
code ends
end start