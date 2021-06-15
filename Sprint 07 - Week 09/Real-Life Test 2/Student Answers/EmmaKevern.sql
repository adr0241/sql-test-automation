USE [Clientorders];
-- 2
DROP PROC IF EXISTS Question2;
GO
CREATE PROCEDURE Question2
AS
SELECT [firstname], [lastname], [city]
FROM [client]
WHERE [city] = 'Dunedin';
GO

--3
DROP PROC IF EXISTS Question3;
GO
CREATE PROCEDURE Question3
AS
SELECT [firstname], [lastname]
FROM [client]
WHERE [lastname] LIKE 'J%';
GO

--4
DROP PROC IF EXISTS Question4;
GO
CREATE PROCEDURE Question4
AS
SELECT [firstname], [lastname], [balance]
FROM [client]
WHERE [balance] BETWEEN 50 AND 150;
GO

--5
DROP PROC IF EXISTS Question5;
GO
CREATE PROCEDURE Question5
AS
SELECT [firstname], [lastname], [city]
FROM [client]
WHERE ([firstname] = 'Mary') AND ([lastname] = 'Nelson');
GO

--6
DROP PROC IF EXISTS Question6;
GO
CREATE PROCEDURE Question6
AS
SELECT [firstname], [lastname],[balance], [city]
FROM [client]
WHERE ([balance] <= 200 ) AND ([city] = 'Dunedin');
GO

--7
DROP PROC IF EXISTS Question7;
GO
CREATE PROCEDURE Question7
AS
SELECT [custref], [creditlimit], [balance], SUM([creditlimit] - [balance]) AS 'NewBalance'
FROM [dbo].[client]
GROUP BY [custref], [creditlimit], [balance];
GO

--8
DROP PROC IF EXISTS Question8;
GO
CREATE PROCEDURE Question8
AS
SELECT [orderref], [partref], [quantity], [quotedPrice], SUM([quantity] * [quotedPrice]) AS 'LineTotal'
FROM [orderline]
GROUP BY [orderref], [partref], [quantity], [quotedPrice];
GO

--9
DROP PROC IF EXISTS Question9;
GO
CREATE PROCEDURE Question9
AS
SELECT [orderref], [orderdate]
FROM [custorder]
WHERE [orderdate] > '1999-06-01';
GO

--10
DROP PROC IF EXISTS Question10;
GO
CREATE PROCEDURE Question10
AS
SELECT [city], COUNT([city]) AS 'Number in each city'
FROM [client]
GROUP BY [city]
HAVING COUNT([city]) > 3;
GO

--11
DROP PROC IF EXISTS Question11;
GO
CREATE PROCEDURE Question11
AS
SELECT [repref], SUM([balance]) AS 'Total balance'
FROM [dbo].[client]
GROUP BY [repref];
GO

--12
DROP PROC IF EXISTS Question12;
GO
CREATE PROCEDURE Question12
AS
SELECT [city], MAX([balance]) AS 'Maximum balance'
FROM [client]
GROUP BY [city];
GO

--13
DROP PROC IF EXISTS Question13;
GO
CREATE PROCEDURE Question13
AS
SELECT [client].[firstname] + ' ' + [client].[lastname] AS 'Client name', [rep].[RepFirstname] + ' ' + [rep].[RepLastName] AS 'Rep Name'
FROM [client]
INNER JOIN [rep] ON [client].[repref] = [rep].[repref];
GO

--14
DROP PROC IF EXISTS Question14;
GO
CREATE PROCEDURE Question14
AS
SELECT [custorder].[orderref], [client].[firstname], [client].[lastname], [orderdate]
FROM [custorder]
INNER JOIN [client] ON [custorder].[custref] = [client].[custref];
GO

--15
DROP PROC IF EXISTS Question15;
GO
CREATE PROCEDURE Question15
AS
SELECT [orderref], [description], [onHand]
FROM [orderline]
INNER JOIN [part] ON [orderline].[partref] = [part].[partref]
WHERE [orderref] = '1007';
GO

--16
DROP PROC IF EXISTS Question16;
GO
CREATE PROCEDURE Question16
AS
SELECT [orderref], [description],[quotedPrice], [quantity]
FROM [orderline]
INNER JOIN [part] ON [orderline].[partref] = [part].[partref]
ORDER BY [description];
GO


--17
DROP PROC IF EXISTS Question17;
GO
CREATE PROCEDURE Question17
AS
SELECT [orderref], [description], [quotedPrice], [quantity]
FROM [orderline]
INNER JOIN [part] ON [orderline].[partref] = [part].[partref]
WHERE [quotedPrice] > 200;
GO


--18
DROP PROC IF EXISTS Question18;
GO
CREATE PROCEDURE Question18
AS
--SELECT [custorder].[orderref], .[orderdate], [firstname], [lastname], [description], [unitPrice]
--FROM [custorder]
--INNER JOIN [client] ON [custorder].[custref] = [client].[custref] AND [custorder].[orderref] = [orderline].[orderref]
--ORDER BY [description];
GO



--19
DROP PROC IF EXISTS Question19;
GO
CREATE PROCEDURE Question19
AS
GO

--20
DROP PROC IF EXISTS Question20;
GO
CREATE PROCEDURE Question20
AS
GO

--21
DROP PROC IF EXISTS Question21;
GO
CREATE PROCEDURE Question21
AS
SELECT [RepFirstname] + ' ' + [RepLastName] AS 'Rep Name', SUM([balance]) AS 'Total Balance'
FROM [client]
INNER JOIN [rep] ON [client].[repref] = [rep].[repref]
GROUP BY [RepFirstname],[RepLastName];
GO

--22
DROP PROC IF EXISTS Question22;
GO
CREATE PROCEDURE Question22
AS
SELECT ([orderref]), SUM([quantity] * [quotedPrice]) + [orderref] AS 'Total LineTotal'
FROM [orderline]
GROUP BY [orderref];
GO

