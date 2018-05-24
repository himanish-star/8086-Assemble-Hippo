;Convert a given number (maximum length:3) into words

data segment
	msg1 db 10,13,"Enter your number: $"
	newLine db 10,13,"In words: $"
	reEnterMsg db 10,13,"Enter less than 4 digits :( $" 
	
	zeroMsg db "zero$"
	oneMsg db "one$"
	twoMsg db "two$"
	threeMsg db "three$"
	fourMsg db "four$"
	fiveMsg db "five$"
	sixMsg db "six$"
	sevenMsg db "seven$"
	eightMsg db "eight$"
	nineMsg db "nine$"

	thousandsMsg db " hundreds and $"
	tensMsg db " tens and $"
data ends

code segment
assume cs:code,ds:data
start:
	mov ax,data
	mov ds,ax
	
	lea dx,msg1
	mov ah,09h
	int 21h

	mov bx,2000h
	mov si,0

enterNumber:
	mov ah,01h
	int 21h

	cmp al,0dh
	jz display
	sub al,30h
	mov [bx+si],al
	inc si
	jmp enterNumber

display:
	lea dx,newLine
	mov ah,09h
	int 21h

	mov di,0	

	mov ax,si
	cmp al,1
	jz oneDigit
	cmp al,2
	jz twoDigit
	cmp al,3
	jz threeDigit
	jmp reEnter		

threeDigit:
	mov al,[bx+di]

oneDisplayT:
	cmp al,1
	jnz twoDisplayT
	lea dx,oneMsg
	mov ah,09h
	int 21h

	lea dx,thousandsMsg
	mov ah,09h
	int 21h
	jmp twoDigit
	
twoDisplayT:
	cmp al,2
	jnz threeDisplayT
	lea dx,twoMsg
	mov ah,09h
	int 21h

	lea dx,thousandsMsg
	mov ah,09h
	int 21h
	jmp twoDigit

threeDisplayT:	
	cmp al,3
	jnz fourDisplayT
	lea dx,threeMsg
	mov ah,09h
	int 21h

	lea dx,thousandsMsg
	mov ah,09h
	int 21h
	jmp twoDigit

fourDisplayT:
	cmp al,4
	jnz fiveDisplayT
	lea dx,fourMsg
	mov ah,09h
	int 21h

	lea dx,thousandsMsg
	mov ah,09h
	int 21h
	jmp twoDigit
	
fiveDisplayT:
	cmp al,5
	jnz sixDisplayT
	lea dx,fiveMsg
	mov ah,09h
	int 21h

	lea dx,thousandsMsg
	mov ah,09h
	int 21h
	jmp twoDigit


sixDisplayT:	
	cmp al,6
	jnz sevenDisplayT
	lea dx,sixMsg
	mov ah,09h
	int 21h

	lea dx,thousandsMsg
	mov ah,09h
	int 21h
	jmp twoDigit

sevenDisplayT:
	cmp al,7
	jnz eightDisplayT
	lea dx,sevenMsg
	mov ah,09h
	int 21h

	lea dx,thousandsMsg
	mov ah,09h
	int 21h
	jmp twoDigit
	
eightDisplayT:
	cmp al,8
	jnz nineDisplayT
	lea dx,eightMsg
	mov ah,09h
	int 21h

	lea dx,thousandsMsg
	mov ah,09h
	int 21h
	jmp twoDigit

nineDisplayT:	
	cmp al,9
	jnz twoDigit
	lea dx,nineMsg
	mov ah,09h
	int 21h
	
	lea dx,thousandsMsg
	mov ah,09h
	int 21h

twoDigit:
	inc di
	mov al,[bx+di]

oneDisplayH:
	cmp al,1
	jnz twoDisplayH
	lea dx,oneMsg
	mov ah,09h
	int 21h

	lea dx,tensMsg
	mov ah,09h
	int 21h
	jmp oneDigit
	
twoDisplayH:
	cmp al,2
	jnz threeDisplayH
	lea dx,twoMsg
	mov ah,09h
	int 21h

	lea dx,tensMsg
	mov ah,09h
	int 21h
	jmp oneDigit

threeDisplayH:	
	cmp al,3
	jnz fourDisplayH
	lea dx,threeMsg
	mov ah,09h
	int 21h

	lea dx,tensMsg
	mov ah,09h
	int 21h
	jmp oneDigit

fourDisplayH:
	cmp al,4
	jnz fiveDisplayH
	lea dx,fourMsg
	mov ah,09h
	int 21h

	lea dx,tensMsg
	mov ah,09h
	int 21h
	jmp oneDigit
	
fiveDisplayH:
	cmp al,5
	jnz sixDisplayH
	lea dx,fiveMsg
	mov ah,09h
	int 21h

	lea dx,tensMsg
	mov ah,09h
	int 21h
	jmp oneDigit

sixDisplayH:	
	cmp al,6
	jnz sevenDisplayH
	lea dx,sixMsg
	mov ah,09h
	int 21h

	lea dx,tensMsg
	mov ah,09h
	int 21h
	jmp oneDigit

sevenDisplayH:
	cmp al,7
	jnz eightDisplayH
	lea dx,sevenMsg
	mov ah,09h
	int 21h

	lea dx,tensMsg
	mov ah,09h
	int 21h
	jmp oneDigit
	
eightDisplayH:
	cmp al,8
	jnz nineDisplayH
	lea dx,eightMsg
	mov ah,09h
	int 21h

	lea dx,tensMsg
	mov ah,09h
	int 21h
	jmp oneDigit

nineDisplayH:	
	cmp al,9
	jnz oneDigit
	lea dx,nineMsg
	mov ah,09h
	int 21h

	lea dx,tensMsg
	mov ah,09h
	int 21h

oneDigit:
	inc di
	mov al,[bx+di]
	
zeroDisplay:	
	cmp al,0
	jnz oneDisplay
	lea dx,zeroMsg
	mov ah,09h
	int 21h
	jmp exit

oneDisplay:
	cmp al,1
	jnz twoDisplay
	lea dx,oneMsg
	mov ah,09h
	int 21h
	jmp exit
	
twoDisplay:
	cmp al,2
	jnz threeDisplay
	lea dx,twoMsg
	mov ah,09h
	int 21h
	jmp exit

threeDisplay:	
	cmp al,3
	jnz fourDisplay
	lea dx,threeMsg
	mov ah,09h
	int 21h
	jmp exit

fourDisplay:
	cmp al,4
	jnz fiveDisplay
	lea dx,fourMsg
	mov ah,09h
	int 21h
	jmp exit
	
fiveDisplay:
	cmp al,5
	jnz sixDisplay
	lea dx,fiveMsg
	mov ah,09h
	int 21h
	jmp exit


sixDisplay:	
	cmp al,6
	jnz sevenDisplay
	lea dx,sixMsg
	mov ah,09h
	int 21h
	jmp exit

sevenDisplay:
	cmp al,7
	jnz eightDisplay
	lea dx,sevenMsg
	mov ah,09h
	int 21h
	jmp exit
	
eightDisplay:
	cmp al,8
	jnz nineDisplay
	lea dx,eightMsg
	mov ah,09h
	int 21h
	jmp exit

nineDisplay:	
	cmp al,9
	jnz exit
	lea dx,nineMsg
	mov ah,09h
	int 21h
	jmp exit

reEnter:
	lea dx,reEnterMsg
	mov ah,09h
	int 21h
	jmp exit

exit:
	mov ah,4ch
	int 21h
	
code ends
end start