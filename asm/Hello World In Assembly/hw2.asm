; --------------------------------------------------------
; nasm -f macho64 hw2.asm && gcc -arch x86_64 -o hw2 hw2.o && ./hw2
; --------------------------------------------------------


	global _main
	extern _puts

	section .text
_main:
	sub		rsp, 8
	
	lea		rdi, [message] ; use lea instead of mov rdi
	call		_puts
	add		rsp, 8
	ret
	
	section	.data
message:
default rel		; put under label when referencing labeled memory
	db		"Hola, mundo",0