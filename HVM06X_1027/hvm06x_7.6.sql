create database hvm06x_6;

use hvm06x_6;

CREATE TABLE termekek (
tkod INT PRIMARY KEY,  
nev VARCHAR(50) NOT NULL,
ear INT CHECK (EAR > 0), 
kategoria CHAR(20)
); 

Insert into termekek values(1, 'citrom', 15, 'C'); /*rekord felvitele */
Delete from termekek where Ear<X; /* Az X-nél olcsóbb termékek törlése*/
Update termekek set ear= ear*0.9 where kategoria=Y; /*az Y kategóriájú termékek árának csökkentése 10%-al */