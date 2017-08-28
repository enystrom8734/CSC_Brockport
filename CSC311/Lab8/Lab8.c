/* 
 * File:   Lab8.c
 * Author: Erik
 *
 * Created on April 15, 2015, 11:28 PM
 */

#include <stdio.h>
#include <stdlib.h>

/*
 * 
 */
int main() {
    int i1, i2, *intptr1, *intptr2;
    double d1, d2, *dubptr1, *dubptr2;
    
    // Print the addresses of i1, i2, d1, d2
    printf("Address of i1: %p \nAddress of i2: %p \n", &i1, &i2);
    printf("Address of d1: %p \nAddress of d2: %p \n", &d1, &d2);
    
    // Print the addresses of intptr1, intptr2, dubptr1, dubptr2
    printf("\nAddress of intptr1: %p \nAddress of intptr2: %p \n", &intptr1, &intptr2);
    printf("Address of dubptr1: %p \nAddress of dubptr2: %p \n", &dubptr1, &dubptr2);
    
    // Assign the addresses of i1, i2, d1, and d2 to the pointer variables
    intptr1 = &i1;
    intptr2 = &i2;
    dubptr1 = &d1;
    dubptr2 = &d2;
    
    // Print the values of intptr1, intptr2, dubptr1, dubptr2
    printf("\nValue of intptr1: %x \nValue of intptr2: %x \n", intptr1, intptr2);
    printf("Value of dubptr1: %x \nValue of dubptr2: %x \n", dubptr1, dubptr2);
    
    // Assign intptr2 to intptr1 and then to dubptr1;
    intptr1 = intptr2;
    dubptr1 = intptr1;
    
    // Print the values of intptr1, intptr2, dubptr1, dubptr2
    printf("\nValue of intptr1: %x \n", intptr1);
    
    // Print value of type mismatch pointer
    printf("Value of dubptr1: %x \n", dubptr1);
    
    dubptr1 = (double *)intptr1;
    
    printf("Value of dubptr1: %x \n", dubptr1);
    
    // Assign NULL and print value of intptr1
    intptr1 = NULL; 
    printf("\nValue of intptr1: %x \n", intptr1);
    
    // Dereference intptr2 and NULLed intptr1
    printf("\nValue of intptr2: %x \n", *intptr2);
    // BAD CODE!
    // printf("\nValue of intptr1: %x \n", *intptr1);
    
    *intptr2 = 100;
    // Print the addresses of i1, i2, d1, d2
    printf("\nValue of i1: %d \nValue of i2: %d \n", i1, i2);
    
    return (0);
}

