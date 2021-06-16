USE [Clientorders];

DROP PROC IF EXISTS Question2;
GO
CREATE PROCEDURE Question2
AS
SELECT [firstname],[lastname],[city]
FROM [dbo].[client]
WHERE [city] like 'Dun%';
GO

DROP PROC IF EXISTS Question3;
GO
CREATE PROCEDURE Question3
AS
SELECT [firstname],[lastname]
FROM  [dbo].[client]
WHERE [lastname] like 'J%';
GO

DROP PROC IF EXISTS Question4;
GO
CREATE PROCEDURE Question4
AS
SELECT [firstname],[lastname],[balance]
FROM  [dbo].[client]
WHERE [balance] >= 50
AND
[balance] <= 150;
GO

DROP PROC IF EXISTS Question5;
GO
CREATE PROCEDURE Question5
AS
SELECT [firstname],[lastname],[city]
FROM  [dbo].[client]
WHERE [firstname] like 'Mary'
AND
[lastname] like 'Nelson';
GO

DROP PROC IF EXISTS Question6;
GO
CREATE PROCEDURE Question6
AS
SELECT [firstname],[lastname],[balance],[city]
FROM  [dbo].[client]
WHERE [balance] < 200
AND
[city] like 'Dune%'
GO

DROP PROC IF EXISTS Question7;
GO
CREATE PROCEDURE Question7
AS
SELECT [custref],[creditlimit],[balance],[creditlimit]-[balance] as NewBalance
FROM [dbo].[client];
GO

DROP PROC IF EXISTS Question8;
GO
CREATE PROCEDURE Question8
AS
SELECT [orderref],[partref],[quantity],[quotedPrice],[quantity]*[quotedPrice] as LineTotal
FROM [dbo].[orderline];
GO

DROP PROC IF EXISTS Question9;
GO
CREATE PROCEDURE Question9
AS
SELECT [orderref],[orderdate]
FROM [dbo].[custorder]
WHERE [orderdate] > '6/1/99';
GO

DROP PROC IF EXISTS Question10;
GO
CREATE PROCEDURE Question10
AS
SELECT City,COUNT(firstName) as 'Number in each city'
FROM [dbo].[client]
GROUP BY City
HAVING COUNT(firstName) > 3
GO

DROP PROC IF EXISTS Question11;
GO

DROP PROC IF EXISTS Question12;
GO

DROP PROC IF EXISTS Question13;
GO

DROP PROC IF EXISTS Question14;
GO

DROP PROC IF EXISTS Question15;
GO
CREATE PROCEDURE Question15
AS
SELECT [orderref],[description],[onHand]
FROM [dbo].[orderline],[dbo].[part]
WHERE [orderref] = 1007
GO

DROP PROC IF EXISTS Question16;
GO
CREATE PROCEDURE Question16
AS
SELECT [orderref],[description],[quotedPrice],[quantity]
FROM [dbo].[orderline],[dbo].[part]
ORDER BY [description]
GO

DROP PROC IF EXISTS Question17;
GO
CREATE PROCEDURE Question17
AS
--SELECT [description],[quotedPrice],COUNT([quantity])
--FROM [dbo].[orderline],[dbo].[part]
--GROUP BY [quantity]
--HAVING COUNT([quantity]) > 200;
GO

DROP PROC IF EXISTS Question18;
GO
CREATE PROCEDURE Question18
AS
--SELECT [description],[quotedPrice],COUNT([quantity])
--FROM [dbo].[orderline],[dbo].[part]
--GROUP BY [quantity]
--HAVING COUNT([quantity]) > 200;
GO

DROP PROC IF EXISTS Question19;
GO
CREATE PROCEDURE Question19
AS
SELECT [orderref],[orderdate],[firstname],[lastname],[description],[unitPrice]
FROM [dbo].[custorder],[dbo].[client],[dbo].[part]
WHERE [orderdate] > '6/10/99';
GO

DROP PROC IF EXISTS Question20;
GO
CREATE PROCEDURE Question20
AS
SELECT [orderref],[orderdate],[firstname],[lastname],[RepFirstname],[RepLastName],[description]
FROM [dbo].[custorder],[dbo].[client],[dbo].[part],[dbo].[rep]
GO

DROP PROC IF EXISTS Question21;
GO

DROP PROC IF EXISTS Question22;
GO
CREATE PROCEDURE Question22
AS
GO
