--Q1
USE Clientorders
GO

--Q2
DROP PROC IF EXISTS Question2;
GO
CREATE PROCEDURE Question2
AS
SELECT [firstname], [lastname], [city]
FROM [dbo].[client]
WHERE [city]='DUNEDIN';
GO

--Q3
DROP PROC IF EXISTS Question3;
GO
CREATE PROCEDURE Question3
AS
SELECT [firstname], [lastname]
FROM [dbo].[client]
WHERE [lastname] LIKE 'J%';
GO

--Q4
DROP PROC IF EXISTS Question4;
GO
CREATE PROCEDURE Question4
AS
SELECT [firstname], [lastname]
FROM [dbo].[client]
WHERE 50 <= [balance] AND [balance] <=150;
GO

--Q5
DROP PROC IF EXISTS Question5;
GO
CREATE PROCEDURE Question5
AS
SELECT [firstname], [lastname],[city]
FROM [dbo].[client]
WHERE [firstname]='Mary' AND [lastname]='Nelson';
GO

--Q6
DROP PROC IF EXISTS Question6;
GO
CREATE PROCEDURE Question6
AS
SELECT [firstname], [lastname], [balance], [city]
FROM [dbo].[client]
WHERE [city]='DUNEDIN' AND [balance]<200;
GO

--Q7
DROP PROC IF EXISTS Question7;
GO
CREATE PROCEDURE Question7
AS
SELECT [custref], [creditlimit], [balance], [creditlimit]-[balance] AS NewBalance
FROM [dbo].[client]
GO

--Q8
DROP PROC IF EXISTS Question8;
GO
CREATE PROCEDURE Question8
AS
SELECT [orderref], [partref], [quantity], [quotedPrice], [quantity]*[quotedPrice] AS 'LineTotal'
FROM [dbo].[orderline]
GO

--Q9
DROP PROC IF EXISTS Question9;
GO
CREATE PROCEDURE Question9
AS
SELECT [orderref], [orderdate]
FROM [dbo].[custorder]
WHERE [orderdate]>'1999-06-01';
GO

--Q10
DROP PROC IF EXISTS Question10;
GO
CREATE PROCEDURE Question10
AS
SELECT [city], COUNT([custref]) AS 'Number in each city'
FROM [dbo].[client]
GROUP BY [city]
HAVING COUNT([custref])>3;
GO

--Q11
DROP PROC IF EXISTS Question11;
GO
CREATE PROCEDURE Question11
AS
SELECT [repref], SUM([balance]) AS 'Total balance'
FROM [dbo].[client]
GROUP BY [repref];
GO

--Q12
DROP PROC IF EXISTS Question12;
GO
CREATE PROCEDURE Question12
AS
SELECT [city], MAX([balance])
FROM [dbo].[client]
GROUP BY [city];
GO

--Q13
DROP PROC IF EXISTS Question13;
GO
CREATE PROCEDURE Question13
AS
SELECT [firstname]+[lastname] AS 'Client name', [RepFirstname]+[RepLastName] AS 'Rep Name'
FROM [dbo].[client],[dbo].[rep]
WHERE CLIENT.repref=REP.repref;
GO

--Q14
DROP PROC IF EXISTS Question14;
GO
CREATE PROCEDURE Question14
AS
SELECT [orderref], [firstname], [lastname], [orderdate]
FROM [dbo].[custorder], [dbo].[client]
WHERE custorder.custref=client.custref;
GO

--Q15
DROP PROC IF EXISTS Question15;
GO
CREATE PROCEDURE Question15
AS
SELECT [orderref], [description], [onHand]
FROM [dbo].[orderline], [dbo].[part]
WHERE orderline.partref=part.partref AND orderref='1007';
GO

--Q16
DROP PROC IF EXISTS Question16;
GO
CREATE PROCEDURE Question16
AS
SELECT [orderref], [description],[quotedPrice],[quantity]
FROM [dbo].[orderline], [dbo].[part]
WHERE orderline.partref=part.partref
ORDER BY [description];
GO

--Q17
DROP PROC IF EXISTS Question17;
GO
CREATE PROCEDURE Question17
AS
SELECT [orderref], [description],[quotedPrice],[quantity]
FROM [dbo].[orderline], [dbo].[part]
WHERE orderline.partref=part.partref AND quotedPrice > 200
GO

--Q18
DROP PROC IF EXISTS Question18;
GO
CREATE PROCEDURE Question18
AS
SELECT orderline.orderref,[firstname],[lastname],[description],[unitPrice]
FROM [dbo].[custorder],[dbo].[client],[dbo].[part],[dbo].[orderline]
WHERE orderline.partref=part.partref 
	AND custorder.orderref=orderline.orderref 
	AND custorder.custref=client.custref;
GO

--Q19
DROP PROC IF EXISTS Question19;
GO
CREATE PROCEDURE Question19
AS
SELECT orderline.orderref, [orderdate], [firstname],[lastname],[unitPrice]
FROM [dbo].[custorder],[dbo].[client],[dbo].[part], [dbo].[orderline]
WHERE orderline.partref=part.partref 
	AND custorder.orderref=orderline.orderref 
	AND custorder.custref=client.custref
	AND [orderdate] > '1999-06-10';
GO

--20
DROP PROC IF EXISTS Question20;
GO
CREATE PROCEDURE Question20
AS
SELECT orderline.orderref, [orderdate], [firstname],[lastname],[RepFirstname],[RepLastName],[description]
FROM [dbo].[custorder],[dbo].[client],[dbo].[part], [dbo].[orderline],[dbo].[rep]
WHERE orderline.partref=part.partref 
	AND custorder.orderref=orderline.orderref 
	AND custorder.custref=client.custref
	AND CLIENT.repref=REP.repref;
GO

--Q21
DROP PROC IF EXISTS Question21;
GO
CREATE PROCEDURE Question21
AS
SELECT [RepFirstname]+' '+[RepLastName] AS 'Rep Name', SUM([balance]) AS 'Total Blance'
FROM [dbo].[rep],[dbo].[client]
WHERE CLIENT.repref=REP.repref
GROUP BY [RepFirstname]+' '+[RepLastName]
ORDER BY SUM([balance])
GO

--Q22
DROP PROC IF EXISTS Question22;
GO
CREATE PROCEDURE Question22
AS
SELECT [orderref], SUM([quantity]*[quotedPrice]) AS 'Total LineTotal'
FROM [dbo].[orderline]
GROUP BY [orderref]
GO