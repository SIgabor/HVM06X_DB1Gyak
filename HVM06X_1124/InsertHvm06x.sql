drop database hvm06x;
create database hvm06x;
use hvm06x;

create table tárgy (
kód int primary key,
kredit int check (kredit > 0),
megnevezés varchar(50) not null
);

create table oktató (
neptunkód char(6) primary key,
nev varchar(50) not null,
tanszék varchar(50) not null,
tkód int,
foreign key(tkód) references tárgy(kód)
);

create table hallgató (
neptunkód char(6) primary key,
név varchar(50) not null,
tankör varchar(50) not null,
szül_id date,
életkor int not null,
irszám int not null,
város varchar(50) not null,
utca varchar(50) not null,
hsz varchar(50) not null
);

insert into tárgy values(101, 5, 'Fizika');
insert into tárgy values(102, 3, 'Szoftvertechnológiák');
insert into tárgy values(103, 1, 'Testnevelés');
insert into tárgy values(104, 5, 'Lineáris algebra');
insert into tárgy values(105, 3, 'Analízis');

insert into oktató values('hjk234', 'Varga Zoltán', 'Fizika Tanszék', 101);
insert into oktató values('fgh567', 'Varga Irén', 'Ének Tanszék', 103);
insert into oktató values('glh598', 'Tamás Péter', 'Matematikai Tanszék', 104); 
insert into oktató values('k4gjj5', 'Slyízs István', 'Matematikai Tanszék', 105);
insert into oktató values('asd765', 'Jakab János', 'Informatika Tanszék', 102);

insert into hallgató values('hvm06x', 'Slyízs Gábor', 'GI1BI2', '2001-08-14', 20, 3502, 'Miskolc', 'Dombmellettbalra', 2);
insert into hallgató values('hshs22', 'Lakatos Alfons', 'GF5UG3', '2000-01-05', 22, 2030, 'Budapest', 'Ittmmárjobbra', 6);
insert into hallgató values('kkl456', 'Lakatos Brendon', 'BI3DE3', '1980-03-13', 42, 1010, 'Budapest', 'Abörtönportánkéremleadni', 4);
insert into hallgató values('hdj435', 'Varga Dániel', 'GI2BI1', '2000-11-11', 21, 3531, 'Miskolc', 'Fő', 1);
insert into hallgató values('g6h7j8', 'János Dániel', 'GJ6GK1', '2000-01-01', 21, 3435, 'Miskolc', 'Dombalja', 19);


select * from tárgy;
select * from oktató;
select * from hallgató;
