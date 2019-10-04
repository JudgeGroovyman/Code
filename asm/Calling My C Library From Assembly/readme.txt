
To Compile the library:
 gcc -c myLibrary.c -o myLibrary.o

To Compile the C Example
 gcc -c myLibraryExample.c -o example.o
 
To Link the C Example
 gcc example.o myLibrary.o -o example
 
To Run the C Example
 ./example
 
 To Compile the Asm Example
/usr/local/bin/nasm -f macho64 myLibraryExample.asm && gcc -arch x86_64 -o exampleAsm myLibraryExample.o myLibrary.o && ./exampleAsm
