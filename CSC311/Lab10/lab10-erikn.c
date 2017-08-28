/* 
 * File:   lab10.c
 * Author: Erik
 *
 * Created on May 6, 2015, 12:05 AM
 */
 
#include <stdio.h>
#include <stdlib.h>
#include <ctype.h>

int main() {
    int c, lowCount=0, upCount=0, wSpaceCount=0, digitCount=0, i=0;
    char input[80] = "";
    
    printf("\nEnter any input from the keyboard. To end input, enter \'z\'\n\n");
    
    do {
        c = getchar();
        if (c == 'z') {
            break;
        } else if (islower(c)) {
            c = toupper(c);
            lowCount++;
        } else if (isupper(c)) {
            c = tolower(c);
            upCount++;
        } else if (isspace(c)) {
            wSpaceCount++;
        } else if (isdigit(c)) {
            digitCount++;
        }
        
        input[i++] = c;
    } while (i < 80);
    
    
    printf("\n%s", input);
    
    printf("\nThe number of whitespace characters is: %d\n", wSpaceCount);
    printf("The number of digits is: %d\n", digitCount);
    printf("The number of lowercase characters is: %d\n", lowCount);
    printf("The number of uppercase characters is: %d\n", upCount);
    
    printf("\nGoodbye\n");
    
    return(1);
}