
To Compile the library:
 gcc -c myLibrary.c -o myLibrary.o

For just the C Example:
Compile
 gcc -c myLibraryExample.c -o example.o
Link
 gcc example.o myLibrary.o -o example
Run
 ./example
 
For just the Asm Example:
Compile
 /usr/local/bin/nasm -f macho64 myLibraryExample.asm
Link
 gcc -arch x86_64 -o exampleAsm myLibraryExample.o myLibrary.o 
Run:
 ./exampleAsm
All:
 nasm -f macho64 myLibraryExample.asm && gcc -arch x86_64 -o exampleAsm myLibraryExample.o myLibrary.o && ./exampleAsm

Compile the library and CLR the asm:
 gcc -c myLibrary.c -o myLibrary.o &&  nasm -f macho64 myLibraryExample.asm && gcc -arch x86_64 -o exampleAsm myLibraryExample.o myLibrary.o && ./exampleAsm



