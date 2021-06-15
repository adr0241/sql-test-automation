-- question 2
DROP PROC IF EXISTS Question2;
GO
CREATE PROCEDURE Question2
AS
SELECT [firstname],[lastname],[city]
FROM [dbo].[client]
WHERE [city] LIKE 'Dunedin';
GO


-- question 3
DROP PROC IF EXISTS Question3;
GO
CREATE PROCEDURE Question3
AS
SELECT [firstname],[lastname]
FROM [dbo].[client]
WHERE [lastname] LIKE 'j%';
GO


--SELECT * FROM [dbo].[client]

-- question 4
DROP PROC IF EXISTS Question4;
GO
CREATE PROCEDURE Question4
AS
SELECT [firstname],[lastname],[balance]
FROM [dbo].[client]
WHERE [balance] between '50' AND '150';
GO

-- question 5
DROP PROC IF EXISTS Question5;
GO
CREATE PROCEDURE Question5
AS
SELECT [firstname],[lastname],[city]
FROM [dbo].[client]
WHERE [firstname] = 'Mary' AND [lastname] = 'Nelson';
GO

-- question 6
DROP PROC IF EXISTS Question6;
GO
CREATE PROCEDURE Question6
AS
SELECT [firstname],[lastname],[balance],[city]
FROM [dbo].[client]
WHERE [balance] < '200' AND [city] ='Dunedin';
GO

-- question 7
DROP PROC IF EXISTS Question7;
GO
CREATE PROCEDURE Question7
AS
SELECT custref, creditlimit, balance , creditlimit-balance as 'NewBalance' 
FROM client;
GO

-- question 8
DROP PROC IF EXISTS Question8;
GO
CREATE PROCEDURE Question8
AS
SELECT orderref, partref, quantity, quotedprice, quantity * quotedprice as 'LineTotal'
FROM orderline;
GO

-- question 9
DROP PROC IF EXISTS Question9;
GO
CREATE PROCEDURE Question9
AS
SELECT [orderref],[orderdate]
FROM[dbo].[custorder]
WHERE [orderdate] > '1999-06-01';
GO

-- SELECT * FROM [city]

-- question 10
DROP PROC IF EXISTS Question10;
GO
CREATE PROCEDURE Question10
AS
SELECT [city], count(city) AS 'Number in each city'
FROM [dbo].[client]
GROUP BY [city]
HAVING COUNT (city) > 3;
GO

-- question 11
DROP PROC IF EXISTS Question11;
GO
CREATE PROCEDURE Question11
AS
SELECT [repref], sum([balance]) as 'Total balance'
FROM [dbo].[client]
GROUP BY [repref];
GO

-- question 12
DROP PROC IF EXISTS Question12;
GO
CREATE PROCEDURE Question12
AS
SELECT [city],MAX([balance]) as 'Maximum balance'
FROM [dbo].[client]
GROUP BY [city];
GO

-- question 13
DROP PROC IF EXISTS Question13;
GO
CREATE PROCEDURE Question13
AS
SELECT CONCAT([firstname],' ',[lastname]) as 'Client Name', CONCAT([RepFirstname],' ',[RepLastName]) as 'Rep Name'
FROM [dbo].[rep] 
INNER JOIN [dbo].[client]
ON rep.repref = client.repref;
GO

-- question 14
DROP PROC IF EXISTS Question14;
GO
CREATE PROCEDURE Question14
AS
SELECT [orderref],[firstname],[lastname],[orderdate]
FROM [dbo].[client] 
INNER JOIN [dbo].[custorder]
ON client.custref = custorder.custref;
GO

-- question 15
DROP PROC IF EXISTS Question15;
GO
CREATE PROCEDURE Question15
AS
SELECT [orderref],[description],[onHand]
FROM [dbo].[orderline]
INNER JOIN [dbo].[part]
ON orderline.partref = part.partref
WHERE orderref = '1007';
GO

-- question 16
DROP PROC IF EXISTS Question16;
GO
CREATE PROCEDURE Question16
AS
SELECT [orderref],[description],[quotedPrice],[quantity]
FROM [dbo].[orderline]
INNER JOIN [dbo].[part]
ON orderline.partref = part.partref
ORDER BY description;
GO

-- question 17
DROP PROC IF EXISTS Question17;
GO
CREATE PROCEDURE Question17
AS
SELECT [orderref],[description],[quotedPrice],[quantity]
FROM [dbo].[orderline]
INNER JOIN [dbo].[part]
ON orderline.partref = part.partref
WHERE quotedPrice > '200';
GO

-- question 18
DROP PROC IF EXISTS Question18;
GO
CREATE PROCEDURE Question18
AS
SELECT [dbo].[orderline].[orderref], [orderdate], [firstname],[lastname] ,[description] ,[unitPrice]
FROM PART INNER JOIN orderline ON part.partref = orderline.partref
INNER JOIN custorder ON orderline.orderref = custorder.orderref
INNER JOIN client ON client.custref = custorder.custref;
GO

-- question 19
DROP PROC IF EXISTS Question19;
GO
CREATE PROCEDURE Question19
AS
SELECT [dbo].[orderline].[orderref], [orderdate], [firstname],[lastname] ,[description] ,[unitPrice]
FROM PART INNER JOIN orderline ON part.partref = orderline.partref
INNER JOIN custorder ON orderline.orderref = custorder.orderref
INNER JOIN client ON client.custref = custorder.custref
WHERE orderdate > '1999-06-10';
GO

-- question 20
DROP PROC IF EXISTS Question20;
GO
CREATE PROCEDURE Question20
AS
SELECT [dbo].[orderline].[orderref], [orderdate], [firstname],[lastname],[RepFirstname],[RepLastName],[description]
FROM PART INNER JOIN orderline ON part.partref = orderline.partref
INNER JOIN custorder ON orderline.orderref = custorder.orderref
INNER JOIN client ON client.custref = custorder.custref
INNER JOIN [dbo].[rep] ON rep.repref = client.repref;
GO

-- question 21
DROP PROC IF EXISTS Question21;
GO
CREATE PROCEDURE Question21
AS
SELECT CONCAT([RepFirstname],' ',[RepLastName]) as 'Rep Name', SUM(balance) as 'Total Balance'
FROM [dbo].[client]
INNER JOIN [dbo].[rep]
ON client.repref = rep.repref
GROUP BY RepFirstname, RepLastName;
GO

-- question 22
DROP PROC IF EXISTS Question22;
GO
CREATE PROCEDURE Question22
AS
SELECT [orderref], SUM([quantity] * [quotedPrice]) as 'Total Linetotal'
FROM [dbo].[orderline]
GROUP BY [orderref];
GO
















 














