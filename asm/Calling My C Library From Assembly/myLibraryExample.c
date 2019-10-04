// --------------------------------------------------
// gcc -c myLibrary.c -o myLibrary.o
// gcc -c myLibraryExample.c -o example.o
// gcc example.o myLibrary.o -o example
// ./example
// --------------------------------------------------

#include "myLibrary.h"

int main() {
	foo(11);
	return 0;
}