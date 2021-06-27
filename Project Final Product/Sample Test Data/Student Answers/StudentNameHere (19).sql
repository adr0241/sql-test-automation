DROP PROC IF EXISTS Question2;
GO
CREATE PROCEDURE Question2
AS
select firstname, lastname, city
from client
where [city] = 'Dunedin'
GO

DROP PROC IF EXISTS Question3;
GO
CREATE PROCEDURE Question3
AS
select firstname, lastname
from client
where lastname like 'J%'
GO

DROP PROC IF EXISTS Question4;
GO
CREATE PROCEDURE Question4
AS
select firstname, lastname, balance
from client
where balance between 50 and 150
GO

DROP PROC IF EXISTS Question5;
GO
CREATE PROCEDURE Question5
AS
GO

DROP PROC IF EXISTS Question6;
GO
CREATE PROCEDURE Question6
AS
GO

DROP PROC IF EXISTS Question7;
GO
CREATE PROCEDURE Question7
AS
select custref, creditlimit, balance, sum(creditlimit - balance) as NewBalance
from client
group by custref, creditlimit, balance
GO

--select * from orderline

DROP PROC IF EXISTS Question8;
GO
CREATE PROCEDURE Question8
AS
select orderref, partref, quantity, quotedprice, sum([quotedPrice] * [quantity]) as LineTotal
from orderline
group by orderref, partref, quantity, quotedprice
GO

--select * from custorder

DROP PROC IF EXISTS Question9;
GO
CREATE PROCEDURE Question9
AS
select orderref, orderdate
from [dbo].[custorder]
where orderdate > '1999-06-01'
GO

DROP PROC IF EXISTS Question10;
GO
CREATE PROCEDURE Question10
AS
select city, count(city) as 'Number in each city'
from client
group by city
having count(city) > 3
GO

--select * from orderline

DROP PROC IF EXISTS Question11;
GO
CREATE PROCEDURE Question11
AS
GO

DROP PROC IF EXISTS Question12;
GO
CREATE PROCEDURE Question12
AS
select city, max(balance) as 'Maximum balance'
from client
group by city
GO

DROP PROC IF EXISTS Question13;
GO
CREATE PROCEDURE Question13
AS
select concat([firstname], ' ' , [lastname]) as 'Client name', concat([RepFirstname], ' '  , [RepLastName]) as 'Rep Name'
from client
inner join [dbo].[rep] on [dbo].[rep].[repref] = [dbo].[client].[repref]
GO

DROP PROC IF EXISTS Question14;
GO
CREATE PROCEDURE Question14
AS
select [orderref],[firstname],[lastname],[orderdate]
from [dbo].[custorder]
inner join [dbo].[client] on [dbo].[client].[custref] = [dbo].[custorder].[custref]
GO

DROP PROC IF EXISTS Question15;
GO
CREATE PROCEDURE Question15
AS
GO

DROP PROC IF EXISTS Question16;
GO
CREATE PROCEDURE Question16
AS
select [orderref],[description],[quotedPrice],[quantity]
from [dbo].[orderline]
inner join [dbo].[part] on [dbo].[part].[partref] = [dbo].[orderline].[partref]
order by description
GO

DROP PROC IF EXISTS Question17;
GO
CREATE PROCEDURE Question17
AS
select [orderref],[description],[quotedPrice],[quantity]
from [dbo].[orderline]
inner join [dbo].[part] on [dbo].[part].[partref] = [dbo].[orderline].[partref]
where [quotedPrice] > 200
GO

DROP PROC IF EXISTS Question18;
GO
CREATE PROCEDURE Question18
AS
GO

DROP PROC IF EXISTS Question19;
GO
CREATE PROCEDURE Question19
AS
select [dbo].[orderline].[orderref],[orderdate], [firstname],[lastname],[description],[unitPrice]
from [dbo].[orderline]
inner join [dbo].[part] on [dbo].[part].[partref] = [dbo].[orderline].[partref]
inner join [dbo].[custorder] on [dbo].[custorder].[orderref] = [dbo].[orderline].[orderref]
inner join [dbo].[client] on [dbo].[client].[custref] = [dbo].[custorder].[custref]
where [orderdate] > '1999-6-10'
GO

DROP PROC IF EXISTS Question20;
GO
CREATE PROCEDURE Question20
AS
select [dbo].[orderline].[orderref],[orderdate], [firstname],[lastname],[RepFirstname],[RepLastName],[description]
from [dbo].[orderline]
inner join [dbo].[part] on [dbo].[part].[partref] = [dbo].[orderline].[partref]
inner join [dbo].[custorder] on [dbo].[custorder].[orderref] = [dbo].[orderline].[orderref]
inner join [dbo].[client] on [dbo].[client].[custref] = [dbo].[custorder].[custref]
inner join [dbo].[rep] on [dbo].[rep].[repref] = [dbo].[client].[repref]
GO

DROP PROC IF EXISTS Question21;
GO
CREATE PROCEDURE Question21
AS
select concat(RepFirstname, ' '  , RepLastName) as 'Rep Name', sum([balance]) as 'Total Balance'
from client
inner join [dbo].[rep] on [dbo].[rep].[repref] = [dbo].[client].[repref]
group by [RepFirstname], [RepLastName]
GO

DROP PROC IF EXISTS Question22;
GO
CREATE PROCEDURE Question22
AS
select orderref, sum([quotedPrice] * [quantity]) as LineTotal
from orderline
group by orderref
GO

