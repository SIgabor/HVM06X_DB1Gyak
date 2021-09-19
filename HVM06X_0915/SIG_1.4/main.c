#include <stdio.h>
#include <stdlib.h>
#include <string.h>
void visszaolvasas();

typedef struct Auto{
    char rendszam[8];
    char tipus[20];
    int ar;
}Auto;

int main()
{
    FILE* fptr;
    Auto Auto1;
    Auto Auto2;
    Auto Auto3;

     strcpy(Auto1.rendszam, "ASD-123");
     strcpy(Auto1.tipus, "MERCEDES");
     Auto1.ar = 3000000;

     strcpy(Auto2.rendszam, "DFG-456");
     strcpy(Auto2.tipus, "OPEL");
     Auto2.ar = 600000;

     strcpy(Auto3.rendszam, "HJK-798");
     strcpy(Auto3.tipus, "FORD");
     Auto3.ar = 1400000;

     fptr = fopen("binfajl.bin", "wb");
     fwrite(&Auto1, sizeof(Auto), 1, fptr);
     fwrite(&Auto2, sizeof(Auto), 1, fptr);
     fwrite(&Auto3, sizeof(Auto), 1, fptr);
     fclose(fptr);

     int a = -1;
     printf("Adja meg a kivant auto sorszamat 1-3-ig: ");
     scanf("%d", &a);
     visszaolvasas(a);



    return 0;
}

void visszaolvasas(int index){
    FILE* fptr;
    Auto Seged;
    Auto Autok[3];
    int i = 0;
    fptr = fopen("binfajl.bin", "rb");
    while(fread(&Seged, sizeof(Auto), 1, fptr)){
        strcpy(Autok[i].rendszam, Seged.rendszam);
        strcpy(Autok[i].tipus, Seged.tipus);
        Autok[i].ar = Seged.ar;
        i++;
    }
    printf("Rendszam: %s \nTipus: %s \nAr: %d Ft", Autok[index-1].rendszam, Autok[index-1].tipus, Autok[index-1].ar);
    fclose(fptr);
}
