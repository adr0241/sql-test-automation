-- Q2
DROP PROC IF EXISTS Question2;
GO
CREATE PROCEDURE Question2
AS
SELECT [firstname],[lastname],[city] FROM [dbo].[client]
WHERE [city] = 'Dunedin';
GO

-- Q3
DROP PROC IF EXISTS Question3;
GO
CREATE PROCEDURE Question3
AS
SELECT [firstname],[lastname] FROM [dbo].[client]
WHERE [lastname] LIKE 'J%'
GO

-- Q4
DROP PROC IF EXISTS Question4;
GO
CREATE PROCEDURE Question4
AS
SELECT [firstname],[lastname],[balance] FROM [dbo].[client]
WHERE [balance] > 50 AND [balance] < 150;
GO

-- Q5
DROP PROC IF EXISTS Question5;
GO
CREATE PROCEDURE Question5
AS
SELECT [firstname],[lastname],[city] FROM [dbo].[client]
WHERE [firstname] = 'Mary' and [lastname] = 'Nelson';
GO

-- Q6
DROP PROC IF EXISTS Question6;
GO
CREATE PROCEDURE Question6
AS
SELECT [firstname],[lastname],[balance],[city] FROM [dbo].[client]
WHERE [city] = 'Dunedin' AND [balance] < 200;
GO

-- Q7
DROP PROC IF EXISTS Question7;
GO
CREATE PROCEDURE Question7
AS
SELECT [custref],[creditlimit],[balance],SUM([creditlimit]-[balance]) 
AS 'NewBalance' FROM [dbo].[client]
GROUP BY [custref],[creditlimit],[balance];
GO

-- Q8
DROP PROC IF EXISTS Question8;
GO
CREATE PROCEDURE Question8
AS
SELECT [orderref],[partref],[quantity],[quotedPrice],
SUM([quantity]*[quotedPrice]) AS 'LineTotal' FROM [dbo].[orderline]
GROUP BY [orderref],[partref],[quantity],[quotedPrice];
GO

-- Q9
DROP PROC IF EXISTS Question9;
GO
CREATE PROCEDURE Question9
AS
SELECT [orderref],[orderdate] FROM [dbo].[custorder]
WHERE [orderdate] > '1999-06-01'
GO

-- Q10
DROP PROC IF EXISTS Question10;
GO
CREATE PROCEDURE Question10
AS
SELECT [city],COUNT(*) AS 'Number in each city' FROM [dbo].[client]
GROUP BY [city]
HAVING COUNT(*) > 3;
GO

-- Q11
DROP PROC IF EXISTS Question11;
GO
CREATE PROCEDURE Question11
AS
SELECT [repref],SUM([balance]) AS 'Total balance' FROM [dbo].[client]
GROUP BY [repref];
GO

-- Q12
DROP PROC IF EXISTS Question12;
GO
CREATE PROCEDURE Question12
AS
SELECT [city],MAX([balance]) AS 'Maximum balance' FROM [dbo].[client]
GROUP BY [city];
GO

-- Q13
DROP PROC IF EXISTS Question13;
GO
CREATE PROCEDURE Question13
AS
SELECT CONCAT([firstname],' ',[lastname]) AS 'Client Name',
CONCAT([RepFirstname],' ',[RepLastName]) AS 'Rep Name' 
FROM [dbo].[client],[dbo].[rep]
WHERE [dbo].[rep].[repref] = [dbo].[client].[repref]
GO

-- Q14
DROP PROC IF EXISTS Question14;
GO
CREATE PROCEDURE Question14
AS
SELECT [orderref],[firstname],[lastname],[orderdate] 
FROM [dbo].[client],[dbo].[custorder]
WHERE [dbo].[client].[custref] = [dbo].[custorder].[custref]
GO

-- Q15
DROP PROC IF EXISTS Question15;
GO
CREATE PROCEDURE Question15
AS
SELECT [orderref],[description],[onHand] 
FROM [dbo].[orderline],[dbo].[part]
WHERE [dbo].[part].[partref] = [dbo].[orderline].[partref]
AND [orderref] = 1007
GO

-- Q16
DROP PROC IF EXISTS Question16;
GO
CREATE PROCEDURE Question16
AS
SELECT [orderref],[description],[quotedPrice],[quantity]
FROM [dbo].[orderline],[dbo].[part]
WHERE [dbo].[part].[partref] = [dbo].[orderline].[partref]
ORDER BY [description]
GO

-- Q17
DROP PROC IF EXISTS Question17;
GO
CREATE PROCEDURE Question17
AS
SELECT [orderref],[description],[quotedPrice],[quantity]
FROM [dbo].[orderline],[dbo].[part]
WHERE [dbo].[part].[partref] = [dbo].[orderline].[partref]
AND [quotedPrice] > 200;
GO

-- Q18
DROP PROC IF EXISTS Question18;
GO
CREATE PROCEDURE Question18
AS
SELECT CO.[orderref],[orderdate],[firstname],[lastname],[description],
[unitPrice] FROM [dbo].[client],[dbo].[custorder] CO,
[dbo].[part],[dbo].[orderline]
WHERE CO.[custref] = [dbo].[client].[custref]
AND CO.[orderref] = [dbo].[orderline].[orderref]
AND [dbo].[orderline].[partref] = [dbo].[part].[partref]
GO

-- Q19
DROP PROC IF EXISTS Question19;
GO
CREATE PROCEDURE Question19
AS
SELECT CO.[orderref],[orderdate],[firstname],[lastname],[description],
[unitPrice] FROM [dbo].[client],[dbo].[custorder] CO,
[dbo].[part],[dbo].[orderline]
WHERE CO.[custref] = [dbo].[client].[custref]
AND CO.[orderref] = [dbo].[orderline].[orderref]
AND [dbo].[orderline].[partref] = [dbo].[part].[partref]
AND [orderdate] > '1999-06-10'
GO

-- Q20
DROP PROC IF EXISTS Question20;
GO
CREATE PROCEDURE Question20
AS
SELECT CO.[orderref],[orderdate],[firstname],[lastname],
[RepFirstname],[RepLastName],[description]
FROM [dbo].[client],[dbo].[custorder] CO,[dbo].[part],
[dbo].[orderline],[dbo].[rep]
WHERE CO.[custref] = [dbo].[client].[custref]
AND CO.[orderref] = [dbo].[orderline].[orderref]
AND [dbo].[orderline].[partref] = [dbo].[part].[partref]
AND [dbo].[client].[repref] = [dbo].[rep].[repref]
GO

-- Q21
DROP PROC IF EXISTS Question21;
GO
CREATE PROCEDURE Question21
AS
SELECT CONCAT([RepFirstname],' ',[RepLastName]) AS 'Rep Name',
SUM([balance]) AS 'Total Balance' FROM [dbo].[rep] R,[dbo].[client]
WHERE [dbo].[client].[repref] = R.[repref]
GROUP BY R.[repref],[RepFirstname],[RepLastName]
ORDER BY SUM([balance])
GO

-- Q22
DROP PROC IF EXISTS Question22;
GO
CREATE PROCEDURE Question22
AS
SELECT [orderref],SUM([quantity]*[quotedPrice]) AS 'Total Linetotal' 
FROM [dbo].[orderline]
GROUP BY [orderref]
GO


/*
SELECT * FROM [dbo].[rep]
SELECT * FROM [dbo].[part]
SELECT * FROM [dbo].[orderline]
SELECT * FROM [dbo].[custorder]
SELECT * FROM [dbo].[client]*/