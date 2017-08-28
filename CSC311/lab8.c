/*
* File:   Lab8.c
* Author: Erik
*
* Created on April 15, 2015, 11:28 PM
*/

#include <stdio.h>
#include <stdlib.h>
#define KNRM  "\x1B[0m"
#define KRED  "\x1B[31m"
#define KGRN  "\x1B[32m"
#define KYEL  "\x1B[33m"
#define KBLU  "\x1B[34m"
#define KMAG  "\x1B[35m"
#define KCYN  "\x1B[36m"
#define KWHT  "\x1B[37m"
#define RESET "\033[0m"

/*
*
*/
int main() {
	int i1, i2, *intptr1, *intptr2;
	double d1, d2, *dubptr1, *dubptr2;

	// Print the addresses of i1, i2, d1, d2
        printf(KBLU "Problem 1. =====================================\n" RESET);
	printf("Address of i1: %p \nAddress of i2: %p \n", &i1, &i2);
	printf("Address of d1: %p \nAddress of d2: %p \n", &d1, &d2);

	// Print the addresses of intptr1, intptr2, dubptr1, dubptr2
        printf(KBLU "\nProblem 2. =====================================" RESET);
	printf("\nAddress of intptr1: %p \nAddress of intptr2: %p \n", &intptr1, &intptr2);
	printf("Address of dubptr1: %p \nAddress of dubptr2: %p \n", &dubptr1, &dubptr2);

	// Assign the addresses of i1, i2, d1, and d2 to the pointer variables
	printf(KBLU "\nProblem 3. =====================================" RESET);
	intptr1 = &i1;
	intptr2 = &i2;
	dubptr1 = &d1;
	dubptr2 = &d2;

	// Print the values of intptr1, intptr2, dubptr1, dubptr2
	printf("\nValue of intptr1: %x \nValue of intptr2: %x \n", intptr1, intptr2);
	printf("Value of dubptr1: %x \nValue of dubptr2: %x \n", dubptr1, dubptr2);

	// Assign intptr2 to intptr1 and then to dubptr1 (with typecasting after)
        printf(KBLU "\nProblem 4. =====================================" RESET);
	intptr1 = intptr2;
//	dubptr1 = intptr1;

	// Print the values of intptr1, dubptr1
	printf("\nValue of intptr1: %x \n", intptr1);

	// Print value of type mismatch pointer
//	printf("Value of dubptr1 mismatched type: %x \n", dubptr1);

	dubptr1 = (double *)intptr1;

	printf("Value of dubptr1 with typecasting: %x \n", dubptr1);

	// Assign NULL and print value of intptr1
        printf(KBLU "\nProblem 5. =====================================" RESET);
	intptr1 = NULL;
	printf("\nValue of intptr1: %x \n", intptr1);

	// Dereference intptr2 and NULLed intptr1
        printf(KBLU "\nProblem 6. =====================================" RESET);
	printf("\nValue of intptr2: %x \n", *intptr2);
	// BAD CODE!
	// printf("\nValue of intptr1: %x \n", *intptr1);
	
        printf(KBLU "\nProblem 7. =====================================" RESET);
	*intptr2 = 100;
	// Print the values of i1 and i2
	printf("\nValue of i1: %d \nValue of i2: %d \n", i1, i2);

	// Value and deref of intptr2 and dubptr2 +/- 1
        printf(KBLU "\nProblem 8. =====================================" RESET);
	printf("\nValue of (intptr2 + 1): %x\nValue of (dubptr2 + 1): %x", intptr2 + 1, dubptr2 + 1);
	printf("\nValue of *(intptr2 + 1): %d\nValue of *(dubptr2 + 1): %f", *intptr2 + 1, *dubptr2 + 1);
	printf("\nValue of (intptr2 - 1): %x\nValue of (dubptr2 - 1): %x", intptr2 - 1, dubptr2 - 1);
	printf("\nValue of *(intptr2 - 1): %d\nValue of *(dubptr2 - 1): %f\n", *intptr2 - 1, *dubptr2 - 1);

	// Set intptr1 to address of i1
        printf(KBLU "\nProblem 9. =====================================" RESET);
	intptr1 = &i1;
	printf("\nDoes intptr1 == inptr2? %d", intptr1 == intptr2);
	printf("\nDoes *intptr1 == *inptr2? %d", *intptr1 == *intptr2);

	// Set intptr1 to address of i2
	intptr1 = &i2;
	printf("\n\nDoes intptr1 == inptr2? %d", intptr1 == intptr2);
	printf("\nDoes *intptr1 == *inptr2? %d\n", *intptr1 == *intptr2);

	// Allocate memory with malloc()
        printf(KBLU "\nProblem 10. ====================================" RESET);
	double *ptr = (double *)malloc(sizeof(double));
	*ptr = 3.1416;

	// Values of ptr and *ptr
	printf("\nValue of ptr: %p \nValue of *ptr: %f\n", ptr, *ptr);


	// Lets free the memory then reallocate it!
        printf(KBLU "\nProblem 11. ====================================" RESET);
	free((void *)ptr);
	ptr = (double *)malloc(sizeof(double));
	printf("\nValue of ptr: %p\n", ptr);
	
	printf(KBLU "\n================================================\n" RESET);	
	free((void *)ptr);	
//	getch();

	return (0);
}
