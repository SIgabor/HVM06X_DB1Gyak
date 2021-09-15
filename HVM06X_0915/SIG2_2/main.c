#include <stdio.h>
#include <stdlib.h>

int main()
{
    iras();
    return 0;
}

void iras(){
    FILE *fp;
    char ch;
    char fnev[50];
    printf("Filenev: ");
    scanf("%s", fnev);
    fp = fopen(fnev, "w");
    printf("Uzenet: ");
    while((ch = getchar()) != '#'){
        putc(ch, fp);
    }
    fclose(fp);

    fp = fopen(fnev, "r");
    while((ch = getc(fp)) != EOF){
        printf("%c", toupper(ch));
    }
    fclose(fp);
    return 0;
}
