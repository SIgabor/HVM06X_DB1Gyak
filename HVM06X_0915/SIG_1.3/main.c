#include <stdio.h>
#include <string.h>
#include <stdlib.h>

int main(void)
{
    char line[80];

    //Step 1: Open text files and check that they open//
    FILE *fp1, *fp2;
    fp1 = fopen("szavak1.txt","r");
    fp2 = fopen("szavak2.txt","w");

    while(fgets(line, sizeof(line), fp1) !=NULL)
    {
        fprintf(fp2, "%s", line);
    }

    printf("Szoveg sikeresen bemasolva!");

    fclose(fp1);
    fclose(fp2);
    return 0;
}
