DROP PROC IF EXISTS Question2;
GO
CREATE PROCEDURE Question2
AS
select firstname,lastname,city
from client
where city like '%Dunedin%';
GO

DROP PROC IF EXISTS Question3;
GO
CREATE PROCEDURE Question3
AS
select firstname,lastname
from client
where lastname like 'J%';
GO

DROP PROC IF EXISTS Question4;
GO
CREATE PROCEDURE Question4
AS
--select firstname,lastname,balancefrom client
--from client
--where balance >50 and balance <150;
GO

DROP PROC IF EXISTS Question5;
GO
CREATE PROCEDURE Question5
AS
--select firstname,lastname,city
--from client
--where firstname like '%Mary%' and lastname liek '%Nelson%';
GO

DROP PROC IF EXISTS Question6;
GO
CREATE PROCEDURE Question6
AS
select firstname, lastname, city
from client
where city like '%Dundedin%' and balance < 200;
GO

DROP PROC IF EXISTS Question7;
GO
CREATE PROCEDURE Question7
AS
select custref, creditlimit,balance, (creditlimit-balance) as NewBalance
from client;
GO

DROP PROC IF EXISTS Question8;
GO
CREATE PROCEDURE Question8
AS
select orderref, partref, quantity,quotedPrice,(quantity * quotedPrice) as LineTotal
from orderline;
GO

DROP PROC IF EXISTS Question9;
GO
CREATE PROCEDURE Question9
AS
select orderref, orderdate
from custorder
where orderdate > '1999/06/01';
GO

DROP PROC IF EXISTS Question10;
GO
CREATE PROCEDURE Question10
AS
select city, count(custref) as NumOfClientInCity
from client
where custref > 3
group by city;
GO

DROP PROC IF EXISTS Question11;
GO
CREATE PROCEDURE Question11
AS
select repref, sum(balance) as TotalBalance
from client
group by repref;
GO

DROP PROC IF EXISTS Question12;
GO
CREATE PROCEDURE Question12
AS
select city, sum(balance) as MaxBalance
from client
group by city;
GO

DROP PROC IF EXISTS Question13;
GO
CREATE PROCEDURE Question13
AS
select concat(firstname, ' ',lastname) as ClientName, Concat( RepFirstname, ' ',RepLastname) as RepName
from client
inner join rep on client.repref = rep.repref;
GO

DROP PROC IF EXISTS Question14;
GO
CREATE PROCEDURE Question14
AS
select orderref, firstname, lastname, orderdate
from client
inner join custorder on client.custref =custorder.custref;
GO

DROP PROC IF EXISTS Question15;
GO
CREATE PROCEDURE Question15
AS
select orderref, description,onhand
from part
inner join orderline on part.partref = orderline.partref
where orderref =1007;
GO

DROP PROC IF EXISTS Question16;
GO
CREATE PROCEDURE Question16
AS
select orderref, description,quotedPrice,quantity
from part
inner join orderline on part.partref = orderline.partref;
GO

DROP PROC IF EXISTS Question17;
GO
CREATE PROCEDURE Question17
AS
select orderref, description,quotedPrice, quantity
from part
inner join orderline on part.partref = orderline.partref
where quotedPrice > 200;
GO

DROP PROC IF EXISTS Question18;
GO
CREATE PROCEDURE Question18
AS
select custorder.orderref,orderdate,firstname,lastname,description,unitPrice
from part
inner join orderline on part.partref = orderline.partref
inner join custorder on orderline.orderref = custorder.orderref
inner join client on custorder.custref = client.custref;
GO

DROP PROC IF EXISTS Question19;
GO
CREATE PROCEDURE Question19
AS
select custorder.orderref,orderdate,firstname,lastname,description,unitPrice
from part
inner join orderline on part.partref = orderline.partref
inner join custorder on orderline.orderref = custorder.orderref
inner join client on custorder.custref = client.custref
where orderdate > '1999/6/10';
GO

DROP PROC IF EXISTS Question20;
GO
CREATE PROCEDURE Question20
AS
select custorder.orderref,orderdate,firstname,lastname,RepFirstname,RepLastname,description
from part
inner join orderline on part.partref = orderline.partref
inner join custorder on orderline.orderref = custorder.orderref
inner join client on custorder.custref = client.custref
inner join rep on client.repref = rep.repref;
GO

DROP PROC IF EXISTS Question21;
GO
CREATE PROCEDURE Question21
AS
select (RepFirstname+ ' '+RepLastName) as repname, sum(balance) as Totalbalance
from rep
inner join client on rep.repref = client.repref
group by (RepFirstname+ ' '+RepLastName);
GO

DROP PROC IF EXISTS Question22;
GO
CREATE PROCEDURE Question22
AS
select orderref, sum(quantity * quotedPrice) as LineTotal
from orderline
group by orderref;
GO



