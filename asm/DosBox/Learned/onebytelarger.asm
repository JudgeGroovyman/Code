
	org 0x0100
	
	; nop
	; uncomment the previous line to make the game one byte larger
	
	
	in al,(0x40)
	and al,0x07
	add al,0x30
	mov cl,al
game_loop:
	mov al,'?'
	call display_letter
	call read_keyboard
	cmp al,cl
	jne game_loop
	call display_letter
	mov al,':'
	call display_letter
	mov al,')'
	call display_letter
	

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