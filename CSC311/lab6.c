#include <stdio.h>

int main()
{
        // Declare int1, int2, int3and int4 as integers
        int int1, int2, int3,int4;
        int intDigits[5];

        // Prompt user for int1
        printf("\nPlease enter int1: ");
        // Wait for user input for int1
        scanf("%d", &int1);
        // Prompt user for int2
        printf("Please enter int2: ");
        // Wait for user input for int2
        scanf("%d", &int2);
        // Prompt user for int3
        printf("Please enter int3: ");
        // Wait for user input for int3
        scanf("%d", &int3);

        // Do math on ints 1 - 3
        int output = int1*int2-int3;

        printf("\nYour output is %d\n\n", output);

        // Series of printf statements using new line characters
        printf("This is a C program\n\n");
        printf("This is\na C program\n\n");
        printf("This\nis\na\nC\nprogram\n\n");
        printf("This\tis\ta\tC\tprogram\n\n");
        printf("***** \n**** \n*** \n** \n*\n\n");

        printf("Please enter in 5 digit integer: ");
        scanf("%d", &int4);

        // Check for invalid integer length
        if ((int4 > 99999) || (int4 < -99999)) {
                printf("\nYour number is longer than 5 digits.\n\n");
        } else {
                int i;
                // Split the integer in to individual values
                for (i = 0; i < 5; i++) {
                        intDigits[i] = int4 % 10;
                        int4 = int4 / 10;
                }
                // Print the integer with 3 spaces in between
                printf("Your digits:   %i   %i   %i   %i   %i   \n",intDigits[4],intDigits[3],intDigits[2],intDigits[1],intDigits[0]);
        }
        return 0;
}
