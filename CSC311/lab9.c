/* 
 * File:   Lab9-StringFunc.c
 * Author: Erik
 *
 * Created on April 22, 2015, 9:15 PM
 */

#include <stdio.h>
#include <stdlib.h>

int my_strlen(char string[]) {
    int i = 0;
    // We keep counting until NULL
    while (string[i] != '\0'){
        i++;
    }
    // Return length of string
    return i;
}

int my_strcpy(char dest[], char source[]) {
    int des = my_strlen(dest);
    int src = my_strlen(source);
    // Compare length to ensure destination string is larger
    if (des >= src) {
        int i;
        // Loop and copy source string into destination string
        for (i = 0; source[i] != '\0'; i++) {
            dest[i] = source[i];
        }
        dest[i] = '\0';
        // String was copied, exit with 1 to state success
        return 1;
    } else { 
        // Exit with -1 if string is smaller
        return -1;
    }
}

char *my_strcat(char *dest, char *source){
    // Dynamically allocate a new string
    int lendes = my_strlen(dest);
    int lensrc = my_strlen(source);
    char *catstr;
    // Allocate the new string
    catstr = (char*)malloc(sizeof(char)*(lendes+lensrc+1));
    
    int i;
    // Cant use my_strcpy since length is less than source
    for (i = 0; dest+i != '\0'; i++) {
            catstr+=i;
	    catstr = dest+i;
        }
    catstr-=i;
    // Continue from first string
    for (i = lendes; i < (lendes+lensrc); i++){
        catstr+=i;
	catstr = source+(i-lendes); 
    }
    // Terminate string
    catstr+=(1);
    catstr = '\0';
    // Pass the pointer to the new string
    return catstr;
    
}

void my_strreverse(char *string) {
    int length, c;
    char *begin, *end, temp;
   
    // Get length of string
    length = my_strlen(string);
   
    // Initialize pointer swappers
    begin  = string;
    end    = string;
    
    // Set the end pointer to the end
    end+= length-1;
 
    // Begin swap up to the middle
    for (c = 0; c < length/2; c++) {
        // Temp store end so we don't lose it, then lets swap!
        temp   = *end;
        *end   = *begin;
        *begin = temp;
        
        // Move forwards from beginning backwards on end
        begin++;
        end--;
    }    
}

int main() {    
    
    // String length function test section
    int stringlen = 0;
    char strCopyOne[] = "This string is long enough to accept the second string";
    char strCopyTwo[] = "This string is short enough";
    stringlen = my_strlen(strCopyOne);
    printf("Test string one: %s \nTest string one is %i characters long\n", strCopyOne, stringlen);
    stringlen = my_strlen(strCopyTwo);
    printf("Test string two: %s \nTest string two is %i characters long\n", strCopyTwo, stringlen);
    
    // String copy function test section
    
    char strCopyFail[] = "This string is too long to copy from";
    int copySuccess = 0;
    
    printf("\nPASS\nString to copy into: %s\nString to copy from: %s\n", strCopyOne, strCopyTwo);
    copySuccess = my_strcpy(strCopyOne, strCopyTwo);
    printf("Copy function success: %i\nCopy function result: %s\n", copySuccess, strCopyOne);
    
    printf("\nFAIL\nString to copy into: %s\nString to copy from: %s\n", strCopyTwo, strCopyFail);
    copySuccess = my_strcpy(strCopyTwo, strCopyFail);
    printf("Copy function success: %i\nCopy function result: %s\n", copySuccess, strCopyTwo);
    
    // String concatenation function test section
    // Declare pointer to place concatenated string into
    char *catString;
    char stringCatOne[] = "Hello ";
    char stringCatTwo[] = "World!";
    printf("\nStrings to concatenate\nString One: %s\nString Two: %s\n", stringCatOne, stringCatTwo);
    catString = my_strcat(stringCatOne, stringCatTwo);
    printf("Results of concatenated string: %s\n", catString);
    free((void*)catString); // Good habit to free allocated pointers
    
    // String reverse function test section
    char stringToRev[] = "I am not a palindrome";
    printf("\nString to reverse: %s\n", stringToRev);    
    my_strreverse(stringToRev);
    printf("Reversed string: %s\n", stringToRev);
    
    return (0);
}


