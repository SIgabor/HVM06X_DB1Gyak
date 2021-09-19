#include <stdio.h>
#include <stdlib.h>
#include <string.h>
void felvetel();

typedef struct Szemelyek{
    int id;
    char nev[50];
}Szemelyek;

int main()
{
    printf("Hello world!\n");

    return 0;
}

void felvetel(){
    Szemelyek sz;
    FILE* fptr;
    fptr = fopen("binfajl.bin", "wb");
    printf("Azonosito 8 szamjegy: ");
    scanf("%d", &sz.id);
    printf("\nNev: ");
    scanf("%50[^\n]", sz.nev);
    fwrite(&sz, sizeof(Szemelyek), 1, fptr);
    fclose(fptr);
}

void torles(){
    Szemelyek sz;
    Szemelyek Osszes[5];
    FILE* fptr;
    fptr = fopen("binfajl.bin", "rb");
    int i = 0;
    while(fread(&sz, sizeof(Szemelyek), 1, fptr)){
        printf("\n Azonosito: %d\tNev: %s", sz.id, sz.nev);
        Osszes[i].id = sz.id;
        strcpy(Osszes.nev, sz.nev);
        i++;
    }
}
