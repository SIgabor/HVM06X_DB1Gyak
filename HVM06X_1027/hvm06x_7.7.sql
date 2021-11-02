create database hvm06x_7;

use hvm06x_7; 

CREATE TABLE termekek (
tkod INT PRIMARY KEY, 
nev VARCHAR(50) NOT NULL,
ear INT CHECK (EAR > 0), 
kategoria CHAR(20)
);

alter table termekek add (szín char(20)); /*új szín mező felvitele */
drop table termekek; /*termekek tábla megszüntetese */
delete from termekek where kategoria is null; /*azon mezők megszüntetése,ahol nincs kitöltve a kategoria */