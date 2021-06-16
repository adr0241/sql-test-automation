--Q2
DROP PROC IF EXISTS Question2;
GO
CREATE PROCEDURE Question2
AS
SELECT [dbo].[client].[firstname], [dbo].[client].[lastname], [dbo].[client].[city] FROM [dbo].[client]
WHERE [dbo].[client].[city] = 'Dunedin'
GO

--Q3
DROP PROC IF EXISTS Question3;
GO
CREATE PROCEDURE Question3
AS
SELECT [dbo].[client].[firstname], [dbo].[client].[lastname] FROM [dbo].[client]
WHERE [dbo].[client].[lastname] LIKE 'J%'
GO

--Q4
DROP PROC IF EXISTS Question4;
GO
CREATE PROCEDURE Question4
AS
SELECT [dbo].[client].[firstname], [dbo].[client].[lastname], [dbo].[client].[balance] FROM [dbo].[client]
WHERE [dbo].[client].[balance] > '50' AND [dbo].[client].[balance] < '150'
GO

--Q5
DROP PROC IF EXISTS Question5;
GO
CREATE PROCEDURE Question5
AS
SELECT [dbo].[client].[firstname], [dbo].[client].[lastname], [dbo].[client].[city] FROM [dbo].[client]
WHERE [dbo].[client].[firstname] = 'Mary' AND [dbo].[client].[lastname] = 'Nelson'
GO

--Q6
DROP PROC IF EXISTS Question6;
GO
CREATE PROCEDURE Question6
AS
SELECT [dbo].[client].[firstname], [dbo].[client].[lastname], [dbo].[client].[balance], [dbo].[client].[city] FROM [dbo].[client]
WHERE [dbo].[client].[city] = 'Dunedin' AND [dbo].[client].[balance] < '200'
GO

--Q7
DROP PROC IF EXISTS Question7;
GO
CREATE PROCEDURE Question7
AS
SELECT [dbo].[client].[custref], [dbo].[client].[creditlimit], [dbo].[client].[balance], SUM([dbo].[client].[creditlimit] - [dbo].[client].[balance]) AS NewBalance
FROM [dbo].[client]
GROUP BY [dbo].[client].[custref], [dbo].[client].[creditlimit], [dbo].[client].[balance]
GO

--Q8
DROP PROC IF EXISTS Question8;
GO
CREATE PROCEDURE Question8
AS
SELECT [dbo].[orderline].[orderref], [dbo].[orderline].[partref], [dbo].[orderline].[quantity], [dbo].[orderline].[quotedPrice], SUM([dbo].[orderline].[quantity] * [dbo].[orderline].[quotedPrice]) AS LineTotal FROM [dbo].[orderline]
GROUP BY [dbo].[orderline].[orderref], [dbo].[orderline].[partref], [dbo].[orderline].[quantity], [dbo].[orderline].[quotedPrice]
GO

--Q9
DROP PROC IF EXISTS Question9;
GO
CREATE PROCEDURE Question9
AS
SELECT [dbo].[custorder].[orderref], [dbo].[custorder].[orderdate] FROM [dbo].[custorder]
WHERE [dbo].[custorder].[orderdate] > '1999-06-01'
GO

--Q10
DROP PROC IF EXISTS Question10;
GO
CREATE PROCEDURE Question10
AS
SELECT [dbo].[client].[city], COUNT([dbo].[client].[city]) AS 'Number in each city' FROM [dbo].[client]
GROUP BY [dbo].[client].[city]
HAVING COUNT([dbo].[client].[city]) > '3'
GO

--Q11
DROP PROC IF EXISTS Question11;
GO
CREATE PROCEDURE Question11
AS
SELECT [dbo].[rep].[repref], SUM([dbo].[client].[balance]) AS 'Total Balance' FROM [dbo].[rep]
JOIN [dbo].[client] ON [dbo].[rep].[repref] = [dbo].[client].[repref]
GROUP BY [dbo].[rep].[repref]
GO

--Q12
DROP PROC IF EXISTS Question12;
GO
CREATE PROCEDURE Question12
AS
SELECT [dbo].[client].[city], MAX([dbo].[client].[balance]) AS 'Maximum Balance'  FROM [dbo].[client]
GROUP BY [dbo].[client].[city]
GO

--Q13
DROP PROC IF EXISTS Question13;
GO
CREATE PROCEDURE Question13
AS
SELECT CONCAT([dbo].[client].[firstname], ' ', [dbo].[client].[lastname]) AS 'Client Name', CONCAT([dbo].[rep].[RepFirstname], ' ', [dbo].[rep].[RepLastName]) AS 'Rep Name'
FROM [dbo].[rep] JOIN [dbo].[client] ON [dbo].[rep].[repref] = [dbo].[client].[repref]
GO

--Q14
DROP PROC IF EXISTS Question14;
GO
CREATE PROCEDURE Question14
AS
SELECT [dbo].[custorder].[orderref], [dbo].[client].[firstname], [dbo].[client].[lastname], [dbo].[custorder].[orderdate]
FROM [dbo].[client] JOIN [dbo].[custorder] ON [dbo].[client].[custref] = [dbo].[custorder].[custref]
GO

--Q15
DROP PROC IF EXISTS Question15;
GO
CREATE PROCEDURE Question15
AS
SELECT [dbo].[orderline].[orderref], [dbo].[part].[description], [dbo].[part].[onHand] FROM [dbo].[orderline]
JOIN [dbo].[part] ON [dbo].[orderline].[partref] = [dbo].[part].[partref]
WHERE [dbo].[orderline].[orderref] = '1007'
GO

--Q16
DROP PROC IF EXISTS Question16;
GO
CREATE PROCEDURE Question16
AS
SELECT [dbo].[orderline].[orderref], [dbo].[part].[description], [dbo].[orderline].[quotedPrice], [dbo].[orderline].[quantity] FROM [dbo].[orderline]
JOIN [dbo].[part] ON [dbo].[orderline].[partref] = [dbo].[part].[partref]
ORDER BY [dbo].[part].[description]
GO

--Q17
DROP PROC IF EXISTS Question17;
GO
CREATE PROCEDURE Question17
AS
SELECT [dbo].[orderline].[orderref], [dbo].[part].[description], [dbo].[orderline].[quotedPrice], [dbo].[orderline].[quantity] FROM [dbo].[orderline]
JOIN [dbo].[part] ON [dbo].[orderline].[partref] = [dbo].[part].[partref]
WHERE [dbo].[orderline].[quotedPrice] > '200'
GO

--Q18
DROP PROC IF EXISTS Question18;
GO
CREATE PROCEDURE Question18
AS
SELECT [dbo].[custorder].[orderref], [dbo].[custorder].[orderdate], [dbo].[client].[firstname], [dbo].[client].[lastname], [dbo].[part].[description], [dbo].[part].[unitPrice]
FROM [dbo].[part] JOIN [dbo].[orderline] ON [dbo].[part].[partref] = [dbo].[orderline].[partref]
JOIN [dbo].[custorder] ON [dbo].[orderline].[orderref] = [dbo].[custorder].[orderref]
JOIN [dbo].[client] ON [dbo].[custorder].[custref] = [dbo].[client].[custref]
GO

--Q19
DROP PROC IF EXISTS Question19;
GO
CREATE PROCEDURE Question19
AS
SELECT [dbo].[custorder].[orderref], [dbo].[custorder].[orderdate], [dbo].[client].[firstname], [dbo].[client].[lastname], [dbo].[part].[description], [dbo].[part].[unitPrice]
FROM [dbo].[part] JOIN [dbo].[orderline] ON [dbo].[part].[partref] = [dbo].[orderline].[partref]
JOIN [dbo].[custorder] ON [dbo].[orderline].[orderref] = [dbo].[custorder].[orderref]
JOIN [dbo].[client] ON [dbo].[custorder].[custref] = [dbo].[client].[custref]
WHERE [dbo].[custorder].[orderdate] > '1999-06-10'
GO

--Q20
DROP PROC IF EXISTS Question20;
GO
CREATE PROCEDURE Question20
AS
SELECT [dbo].[custorder].[orderref], [dbo].[custorder].[orderdate], [dbo].[client].[firstname], [dbo].[client].[lastname], [dbo].[rep].[RepFirstname], [dbo].[rep].[RepLastName], [dbo].[part].[description]
FROM [dbo].[part] JOIN [dbo].[orderline] ON [dbo].[part].[partref] = [dbo].[orderline].[partref]
JOIN [dbo].[custorder] ON [dbo].[orderline].[orderref] = [dbo].[custorder].[orderref]
JOIN [dbo].[client] ON [dbo].[custorder].[custref] = [dbo].[client].[custref]
JOIN [dbo].[rep] ON [dbo].[client].[repref] = [dbo].[rep].[repref]
GO

--Q21
DROP PROC IF EXISTS Question21;
GO
CREATE PROCEDURE Question21
AS
SELECT CONCAT([dbo].[rep].[RepFirstname], ' ', [dbo].[rep].[RepLastName]) AS 'Rep Name', SUM([dbo].[client].[balance]) AS 'Total Balance' FROM [dbo].[rep]
JOIN [dbo].[client] ON [dbo].[rep].[repref] = [dbo].[client].[repref]
GROUP BY [dbo].[rep].[RepFirstname], [dbo].[rep].[RepLastName]
ORDER BY 'Total Balance'
GO

--Q22
DROP PROC IF EXISTS Question22;
GO
CREATE PROCEDURE Question22
AS
SELECT [dbo].[orderline].[orderref], SUM([dbo].[orderline].[quantity] * [dbo].[orderline].[quotedPrice]) AS 'Total LineTotal' FROM [dbo].[orderline]
GROUP BY [dbo].[orderline].[orderref]
GO