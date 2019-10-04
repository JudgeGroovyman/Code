#include "myLibrary.h"
#include <stdio.h>
int foo(int a) {
	printf ("\n");
	if (a < 100) {
		printf("Number is: %i\n",a);
		for (int i = 0; i < a; i++) {
			printf("d");
		}
		printf("\n");
	}
	else {
		printf("Number very large: %i\n",a);
	}
	return 0;
}
int doo(char * a) {
	printf("Hey | %s |\n",a);
	return 0;
}
