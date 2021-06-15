DROP PROC IF EXISTS Question2;
GO
CREATE PROCEDURE Question2
AS
select lastname, firstname, city
 from client
where city = 'Dunedin';
GO

DROP PROC IF EXISTS Question3;
GO
CREATE PROCEDURE Question3
AS
select firstname, lastname
from client
where lastname like 'j%';
GO

DROP PROC IF EXISTS Question4;
GO
CREATE PROCEDURE Question4
AS
select firstname, lastname, balance
from client
where balance between 50 and 150;
GO

DROP PROC IF EXISTS Question5;
GO
CREATE PROCEDURE Question5
AS
select firstname, lastname, city
from client 
where firstname ='Mary' and lastname = 'Nelson';
GO

DROP PROC IF EXISTS Question6;
GO
CREATE PROCEDURE Question6
AS
select firstname, lastname, balance, city
from client 
where balance < 200 and city = 'dunedin';
GO

DROP PROC IF EXISTS Question7;
GO
CREATE PROCEDURE Question7
AS
select custref,creditlimit, balance, sum (creditlimit - balance) as newbalance
from client
group by  custref,creditlimit, balance;
GO

DROP PROC IF EXISTS Question8;
GO
CREATE PROCEDURE Question8
AS
select custorder.orderref, partref, quantity, quotedprice,sum (quantity * quotedPrice) as linetotal
from custorder
join orderline on orderline.orderref= custorder.orderref
group by custorder.orderref, partref, quantity, quotedprice;
GO

DROP PROC IF EXISTS Question9;
GO
CREATE PROCEDURE Question9
AS
select orderref, orderdate
from custorder
where orderdate > '1999-06-01';
GO

DROP PROC IF EXISTS Question10;
GO
CREATE PROCEDURE Question10
AS
select city, count(*) as numberInEachCity
from client
group by city
having count(city) > 3;
GO

DROP PROC IF EXISTS Question11;
GO
CREATE PROCEDURE Question11
AS
select rep.repref, sum([balance])as totalBalance
from client
join rep on client.repref = rep.repref
group by rep.repref;
GO

DROP PROC IF EXISTS Question12;
GO
CREATE PROCEDURE Question12
AS
select city,max(balance) as MaximumBalance
from client
group by city;
GO

DROP PROC IF EXISTS Question13;
GO
CREATE PROCEDURE Question13
AS
select (firstname + ' ' + lastname)as clientName, (repFirstname + ' ' + repLastName)as RepName
from client
left join rep on rep.[repref] = client.[repref];
GO

DROP PROC IF EXISTS Question14;
GO
CREATE PROCEDURE Question14
AS
select orderref, firstname, lastname, orderdate
from custorder
left join client on client.[custref]= custorder.[custref];
GO

DROP PROC IF EXISTS Question15;
GO
CREATE PROCEDURE Question15
AS
select orderref, [description],[onHand]
from [dbo].[orderline]
left join [dbo].[part] on part.[partref] = orderline.[partref]
where orderref = 1007;
GO

DROP PROC IF EXISTS Question16;
GO
CREATE PROCEDURE Question16
AS
select orderref, [description],quotedprice[quotedPrice], quantity
from [dbo].[orderline]
left join [dbo].[part] on part.[partref] = orderline.[partref]
order by description, orderref;
GO

DROP PROC IF EXISTS Question17;
GO
CREATE PROCEDURE Question17
AS
select orderref, [description],quotedprice[quotedPrice], quantity
from [dbo].[orderline]
left join [dbo].[part] on part.[partref] = orderline.[partref]
where quotedPrice > 200
order by quantity desc;
GO

DROP PROC IF EXISTS Question18;
GO
CREATE PROCEDURE Question18
AS
Select orderref, orderdate, firstname, lastname, description,unitprice
from custorder
left join client on [dbo].[custorder].[custref]= client.custref
right join part on part.partref = [partref];
GO

DROP PROC IF EXISTS Question19;
GO
CREATE PROCEDURE Question19
AS
Select orderref, orderdate, firstname, lastname, description,unitprice
from client 
join custorder on client.custref = custorder.custref
join part on part.partref = [partref];
GO

DROP PROC IF EXISTS Question20;
GO
CREATE PROCEDURE Question20
AS
Select custorder.orderref, orderdate, firstname, lastname, description
from [dbo].[custorder]
left join client on client.custref = custorder.custref
right join part on part.partref = [partref]
join orderline on orderline.orderref = custorder.orderref;
GO

DROP PROC IF EXISTS Question21;
GO
CREATE PROCEDURE Question21
AS
select rep.RepFirstname + ' ' + rep.RepLastName as RepName, sum(balance)as totalBalance
from rep
join client on client.repref = rep.repref
join custorder on custorder.custref = client.custref
join orderline on orderline.[orderref] = custorder.orderref
group by RepFirstname, rep.RepLastName;
GO

DROP PROC IF EXISTS Question22;
GO
CREATE PROCEDURE Question22
AS
select custorder.orderref,sum (quantity * quotedPrice)as TotalLineTotal
from custorder
join orderline on orderline.orderref= custorder.orderref
group by custorder.orderref;
GO




