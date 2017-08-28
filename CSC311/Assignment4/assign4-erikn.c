/* 
 * File:   Assign4.c
 * Author: Erik
 *
 * Created on May 1, 2015, 12:23 AM
 */

#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <ctype.h>

void newlineChop(char *choppy){
    int i;
    for (i = 0; i < strlen(choppy); i++){
        // Chop off new line (Windows support!)
        if (choppy[i] == '\n' || choppy[i] == '\r'){
            choppy[i] = '\0';
            return;
        }
    }
}

void letterWrite(char *lineStr, char *replace, int lineLen, int index){
    char *tempBuff;
    char *lineCat;
    int replaceLen = strlen(replace),lineLenEnd;
    
    lineCat = lineStr+index+3;
    lineLenEnd = strlen(lineCat);
    tempBuff = calloc(lineLen+replaceLen+1,sizeof(char));

    if (tempBuff == NULL){
        printf("tempBuff is NULL!\n");
        return;
    }
    
    // We need to break off the last part, then concat after we add our replacement
    strncpy(tempBuff, lineStr, index);
    newlineChop(replace); // We don't need no newline here
    strncat(tempBuff, replace, replaceLen);
    strncat(tempBuff, lineCat, lineLenEnd);
    strncpy(lineStr, tempBuff, lineLen+replaceLen);
    
    free(tempBuff);

}

void address_letter(char *output, char *letter, char *recip){
    FILE *outFile,*letterFile,*recFile;
    char readRecipient[80], letterRead[180];
    char recipient[5][80];
    int recipientCount = 1;
        
    outFile = fopen(output, "w");
    if (outFile == NULL){
        printf("Can't open output file.\n");
        exit(1);
    }    
   
    recFile = fopen(recip, "r");
    if (recFile == NULL){
        printf("Can't open recipients file.\n");
        exit(1);
    } 
    
    // Loop until end of recipients file
    while (!feof(recFile)){
        
        // Lets get the recipient info first
        int bool = 0, i = 0;
        //for (i = 0; i < 6; i++){
        /*
         *  recipient 0 = Full Name
         *  recipient 1 = First Name
         *  recipient 2 = Last Name
         *  recipient 3+4 = Address
         */
        printf("***************** Begin Recipient %d *****************\n", recipientCount);
        while (!bool) {
            fgets(readRecipient, 80, recFile);
            if (isspace(readRecipient[0]) || i >= 5) {
                bool = 1;
            } else {
                strncpy(recipient[i], readRecipient, 80);
                i++;
            }
        }
        strncat(recipient[3], recipient[4], 80);
        // Lets pull that letter in and match some stuff up
        letterFile = fopen(letter, "r");
        if (letterFile == NULL){
            printf("Can't open letter file.\n");
            exit(1);
        }
        while (!feof(letterFile)){
            int bool = 0, j, letterLineLen = 0;
            // Get the letter line input
            fgets(letterRead, 180, letterFile);
            letterLineLen = strlen(letterRead);
            for (j = 0; j < letterLineLen; j++){
                // Check if we need to replace
                if (letterRead[j] == '#' && letterRead[j+1] == 'N' && letterRead[j+2] == '#') {
                    letterWrite(letterRead, recipient[0], letterLineLen, j);
                    letterLineLen  = strlen(letterRead); //Need to add new length                 
                } else if (letterRead[j] == '#' && letterRead[j+1] == 'A' && letterRead[j+2] == '#'){
                    strncpy(letterRead, recipient[3], 80);
                } else if (letterRead[j] == '#' && letterRead[j+1] == 'F' && letterRead[j+2] == '#'){
                    letterWrite(letterRead, recipient[1], letterLineLen, j);
                    letterLineLen  = strlen(letterRead); //Need to add new length
                } else if (letterRead[j] == '#' && letterRead[j+1] == 'L' && letterRead[j+2] == '#'){
                    letterWrite(letterRead, recipient[2], letterLineLen, j);
                    letterLineLen  = strlen(letterRead); //Need to add new length
                } 
            }
            // Output what we need and replaced out to file
            if (!feof(letterFile)) {
                fprintf(outFile, "%s", letterRead);
                printf("%s", letterRead);   
            }
        }
        fprintf(letterFile,"\n\n\n");
        fclose(letterFile);
        printf("\n***************** End Recipient %d *****************\n\n", recipientCount);
        recipientCount++;
    }
    
    // Close out last file pointers
    fclose(outFile);    
    fclose(recFile);
    return;
    
}

int main(int argc, char** argv) {
    
    if (argc != 4) {
        printf("\nNot enough arguments provided\n");
    } else {
        address_letter(argv[1], argv[2], argv[3]);
        printf("Main loop success!\n");
    }

    return (0);
}

