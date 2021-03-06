--Client Orders

--Question 2
DROP PROC IF EXISTS Question2;
GO
CREATE PROCEDURE Question2
AS
SELECT [firstname], [lastname], [city]
FROM [dbo].[client]
WHERE [city] = 'Dunedin';
GO

--Question 3
DROP PROC IF EXISTS Question3;
GO
CREATE PROCEDURE Question3
AS
SELECT [firstname], [lastname]
FROM [dbo].[client]
WHERE [lastname] LIKE 'J%';
GO

--Question 4
DROP PROC IF EXISTS Question4;
GO
CREATE PROCEDURE Question4
AS
SELECT [firstname], [lastname], [balance]
FROM [dbo].[client]
WHERE [balance] BETWEEN 50 AND 150;
GO

--Question 5
DROP PROC IF EXISTS Question5;
GO
CREATE PROCEDURE Question5
AS
SELECT [firstname], [lastname], [city]
FROM [dbo].[client]
WHERE [firstname] = 'Mary'
AND [lastname] = 'Nelson';
GO

--Question 6
DROP PROC IF EXISTS Question6;
GO
CREATE PROCEDURE Question6
AS
SELECT [firstname], [lastname], [balance], [city]
FROM [dbo].[client]
WHERE [balance] < 200
AND [city] = 'Dunedin';
GO

--Question 7
DROP PROC IF EXISTS Question7;
GO
CREATE PROCEDURE Question7
AS
SELECT [custref], [creditlimit], [balance], [creditlimit]-[balance] as 'NewBalance'
FROM [dbo].[client];
GO

--Question 8
DROP PROC IF EXISTS Question8;
GO
CREATE PROCEDURE Question8
AS
SELECT [orderref], [partref], [quantity], [quotedPrice], [quantity]*[quotedPrice] as 'LineTotal'
FROM [dbo].[orderline];
GO


--Question 9
DROP PROC IF EXISTS Question9;
GO
CREATE PROCEDURE Question9
AS
SELECT [orderref], [orderdate]
FROM [dbo].[custorder]
WHERE [orderdate] > '1999-6-1';
GO


--Question 10
DROP PROC IF EXISTS Question10;
GO
CREATE PROCEDURE Question10
AS
SELECT [city], COUNT(*) as 'Number in each city'
FROM [dbo].[client]
GROUP BY [city]
HAVING COUNT(*) > 3;
GO


--Question 11
DROP PROC IF EXISTS Question11;
GO
CREATE PROCEDURE Question11
AS
SELECT [dbo].[rep].[repref], SUM([balance]) as 'Total balance'
FROM[dbo].[rep]
INNER JOIN [dbo].[client] ON [dbo].[rep].[repref] = [dbo].[client].[repref]
GROUP BY [dbo].[rep].[repref];
GO


--Question 12
DROP PROC IF EXISTS Question12;
GO
CREATE PROCEDURE Question12
AS
SELECT [city], MAX([balance]) as 'Maximum balance'
FROM [dbo].[client]
GROUP BY [city];
GO


--Question 13
DROP PROC IF EXISTS Question13;
GO
CREATE PROCEDURE Question13
AS
SELECT CONCAT([firstname], ' ', [lastname]) as 'Client name', CONCAT([RepFirstname], ' ', [RepLastName]) as 'Rep Name'
FROM[dbo].[rep]
INNER JOIN [dbo].[client] ON [dbo].[rep].[repref] = [dbo].[client].[repref];
GO


--Question 14
DROP PROC IF EXISTS Question14;
GO
CREATE PROCEDURE Question14
AS
SELECT [orderref], [firstname], [lastname], [orderdate]
FROM [dbo].[client]
INNER JOIN [dbo].[custorder] ON [dbo].[client].[custref] = [dbo].[custorder].[custref];
GO


--Question 15
DROP PROC IF EXISTS Question15;
GO
CREATE PROCEDURE Question15
AS
SELECT [orderref], [description], [onHand]
FROM [dbo].[orderline]
INNER JOIN [dbo].[part] ON [dbo].[orderline].[partref] = [dbo].[part].[partref]
WHERE [orderref] = 1007;
GO


--Question 16
DROP PROC IF EXISTS Question16;
GO
CREATE PROCEDURE Question16
AS
SELECT [orderref], [description], [quotedPrice], [quantity]
FROM [dbo].[orderline]
INNER JOIN [dbo].[part] ON [dbo].[orderline].[partref] = [dbo].[part].[partref]
ORDER BY [description];
GO


--Question 17
DROP PROC IF EXISTS Question17;
GO
CREATE PROCEDURE Question17
AS
SELECT [orderref], [description], [quotedPrice], [quantity]
FROM [dbo].[orderline]
INNER JOIN [dbo].[part] ON [dbo].[orderline].[partref] = [dbo].[part].[partref]
WHERE [quotedPrice] > 200;
GO


--Question 18
DROP PROC IF EXISTS Question18;
GO
CREATE PROCEDURE Question18
AS
SELECT [dbo].[custorder].[orderref], [orderdate], [firstname], [lastname], [description], [unitPrice]
FROM [dbo].[client]
INNER JOIN [dbo].[custorder] ON [dbo].[client].[custref] = [dbo].[custorder].[custref]
INNER JOIN [dbo].[orderline] ON [dbo].[custorder].[orderref] = [dbo].[orderline].[orderref]
INNER JOIN [dbo].[part] ON [dbo].[orderline].[partref] = [dbo].[part].[partref];
GO


--Question 19
DROP PROC IF EXISTS Question19;
GO
CREATE PROCEDURE Question19
AS
SELECT [dbo].[custorder].[orderref], [orderdate], [firstname], [lastname], [description], [unitPrice]
FROM [dbo].[client]
INNER JOIN [dbo].[custorder] ON [dbo].[client].[custref] = [dbo].[custorder].[custref]
INNER JOIN [dbo].[orderline] ON [dbo].[custorder].[orderref] = [dbo].[orderline].[orderref]
INNER JOIN [dbo].[part] ON [dbo].[orderline].[partref] = [dbo].[part].[partref]
WHERE [orderdate] > '1999-6-10';
GO


--Question 20
DROP PROC IF EXISTS Question20;
GO
CREATE PROCEDURE Question20
AS
SELECT [dbo].[custorder].[orderref], [orderdate], [firstname], [lastname], [RepFirstname], [RepLastName], [description]
FROM [dbo].[client]
INNER JOIN [dbo].[custorder] ON [dbo].[client].[custref] = [dbo].[custorder].[custref]
INNER JOIN [dbo].[orderline] ON [dbo].[custorder].[orderref] = [dbo].[orderline].[orderref]
INNER JOIN [dbo].[part] ON [dbo].[orderline].[partref] = [dbo].[part].[partref]
INNER JOIN [dbo].[rep] ON [dbo].[client].[repref] = [dbo].[rep].[repref];
GO


--Question 21
DROP PROC IF EXISTS Question21;
GO
CREATE PROCEDURE Question21
AS
SELECT CONCAT([RepFirstname], ' ', [RepLastName]) as 'Rep Name', SUM([balance]) as 'Total Balance'
FROM [dbo].[client]
INNER JOIN [dbo].[rep] ON [dbo].[client].[repref] = [dbo].[rep].[repref]
GROUP BY CONCAT([RepFirstname], ' ', [RepLastName])
ORDER BY SUM([balance]);
GO


--Question 22
DROP PROC IF EXISTS Question22;
GO
CREATE PROCEDURE Question22
AS
SELECT [orderref], SUM([quantity]*[quotedPrice]) as 'Total Linetotal'
FROM [dbo].[orderline]
GROUP BY [orderref];
GO

