use clientorders 
go

-----------------------1
DROP PROC IF EXISTS Question1;
GO
CREATE PROCEDURE Question1
AS
SELECT [firstname], [lastname], [city]
	from client
		WHERE CITY = 'Dunedin'
go

-----------------------2

DROP PROC IF EXISTS Question2;
GO
CREATE PROCEDURE Question2
AS
SELECT [firstname],[lastname]
	from client
		where lastname like 'J%'
Go

----------------------------3
DROP PROC IF EXISTS Question3;
GO
CREATE PROCEDURE Question3
AS
SELECT [firstname],[lastname],[balance]
	from client 
		where [balance] > 50
		and [balance] < 150
go
----------------------------------4
DROP PROC IF EXISTS Question4;
GO
CREATE PROCEDURE Question4
AS
Select [firstname],[lastname],[city]
	from client
	where firstname = 'mary'
	and lastname = 'Nelson'
go
---------------------------------5

DROP PROC IF EXISTS Question5;
GO
CREATE PROCEDURE Question5
AS
select  [firstname], [lastname], [city],[balance]
from client 
where balance < 200 
and [city] = 'Dunedin'
go
-------------------------------6

DROP PROC IF EXISTS Question6;
GO
CREATE PROCEDURE Question6
AS
select firstname, lastname, [creditlimit], balance,
	(creditlimit - balance) AS NewBalance 
	From client 
go
----------------------------7
DROP PROC IF EXISTS Question7;
GO
CREATE PROCEDURE Question7
AS
select [orderref], [partref], [quantity], [quotedPrice],
	(quantity * quotedPrice) AS LineTotal 
	from orderline;
go
-------------------------8

DROP PROC IF EXISTS Question8;
GO
CREATE PROCEDURE Question8
AS
SELECT  [orderref], [orderdate]
	from custorder
	where orderdate > '1999-05-01'
go
------------------------9

DROP PROC IF EXISTS Question9;
GO
CREATE PROCEDURE Question9
AS
SELECT CITY, count(custref) AS NumberInEachCity 
from client 
group by city 
having count(custref) > 3;
go

DROP PROC IF EXISTS Question10;
GO
CREATE PROCEDURE Question10
AS
GO

-------------------------11


DROP PROC IF EXISTS Question11;
GO
CREATE PROCEDURE Question11
AS
SELECT City, MAX(balance) AS MaximumBalance
	from client 
		group by city;
GO
---------------------------12


DROP PROC IF EXISTS Question12;
GO
CREATE PROCEDURE Question12
AS
--SELECT CO.orderref, C.firstname, CO.orderdate
--	from client C
--	INNER JOIN customer CO on C.custorder 
--	group by [firstname] ,[RepFirstname]
go
---------------------------13


DROP PROC IF EXISTS Question13;
GO
CREATE PROCEDURE Question13
AS
SELECT OL.orderref, P.description, OL.quotedprice, OL.quantity 
	from orderline OL
	INNER JOIN part P on P.partref = OL.partref
	WHERE OL.quotedprice > 200
go 


DROP PROC IF EXISTS Question14;
GO
CREATE PROCEDURE Question14
AS
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
GO


--------------------------17


DROP PROC IF EXISTS Question17;
GO
CREATE PROCEDURE Question17
AS
SELECT CO.orderref, CO.orderdate, C.firstname, C.Lastname, R.repfirstname,
	R.ReplastName, P.Description
	FROM CLIENT C
	INNER JOIN custorder CO on C.custref = CO.custref
	INNER JOIN orderline OL on CO.orderref = OL.orderref
	INNER JOIN rep R on R.repref = C.repref
	INNER JOIN part P on P.partref = OL.partref
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
GO


----------------------------20

DROP PROC IF EXISTS Question20;
GO
CREATE PROCEDURE Question20
AS
SELECT R.RepFirstname, R.RepLastName,
	sum(C.balance * R.commission / 100) AS Totalsalesrepbalance
	from rep R 
	INNER JOIN client C on C.repref = R.repref
		group by Replastname, repfirstname;
GO
--------------------------21

DROP PROC IF EXISTS Question21;
GO
CREATE PROCEDURE Question21
AS
GO

DROP PROC IF EXISTS Question22;
GO
CREATE PROCEDURE Question22
AS
GO