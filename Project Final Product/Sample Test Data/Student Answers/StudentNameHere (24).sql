--Q2
DROP PROC IF EXISTS Question2;
GO
CREATE PROCEDURE Question2
AS
SELECT [firstname],[lastname],[city] FROM [dbo].[client]
WHERE [city] = 'Dunedin'
GO

--Q3
DROP PROC IF EXISTS Question3;
GO
CREATE PROCEDURE Question3
AS
SELECT [firstname],[lastname] FROM [dbo].[client]
WHERE [lastname] LIKE 'J%'
GO

--Q4
DROP PROC IF EXISTS Question4;
GO
CREATE PROCEDURE Question4
AS
SELECT [firstname],[lastname],[balance] FROM [dbo].[client]
WHERE [balance] > 50 AND [balance] < 150
GO

--Q5
DROP PROC IF EXISTS Question5;
GO
CREATE PROCEDURE Question5
AS
SELECT [firstname],[lastname],[city] FROM [dbo].[client]
WHERE [firstname] = 'Mary' AND [lastname] = 'Nelson'
GO

--Q6
DROP PROC IF EXISTS Question6;
GO
CREATE PROCEDURE Question6
AS
SELECT [firstname],[lastname],[balance],[city] FROM [dbo].[client]
WHERE [balance] < 200
AND [city] = 'Dunedin'
GO

--Q7
DROP PROC IF EXISTS Question7;
GO
CREATE PROCEDURE Question7
AS
SELECT [custref],[creditlimit],[balance],([creditlimit] - [balance]) AS 'NewBalance' FROM [dbo].[client]
GO

--Q8
DROP PROC IF EXISTS Question8;
GO
CREATE PROCEDURE Question8
AS
SELECT [orderref],[partref],[quantity],[quotedPrice],([quantity] * [quotedPrice]) AS 'LineTotal' FROM [dbo].[orderline]
GO

--Q9
DROP PROC IF EXISTS Question9;
GO
CREATE PROCEDURE Question9
AS
SELECT [orderref],[orderdate] FROM [dbo].[custorder]
WHERE [orderdate] > '1999-06-01'
GO

--Q10
DROP PROC IF EXISTS Question10;
GO
CREATE PROCEDURE Question10
AS
SELECT [city],COUNT([custref]) AS 'Number in each city' FROM [dbo].[client]
GROUP BY [city]
HAVING COUNT([custref]) > 3
GO

--Q11
DROP PROC IF EXISTS Question11;
GO
CREATE PROCEDURE Question11
AS
SELECT rep.repref,SUM(client.balance) AS 'Total balance' FROM [dbo].[rep]
INNER JOIN [dbo].[client] ON rep.repref = client.repref
GROUP by rep.repref
GO

--Q12
DROP PROC IF EXISTS Question12;
GO
CREATE PROCEDURE Question12
AS
SELECT [city],MAX([balance]) AS 'Maximum balance' FROM [dbo].[client]
GROUP BY [city]
GO

--Q13
DROP PROC IF EXISTS Question13;
GO
CREATE PROCEDURE Question13
AS
SELECT ([firstname] + ' ' + [lastname]) AS 'Client Name', ([RepFirstname] + ' ' + [RepLastName]) AS 'Rep Name' FROM [dbo].[client]
INNER JOIN [dbo].[rep] ON client.repref = rep.repref
GO

--Q14
DROP PROC IF EXISTS Question14;
GO
CREATE PROCEDURE Question14
AS
SELECT [orderref],[firstname],[lastname],[orderdate] FROM [dbo].[custorder]
INNER JOIN [dbo].[client] ON custorder.custref = client.custref
GO

--Q15
DROP PROC IF EXISTS Question15;
GO
CREATE PROCEDURE Question15
AS
SELECT [orderref],[description],[onHand] FROM [dbo].[orderline]
INNER JOIN [dbo].[part] ON orderline.partref = part.partref
WHERE [orderref] = 1007
GO

--Q16
DROP PROC IF EXISTS Question16;
GO
CREATE PROCEDURE Question16
AS
SELECT [orderref],[description],[quotedPrice],[quantity] FROM [dbo].[orderline]
INNER JOIN [dbo].[part] on orderline.partref = part.partref
ORDER BY [description]
GO

--Q17
DROP PROC IF EXISTS Question17;
GO
CREATE PROCEDURE Question17
AS
SELECT [orderref],[description],[quotedPrice],[quantity] FROM [dbo].[orderline]
INNER JOIN [dbo].[part] on orderline.partref = part.partref
WHERE [quotedPrice] > 200
GO

--Q18
DROP PROC IF EXISTS Question18;
GO
CREATE PROCEDURE Question18
AS
SELECT orderline.orderref,[orderdate],[firstname],[lastname],[description],[unitPrice] FROM [dbo].[orderline]
INNER JOIN [dbo].[part] on orderline.partref = part.partref
INNER JOIN [dbo].[custorder] ON orderline.orderref = custorder.orderref
INNER JOIN [dbo].[client] ON custorder.custref = client.custref
GO

--Q19
DROP PROC IF EXISTS Question19;
GO
CREATE PROCEDURE Question19
AS
SELECT orderline.orderref,[orderdate],[firstname],[lastname],[description],[unitPrice] FROM [dbo].[orderline]
INNER JOIN [dbo].[part] on orderline.partref = part.partref
INNER JOIN [dbo].[custorder] ON orderline.orderref = custorder.orderref
INNER JOIN [dbo].[client] ON custorder.custref = client.custref
WHERE [orderdate] > '1999-06-10'
GO

--Q20
DROP PROC IF EXISTS Question20;
GO
CREATE PROCEDURE Question20
AS
SELECT custorder.orderref,[orderdate],[firstname],[lastname],[RepFirstname],[RepLastName],[description] FROM [dbo].[custorder]
INNER JOIN [dbo].[client] ON custorder.custref = client.custref
INNER JOIN [dbo].[rep] ON client.repref = rep.repref
INNER JOIN [dbo].[orderline] ON custorder.orderref = orderline.orderref
INNER JOIN [dbo].[part] ON part.partref = orderline.partref
GO

--Q21
DROP PROC IF EXISTS Question21;
GO
CREATE PROCEDURE Question21
AS
SELECT ([RepFirstname] + ' ' + [RepLastName]) AS 'Rep Name',SUM(client.balance) AS 'Total Balance' FROM [dbo].[rep]
INNER JOIN [dbo].[client] ON rep.repref = client.repref
GROUP BY ([RepFirstname] + ' ' + [RepLastName])
ORDER BY SUM(client.balance)
GO

--Q22
DROP PROC IF EXISTS Question22;
GO
CREATE PROCEDURE Question22
AS
SELECT [orderref],SUM([quantity] * [quotedPrice]) AS 'TOTAL LineTotal' FROM [dbo].[orderline]
GROUP BY [orderref]
GO