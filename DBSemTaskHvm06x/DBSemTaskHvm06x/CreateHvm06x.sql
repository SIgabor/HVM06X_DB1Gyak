drop database hvm06x;
create database hvm06x;
use hvm06x;

SET FOREIGN_KEY_CHECKS=0;

create table Autó (
autó_id char(5) primary key,
szín varchar(50) not null,
modell varchar(50) not null,
a_ár int not null,
készenlétiIdő date
);

create table Extrák (
extra_id char(5) primary key,
megnevezés varchar(50) not null,
e_ár int not null,
pluszIdő int
);

create table AE (
ae_id char(5),
foreign key (ae_id) references Autó(autó_id),
ee_id char(5),
foreign key (ee_id) references Extrák(extra_id),
kompatibilitás int
);

create table Fizetés (
fizetés_id char(5) primary key,
mód varchar(50) not null,
bank varchar(50),
fizetve_dátum date
);

create table Rendelés (
rendelés_id char(5) primary key,
dátum_idő date,
összeg int,
kedvezmény int,
fizetendő int default null,
várhatóÉrkezés date,
a_id char(5),
foreign key (a_id) references Autó(autó_id),
e_id char(50),
foreign key (e_id) references Extrák(extra_id),
f_id char(5),
foreign key (f_id) references Fizetés(fizetés_id)
);



create table Vásárló (
vásárló_id char(5) primary key,
név varchar(50) not null,
irszám int not null,
város varchar(50) not null,
utca varchar(50) not null, 
hsz int not null,
telefonszám long,
r_id char(5),
foreign key (r_id) references Rendelés(rendelés_id)
);

