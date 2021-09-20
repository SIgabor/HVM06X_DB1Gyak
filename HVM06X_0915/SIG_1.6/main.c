#include <stdlib.h>
#include <string.h>
#include <stdio.h>

struct gepjarmu{
    char rendszam[8];
    char szin[20];
    int ar;
}Auto[100];

int ossz=0;
int db=0;

int main(){

    FILE *fp;
    fp = fopen("autok.bin", "rb");

    int szam=0;
    printf("Hany adatot szeretne felvinni?\n");
    scanf("%d", &szam);

    int i=0;

    while(i<szam){

        printf("Adja meg az auto rendszamat! ");
        scanf("%s", &Auto[i].rendszam);

        printf("Adja meg az auto szinet! ");
        scanf("%s", &Auto[i].szin);

        printf("Adja meg az auto arat! ");
        scanf("%d", &Auto[i].ar);

        fwrite(&(Auto[i]), sizeof(struct gepjarmu),1,fp);
        fwrite("\n", 1, 1, fp);

        i++;
        ossz++;
    }

    fclose(fp);

    piros();
    atlag();
    max();
}

int piros(){

    FILE *fp = fopen("autok.bin", "rb");
    char ch;
    int pszin = 0;
    fseek(fp, (ossz-1)*sizeof(struct gepjarmu),0);
    fread(&(Auto[ossz]), sizeof(struct gepjarmu), 1,fp);

    for(int i=0; i<ossz; i++)
    {
            if (strcmp(Auto[i].szin, "piros")==0)
            {
                pszin++;
            }

            fread(&(Auto[i]), sizeof(struct gepjarmu), 1, fp);

    }

    printf("\n%d piros auto van.", pszin);

    fclose(fp);

}

void atlag(){

    FILE *fp = fopen("autok.bin", "rb");
    int sum = 0;

    for(int i=0; i<ossz; i++)
    {
        fseek(fp, (ossz-1)*sizeof(struct gepjarmu),0);
        sum = sum + Auto[i].ar;
    }

    printf("\nAz autok aranak atlaga: %.2f", sum/ossz);

    fclose(fp);

}

void max(){

    FILE *fp = fopen("autok.bin", "rb");
    int max = Auto[0].ar;
    int index=0;

    for(int i=0; i<ossz; i++)
    {
        fseek(fp, (ossz-1)*sizeof(struct gepjarmu),0);
        if(Auto[i].ar>max){
            max = Auto[i].ar;
            index = i;
        }
    }

    printf("\nA legdragabb auto \nRendszama: %s\nSzine: %s\nAra: %d\n", Auto[index].rendszam, Auto[index].szin, Auto[index].ar);

    fclose(fp);

}
