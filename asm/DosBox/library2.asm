
	;org 0x0100
	
	;mov ax,0x0100
	;call display_number 
	;int 0x20
	
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

	;
	; Display the value of AX as a decimal number
	;
display_number:
	mov dx,0
	mov cx,10
	div cx			; AX = DX: AX / CX
	push dx
	cmp ax,0			; if ax is zero
	je display_number_1	; jump
	call display_number ; else calls itself again
display_number_1:
	pop ax
	add al,'0'			; convert remainder to ascii digit
	call display_letter ; display on the screen
	ret
	
	