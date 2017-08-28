#include <stdio.h>
#include <stdlib.h>
#include <string.h>

int main() {
    int n; //String length
    int input = 0;
    char binaryInput[256]; //String to put binary number in
    char c, d, cont = 1;
    while (cont == 1) {
        printf("Base of input integer: Enter b for binary, d for decimal, h for hexadecimal or o for octal: ");
        scanf(" %c", &c);
        printf("Enter the number: ");
        if (c == 'd') {
            scanf("%i", &input);
        } else if (c == 'h') {
            scanf("%x", &input);
        } else if (c == 'o') {
            scanf("%o", &input);
        } else if (c == 'b') {
            scanf(" %s",binaryInput);
            n = strlen(binaryInput);
            int i;
            int dec = 0;
            for (i = 0; i < n; i++) {
                dec = dec * 2;
                dec = dec + (binaryInput[i]-'0');
            }
            input = dec;
        } 
        printf("Enter the base of the output (d, h, or o): ");
        scanf(" %c", &d);
        if (d == 'd') {
            if (c == 'd') {
                printf("The integer %i in decimal is %i in decimal\n", input, input);
            }else if (c == 'h') {
                printf("The integer %X in hexadecimal is %i in decimal\n", input, input);
            } else if (c == 'o') {
                printf("The integer %o in octal is %i in decimal\n", input, input);
            } else if (c == 'b') {
                printf("The integer %s in binary is %i in decimal\n", binaryInput, input);
            }            
        } else if (d == 'h') {
            if (c == 'd') {
                printf("The integer %i in decimal is %X in hexadecimal\n", input, input);
            }else if (c == 'h') {
                printf("The integer %X in hexadecimal is %X in hexadecimal\n", input, input);
            } else if (c == 'o') {
                printf("The integer %o in octal is %X in hexadecimal\n", input, input);
            } else if (c == 'b') {
                printf("The integer %s in binary is %X in hexadecimal\n", binaryInput, input);
            } 
        } else if (d == 'o') {
            if (c == 'd') {
                printf("The integer %i in decimal is %o in octal\n", input, input);
            }else if (c == 'h') {
                printf("The integer %X in hexadecimal is %o in octal\n", input, input);
            } else if (c == 'o') {
                printf("The integer %o in octal is %o in octal\n", input, input);
            } else if (c == 'b') {
                printf("The integer %s in binary is %o in octal\n", binaryInput, input);
            } 
        }
        printf("Do you wish to do to another? ( Y or N ): ");        
        scanf(" %c", &c);
        if ((c == 'Y') || (c == 'y')) {
                cont = 1;
        } else if ((c == 'N') || (c == 'n')) {
                cont = 0;
        }
    }
    return (0);
}
