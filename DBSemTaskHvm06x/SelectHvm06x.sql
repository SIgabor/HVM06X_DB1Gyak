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

insert into Autó values('a1234', 'kék', 'Mercedes', 4000000, '2022-05-14');
insert into Autó values('a1111', 'piros', 'Opel', 400000, '2022-01-02');
insert into Autó values('a2011', 'zöld', 'Ford', 700000, '2022-11-30');
insert into Autó values('a4567', 'kék', 'Nissan', 2000000, '2022-02-24');
insert into Autó values('a0012', 'szürke', 'Opel', 1500000, '2022-07-20');

insert into Extrák values('e0001', 'tetőablak', 250000, 15);
insert into Extrák values('e0123', 'ülésfűtés', 100000, 30);
insert into Extrák values('e1443', 'elektromos tükör', 100000, 10);
insert into Extrák values('e2301', 'elektromos ablakemelő', 50000, 10);
insert into Extrák values('e4001', 'kormányfűtés', 75000, 5);
insert into Extrák values('e5213', 'tempomat', 125000, 25);
insert into Extrák values('e6221', 'sávtartó', 125000, 20);
insert into Extrák values('e5321', 'mélyláda', 50000, 0);

insert into AE values('a1234', 'e0001', 1);
insert into AE values('a1234', 'e0123', 1);
insert into AE values('a1234', 'e1443', 0);
insert into AE values('a1234', 'e2301', 0);
insert into AE values('a1234', 'e4001', 1);
insert into AE values('a1234', 'e5213', 1);
insert into AE values('a1234', 'e6221', 0);
insert into AE values('a1234', 'e5321', 1);

insert into AE values('a1111', 'e0001', 0);
insert into AE values('a1111', 'e0123', 1);
insert into AE values('a1111', 'e1443', 1);
insert into AE values('a1111', 'e2301', 1);
insert into AE values('a1111', 'e4001', 0);
insert into AE values('a1111', 'e5213', 1);
insert into AE values('a1111', 'e6221', 0);
insert into AE values('a1111', 'e5321', 1);

insert into AE values('a2011', 'e0001', 1);
insert into AE values('a2011', 'e0123', 0);
insert into AE values('a2011', 'e1443', 0);
insert into AE values('a2011', 'e2301', 0);
insert into AE values('a2011', 'e4001', 0);
insert into AE values('a2011', 'e5213', 0);
insert into AE values('a2011', 'e6221', 1);
insert into AE values('a2011', 'e5321', 1);

insert into AE values('a4567', 'e0001', 0);
insert into AE values('a4567', 'e0123', 1);
insert into AE values('a4567', 'e1443', 1);
insert into AE values('a4567', 'e2301', 0);
insert into AE values('a4567', 'e4001', 1);
insert into AE values('a4567', 'e5213', 1);
insert into AE values('a4567', 'e6221', 1);
insert into AE values('a4567', 'e5321', 0);

insert into AE values('a0012', 'e0001', 1);
insert into AE values('a0012', 'e0123', 0);
insert into AE values('a0012', 'e1443', 0);
insert into AE values('a0012', 'e2301', 0);
insert into AE values('a0012', 'e4001', 0);
insert into AE values('a0012', 'e5213', 1);
insert into AE values('a0012', 'e6221', 1);
insert into AE values('a0012', 'e5321', 0);

insert into Fizetés values('f1111', 'készpénz','OTP', '2021-09-30');
insert into Fizetés values('f2111', 'átutalás', 'OTP', '2021-11-11');
insert into Fizetés values('f1211', 'készpénz','K&H','2021-06-01');
insert into Fizetés values('f4211', 'átutalás', 'OTP','2021-03-21');
insert into Fizetés values('f5121', 'átutalás', 'K&H','2021-04-04');

insert into Rendelés values('r0001', '2021-11-26', 150000, 15, null, null, 'a1234','e0001, e0123, e4001, e5213, e5321', 'f1111');
insert into Rendelés values('r0002', '2021-10-30', 450000, 0, null, null, 'a1111','e0123, e1443, e2301, e5213, e5321', 'f2111');
insert into Rendelés values('r0003', '2021-04-11', 500000, 10, null, null, 'a2011','e0001, e6221, e5321', 'f1211');
insert into Rendelés values('r0004', '2021-01-01', 1000000, 20, null, null, 'a4567','e0123, e1443, e4001, e5213, e6221', 'f4211');
insert into Rendelés values('r0005', '2021-02-22', 555000, 50, null, null, 'a0012','e0001, e5213, e6221', 'f1111');
 
insert into Vásárló values('v0001', 'Ferenc László', 3234, 'Miskolc', 'Pénzes', 3, 707989678, 'r0001');
insert into Vásárló values('v0002', 'Tóth László', 2211, 'Pécs', 'Drót', 22, 305849674, 'r0002');
insert into Vásárló values('v0003', 'Pán Péter', 1232, 'Budapest', 'Blaha', 1, 709876543, 'r0003');
insert into Vásárló values('v0004', 'Lakatos Eurél', 3535, 'Miskolc', 'Domb', 6, 301234567, 'r0004');
insert into Vásárló values('v0005', 'Naranjo-Rosales Bendegúz Vulkán', 2333, 'Eger', 'Halas', 7, 709732956, 'r0005');


select vásárló_id, név, telefonszám from Vásárló;
select modell, szín, a_ár from Autó;
select megnevezés, e_ár, pluszIdő from Extrák;
select ae_id, ee_id, kompatibilitás from AE where kompatibilitás=1;
select rendelés_id, dátum_idő, várhatóÉrkezés, kedvezmény from Rendelés where kedvezmény>0;
select rendelés_id,(összeg - összeg * kedvezmény / 100) as fizetendő from Rendelés;

select Rendelés.rendelés_id, Autó.autó_id, Autó.modell from Rendelés inner join Autó on Rendelés.a_id=Autó.autó_id;
select Rendelés.rendelés_id, Fizetés.mód, Fizetés.bank from Fizetés inner join Rendelés on Rendelés.f_id=Fizetés.fizetés_id where Fizetés.mód='készpénz';
select Vásárló.név, Rendelés.várhatóÉrkezés, Autó.modell from Vásárló inner join Rendelés on Rendelés.rendelés_id=Vásárló.r_id inner join Autó on Autó.autó_id=Rendelés.a_id;
select Vásárló.név, Vásárló.vásárló_id, Rendelés.rendelés_id, Fizetés.mód, Fizetés.bank from Vásárló inner join Rendelés on Vásárló.r_id=Rendelés.rendelés_id inner join Fizetés on Fizetés.fizetés_id=Rendelés.f_id where Vásárló.név='Ferenc László';
select Extrák.megnevezés, Autó.modell, Autó.autó_id from Extrák inner join AE on AE.ee_id=Extrák.extra_id inner join Autó on Autó.autó_id=AE.ae_id where Extrák.megnevezés='tetőablak';