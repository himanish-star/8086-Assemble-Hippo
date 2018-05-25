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
	mov ah,02h ;    st cursor position and bg colors if any
	mov bh,00h ;    first digit is
	mov dh,0ah ;    y axis
	mov dl,1fh ;    x axis
	int 10h
	ret
mov_cur endp

back_color proc
	mov ah,06h
    mov al,00h      ;scroll up window
	mov bh,24h      ;2 is bg 4 is text color
	mov cx,0        ;CH = Upper row number, CL = Left column number
	mov dx,184fh    ;DH = Lower row number, DL = Right column number
	int 10h
	ret
back_color endp

change_color proc
	mov ah,09h
	mov bl,12   ;   color
	mov bh,0    ;   page number
	mov cx,25   ;   no. of times to print char
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
	mov si,0004h    ;brings delay
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
