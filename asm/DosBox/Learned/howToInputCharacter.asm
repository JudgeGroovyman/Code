; nasm -f bin second.asm -o second.com

;
; The incredible keyboard reading program
;

org 0x0100 		; Start point of program for a COM file
start:
	
	mov ah,0x00	; keyboard read
	int 0x16		; Call the BIOS to read it
	
	cmp al,0x1b	; ESC key pressed?
	je exit_to_command_line
	mov ah,0x0e	; Load AH with code for terminal output
	mov bx,0x000f	; BH is page zero. BL is color (graphic mode)
	int 0x10		; Call the BIOS for displaying one letter
	jmp start

exit_to_command_line:
	int 0x20