
	;
	; Sieve of Eratosthenes
	;
	
	
	org 0x0100
	
board:	equ 0x0300

start:
	mov bx,board	; Put address of game board in BX
	mov cx,9		; Count 9 squares
	mov al,'1'		; Setup al to contain 0x31 (ASCII for 1)
b09:
	mov [bx],al		; save it into the square (one byte)
	inc al			; Increase AL, this gives us the next digit
	inc bx			; Increase direction
	loop b09		; Decrement CX, jump if non-zero
b10:
	call show_board
	call find_line
	
	call get_movement 	; Get movement
	mov byte [bx],'X'	; Put X into square
	
	call show_board		; Show board
	call find_line
	
	call get_movement	; Get movement
	mov byte [bx],'0'	; Put 0 into square
	
	jmp b10

get_movement:
	call read_keyboard
	cmp al,0x1b			; Esc key pressed?
	je do_exit			; Yes, exit
	sub al,0x31			; Subtract code for ASCII digit 1
	jc get_movement		; Is it less than?  Wait for another key
	cmp al,0x09			; Comparison with 9
	jnc get_movement	; Is it greater than or equal to? Wait
	cbw					; expand al to 16 bits using ah
	mov bx,board		; bx points to board
	add bx,ax			; add the key entered
	mov al,[bx]			; get square content
	cmp al,0x40			; comparison with 0x40
	jnc get_movement	; is it greater than or equal to? Wait
	call show_crlf		; line change
	ret					; return, now bx points to square
	
	
find_line:
	; First horizontal row
	mov al,[board]		; X.. ... ...
	cmp al,[board+1]	; .X. ... ...
	jne b01
	cmp al,[board+2]	; ..X ... ...
	je won
b01:
	; Leftmost vertical row
	cmp al,[board+3]	; ... X.. ...
	jne b04
	cmp al,[board+6]	; ... ... X..
	je won
b04:
	; First diagonal
	cmp al,[board+4]	; ... .X. ...
	jne b05
	cmp al,[board+8]	; ... ... ..X
	je won
b05:
	; Second horizontal row
	mov al,[board+3]	; ... X.. ...
	cmp al,[board+4]	; ... .X. ...
	jne b02
	cmp al,[board+5]	; ... ..X ...
	je won
b02:
	; Third horizontal row
	mov al,[board+6]	; ... ... X..
	cmp al,[board+7]	; ... ... .X.
	jne b03
	cmp al,[board+8]	; ... ... ..X
	je won
b03:
	; Middle vertical row
	mov al,[board+1]	; .X. ... ...
	cmp al,[board+4]	; ... .X. ...
	jne b06
	cmp al,[board+7]	; ... ... .X.
	je won
b06:
	; Rightmost vertical row
	mov al,[board+2]	; ..X ... ...
	cmp al,[board+5]	; ... ..X ...
	jne b07
	cmp al,[board+8]	; ... ... ..X
	je won
b07:
	; Second diagonal
	cmp al,[board+4]	; ... .X. ...
	jne b08
	cmp al,[board+6]	; ... ... X..
	je won
b08:
	ret
	
won:
	; At this point Al contains the latter which made the line call display_letter
	mov al,0x20			; space
	call display_letter
	mov al,0x77			; w
	call display_letter
	mov al,0x69			; i
	call display_letter
	mov al,0x6e			; n
	call display_letter
	mov al,0x73			; s
	call display_letter
	
do_exit:
	int 0x20
	
show_board:
	mov bx,board
	call show_row
	call show_div
	mov bx,board+3
	call show_row
	call show_div
	mov bx,board+6
	jmp show_row
	
show_row:
	call show_square
	mov al,0xb3
	call display_letter
	call show_square
	mov al,0xb3
	call display_letter
	call show_square
	
show_crlf:
	mov al,0x0d
	call display_letter
	mov al,0x0a
	jmp display_letter
	
show_div:
	mov al,0xc4
	call display_letter
	mov al,0xc5
	call display_letter
	mov al,0xc4
	call display_letter
	mov al,0xc5
	call display_letter
	mov al,0xc4
	call display_letter
	jmp show_crlf
	
show_square:
	mov al,[bx]
	inc bx
	jmp display_letter
	



; --------------
	
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
	
	