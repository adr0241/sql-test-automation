use [Clientorders]

DROP PROC IF EXISTS Question2;
GO
CREATE PROCEDURE Question2
AS
SELECT [firstname], [lastname], [city] FROM client
WHERE [city] = 'Dunedin';
GO

DROP PROC IF EXISTS Question3;
GO
CREATE PROCEDURE Question3
AS
SELECT [firstname], [lastname] FROM client
WHERE [lastname] LIKE 'J%';
GO

DROP PROC IF EXISTS Question4;
GO
CREATE PROCEDURE Question4
AS
SELECT [firstname], [lastname], [balance] FROM client
WHERE [balance] BETWEEN 50 AND 150; 
GO

DROP PROC IF EXISTS Question5;
GO
CREATE PROCEDURE Question5
AS
SELECT [firstname], [lastname], [city] FROM client
WHERE [firstname] = 'Mary' AND [lastname] = 'Nelson';
GO

DROP PROC IF EXISTS Question6;
GO
CREATE PROCEDURE Question6
AS
SELECT [firstname], [lastname], [balance], [city] FROM client
WHERE [balance] < 200 AND [city] = 'Dunedin';
GO

DROP PROC IF EXISTS Question7;
GO
CREATE PROCEDURE Question7
AS
SELECT [custref], [creditlimit], [balance], [creditlimit] - [balance] AS NewBalance FROM client;
GO

DROP PROC IF EXISTS Question8;
GO
CREATE PROCEDURE Question8
AS
SELECT orderref, partref, quantity, quotedPrice, quantity * quotedPrice AS LineTotal FROM orderline;
GO

DROP PROC IF EXISTS Question9;
GO
CREATE PROCEDURE Question9
AS
SELECT [orderref], [orderdate] FROM [dbo].[custorder]
WHERE orderdate > '1999-06-01';
GO

DROP PROC IF EXISTS Question10;
GO
CREATE PROCEDURE Question10
AS
SELECT city, COUNT(*)  AS [Number in each city] FROM [dbo].[client]
GROUP BY city
HAVING COUNT(*) > 3;
GO

DROP PROC IF EXISTS Question11;
GO
CREATE PROCEDURE Question11
AS
SELECT rep.repref, SUM(client.balance) AS [Total balance] FROM [dbo].[rep]
INNER JOIN client ON rep.[repref]=client.[repref]
GROUP BY rep.repref;
GO

DROP PROC IF EXISTS Question12;
GO
CREATE PROCEDURE Question12
AS
SELECT  [city], MAX(client.balance) AS [Maximum Balance] FROM [dbo].[client]
GROUP BY city;
GO

DROP PROC IF EXISTS Question13;
GO
CREATE PROCEDURE Question13
AS
SELECT CONCAT(client.firstname, ' ', client.lastname) AS [Client name], CONCAT(rep.RepFirstname, ' ', rep.RepLastName) AS [Rep Name] FROM [dbo].[client]
INNER JOIN [dbo].[rep] ON client.repref=rep.repref;
GO

DROP PROC IF EXISTS Question14;
GO
CREATE PROCEDURE Question14
AS
SELECT custorder.orderref, client.firstname, client.lastname, custorder.orderdate FROM client
INNER JOIN custorder ON client.custref=custorder.custref;
GO

DROP PROC IF EXISTS Question15;
GO
CREATE PROCEDURE Question15
AS
SELECT orderline.orderref, part.description, part.onHand FROM [dbo].[part]
INNER JOIN [dbo].[orderline] ON part.partref=orderline.partref
WHERE orderline.orderref = 1007;
GO

DROP PROC IF EXISTS Question16;
GO
CREATE PROCEDURE Question16
AS
SELECT orderline.orderref, part.description, orderline.quotedPrice, orderline.quantity FROM orderline
INNER JOIN part ON orderline.partref=part.partref
ORDER BY part.description;
GO

DROP PROC IF EXISTS Question17;
GO
CREATE PROCEDURE Question17
AS
SELECT orderline.orderref, part.description, orderline.quotedPrice, orderline.quantity FROM orderline
INNER JOIN part ON orderline.partref=part.partref
WHERE orderline.quotedPrice > 200;
GO

DROP PROC IF EXISTS Question18;
GO
CREATE PROCEDURE Question18
AS
SELECT orderline.orderref, custorder.orderdate, client.firstname, client.lastname, part.description, part.unitPrice FROM client
INNER JOIN custorder ON client.custref=custorder.custref
INNER JOIN orderline ON custorder.orderref=orderline.orderref
INNER JOIN part ON orderline.partref=part.partref;
GO

DROP PROC IF EXISTS Question19;
GO
CREATE PROCEDURE Question19
AS
SELECT orderline.orderref, custorder.orderdate, client.firstname, client.lastname, part.description, part.unitPrice FROM client
INNER JOIN custorder ON client.custref=custorder.custref
INNER JOIN orderline ON custorder.orderref=orderline.orderref
INNER JOIN part ON orderline.partref=part.partref
WHERE custorder.orderdate > '1999-06-10';
GO

DROP PROC IF EXISTS Question20;
GO
CREATE PROCEDURE Question20
AS
SELECT orderline.orderref, custorder.orderdate, client.firstname, client.lastname, rep.RepFirstname, rep.RepLastName, part.description FROM client
INNER JOIN rep ON client.repref=rep.repref
INNER JOIN custorder ON client.custref=custorder.custref
INNER JOIN orderline ON custorder.orderref=orderline.orderref
INNER JOIN part ON orderline.partref=part.partref;
GO

DROP PROC IF EXISTS Question21;
GO
CREATE PROCEDURE Question21
AS
SELECT CONCAT(rep.RepFirstname, ' ', rep.RepLastName) AS [Rep Name], SUM(client.balance) AS [Total balance] FROM [dbo].[rep]
INNER JOIN client ON rep.repref=client.repref
GROUP BY rep.RepFirstname, rep.RepLastName;
GO

DROP PROC IF EXISTS Question22;
GO
CREATE PROCEDURE Question22
AS
SELECT orderref, SUM(quantity * quotedPrice) AS [Total Linetotal] FROM orderline
GROUP BY orderref;
GO