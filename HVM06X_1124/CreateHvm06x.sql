drop database hvm06x;
create database hvm06x;
use hvm06x;

create table tárgy (
kód int primary key,
kredit int check (kredit > 0),
megnevezés varchar(50) not null
);

create table oktató (
neptunkód int primary key,
nev varchar(50) not null,
tanszék varchar(50) not null,
tkód int,
foreign key(tkód) references tárgy(kód)
);

create table hallgató (
neptunkód int primary key,
név varchar(50) not null,
tankör varchar(50) not null,
szül_id date,
életkor int not null,
irszám int not null,
város varchar(50) not null,
utca varchar(50) not null,
hsz varchar(50) not null
);


