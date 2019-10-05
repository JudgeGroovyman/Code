
	org 0x0100
start:
	mov bx,0x64 		; start with decimal 100
nextrightmostbinary:
	shr bx,1			; shift bx to the right by one 
	jc printone			; was there a 1 on the right of bx
printone:
	mov al,1
	jmp displaybinary
printzero:
	mov al,0
displaybinary:
	add al,0x30
	call display_letter
	
	call newline


; --------------
	int 0x20	
	; Display letter contained in AL (ASCII)
display_letter:
	push ax
	push bx
	push cx
	push dx
	push si
	push di
	mov ah,0x0e		; Load AH with code for terminal output
	mov bx,0x000f	; Load BH page zero adn BL color (graphic mode)
	int 0x10		; Call the BIOS for displaying one letter
	pop di
	pop si
	pop dx
	pop cx
	pop bx
	pop ax
	ret				; Returns to caller
	
	; Read keyboard into AL (ASCII)
read_keyboard:
	push bx
	push cx
	push dx
	push si
	push di
	mov ah,0x00		; Load AH with code for keyboard read
	int 0x16		; Call the BIOS for reading keyboard
	pop di
	pop si
	pop dx
	pop cx
	pop bx
	ret				; Returns to caller
	
newline:
	mov al,0x0A
	call display_letter
	ret