/* 
 * File:   erikn-assign3.c
 * Author: Erik Nystrom
 *
 * Count carry operations between two integers 
 *
 * Created on April 7, 2015, 11:08 PM
 */

#include <stdio.h>
#include <stdlib.h>

int main() {
    long int number1, number2;
    int carry, operations, nr1, nr2;
	// Always loop, break only if 0 is explicitly entered for number1
    while (1){
        printf("Enter two integers to determine their carry operations.\n");
        printf("Enter 0 for number 1 to exit the program.\n");
        printf("Enter number 1: ");
        scanf("%i", &number1);
		if (number1 == 0) break; // Break if number entered is 0
        printf("Enter number 2: ");
        scanf("%i", &number2);
        carry = operations = 0; // Init carry and operations to 0
		// While number1 or number2 are greater than 0
        while ((number1 != 0) || (number2 != 0)) {
			// We must carry if a single digit
            nr1 = number1 % 10, nr2 = number2 % 10;
            if (((carry + nr1 + nr2) >= 10) || ((carry + nr1 + nr2) <= -10)){
                operations++;
                  carry = (nr1 + nr2 + carry)/10;
//		  carry = 1;
            } else {
                carry = 0;
            }
            number1 /= 10;
            number2 /= 10;
        }
        printf("\nYour selected numbers have %i carry operations\n\n", operations);
    }
    return (0);
}
