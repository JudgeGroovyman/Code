; ------------------------------------------------------------------------------
;	gcc -c myLibrary.c -o myLibrary.o

;       /usr/local/bin/nasm -f macho64 myLibraryExample.asm && gcc -arch x86_64 -o exampleAsm myLibraryExample.o myLibrary.o && ./exampleAsm
; ------------------------------------------------------------------------------

  global _main
  extern _foo

  section .text
_main:
  sub     rsp, 8

  lea     rdi, [message]        ; Use this instead of 'mov rdi, message'
  call    _foo
  add     rsp, 8
  ret

  section .data
message:
default rel                     ; Add 'default rel' under label
  db   "Hola, mundo",0