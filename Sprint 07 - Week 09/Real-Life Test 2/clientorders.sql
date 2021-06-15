-- drop database clientorders;

create database Clientorders;
GO
use Clientorders;
GO
create table rep
(
repref		smallint primary key,
RepFirstname	varchar(20),
RepLastName	varChar(20),
commission	decimal(10,2)
);
GO

create table part
(
partref		smallint primary key,
description	varchar(30),
onHand		smallint,
warehouseRef	smallint,
unitPrice	decimal (10,2)
);
GO

create table client
(
custref		smallint primary key,
firstname	Varchar(20),
lastname	Varchar(20),	
city		Varchar(20),
balance		decimal(10,2),
creditlimit		integer,
repref		smallint,
foreign key (repref) references rep (repref)
);
GO

create table custorder
(
orderref	smallint primary key,
orderdate	date,
custref		smallint,
foreign key (custref) references client (custref)
);
GO

create table orderline
(
orderref	smallint,
partref		smallint,
quantity	smallint,
quotedPrice	decimal (10,2),
primary key (orderref, partref),
foreign key (orderref) references custorder (orderref),
foreign key (partref) references part (partref)
);
GO
insert into rep values(3, 'Mary',  'Jones', 10);
insert into rep values(6, 'William', 'Smith', 12.5);
insert into rep values(11, 'Sam', 'Brown', 10);

insert into client values(124, 'Sally', 'Adams', 'Dunedin', 418.75, 500, 3);
insert into client values(256, 'Ann', 'Samuals', 'Palmerston', 10.75, 800, 11);
insert into client values(311, 'Don', 'Charles', 'Christchurch', 200.10, 300, 6);
insert into client values(315, 'Tom', 'Daniels', 'Christchurch', 320.75, 300, 3);
insert into client values(405, 'Al', 'Williams', 'Christchurch', 201.75, 800, 11);
insert into client values(412, 'Sandra', 'Adams', 'Palmerston', 908.75, 1000, 6);
insert into client values(522, 'Mary', 'Nelson', 'Christchurch', 49.50, 800, 3);
insert into client values(567, 'Jo', 'Baker', 'Dunedin', 201.20, 300, 3);
insert into client values(587, 'Judy', 'Roberts', 'Dunedin', 57.75, 500, 6);
insert into client values(622, 'Dan', 'Martin', 'Dunedin', 575.50, 500, 6);
insert into client values(635, 'Peter', 'Paulls', 'Dunedin', 100.56, 500, 3);
insert into client values(640, 'Margaret', 'Jones', 'Dunedin', 114.56, 800, 3);
insert into client values(649, 'Robert', 'McKenzie', 'Palmerston', 200, 500, 11);
insert into client values(675, 'Greg', 'Johnson', 'Christchurch', 15, 300, 6);
insert into client values(680, 'Peter', 'Yu', 'Dunedin', 10, 500, 6);

insert into CustOrder values(1003,'1999-05-18',124);
insert into CustOrder values(1004, '1999-05-18',256);
insert into CustOrder values(1005, '1999-06-06',124);
insert into CustOrder values(1006, '1999-06-12', 522);
insert into CustOrder values(1007, '1999-06-13',587);

insert into Part values(1, 'Iron', 200, 3, 17.95);
insert into Part values(2, 'Stove', 12, 2, 402.99);
insert into Part values(3, 'Washer', 15, 1, 311.95);
insert into Part values(4, 'Bike', 35, 3, 187.50);
insert into Part values(5, 'Mixer', 180, 3, 57.95);
insert into Part values(6, 'Skates', 302, 2, 24.95);

insert into OrderLine values(1003, 2, 5, 399.00);
insert into OrderLine values(1003, 3, 4, 320.00);
insert into OrderLine values(1004, 2, 2, 402.99);
insert into OrderLine values(1005, 6, 3, 24.95);
insert into OrderLine values(1005, 4, 5, 187.50);
insert into OrderLine values(1005, 1, 20, 17.50);
insert into OrderLine values(1006, 2, 1, 402.99);
insert into OrderLine values(1007, 6, 35, 24.95);
insert into OrderLine values(1007, 4, 1, 199.00);


