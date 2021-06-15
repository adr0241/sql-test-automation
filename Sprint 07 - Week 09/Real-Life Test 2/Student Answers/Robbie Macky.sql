

-- 2
DROP PROC IF EXISTS Question2;
GO
CREATE PROCEDURE Question2
AS
SELECT firstname, lastname, city
FROM [dbo].[client]
WHERE city = 'Dunedin'
GO

-- 3
DROP PROC IF EXISTS Question3;
GO
CREATE PROCEDURE Question3
AS
SELECT firstname, lastname
FROM [dbo].[client]
WHERE lastname LIKE 'J%'
GO

-- 4
DROP PROC IF EXISTS Question4;
GO
CREATE PROCEDURE Question4
AS
SELECT firstname, lastname, balance
FROM [dbo].[client]
WHERE balance > 50 and balance < 150
GO

-- 5
DROP PROC IF EXISTS Question5;
GO
CREATE PROCEDURE Question5
AS
SELECT firstname, lastname, city
FROM [dbo].[client]
WHERE firstname = 'Mary' and lastname = 'Nelson'
GO

-- 6
DROP PROC IF EXISTS Question6;
GO
CREATE PROCEDURE Question6
AS
SELECT firstname, lastname, balance, city
FROM [dbo].[client]
WHERE balance < 200 and city = 'Dunedin'
GO

-- 7
DROP PROC IF EXISTS Question7;
GO
CREATE PROCEDURE Question7
AS
SELECT custref, creditlimit, balance, (creditlimit-balance) AS NewBalance
FROM [dbo].[client]
GO

-- 8
DROP PROC IF EXISTS Question8;
GO
CREATE PROCEDURE Question8
AS
SELECT orderref, partref, quantity, quotedPrice, quantity*quotedPrice AS LineTotal
FROM [dbo].[orderline]
GO

-- 9
DROP PROC IF EXISTS Question9;
GO
CREATE PROCEDURE Question9
AS
SELECT *
FROM [dbo].[custorder]
WHERE orderdate > '1999-6-1'
GO

-- 10
DROP PROC IF EXISTS Question10;
GO
CREATE PROCEDURE Question10
AS
SELECT city, count([city]) AS Number_in_each_city
FROM [dbo].[client]
GROUP BY [city]
HAVING count(city) > 3
ORDER BY count(city) ASC
GO

-- 11
DROP PROC IF EXISTS Question11;
GO
CREATE PROCEDURE Question11
AS
SELECT repref, SUM(balance) AS Total_balance
FROM [dbo].[client]
GROUP BY repref
GO

-- 12
DROP PROC IF EXISTS Question12;
GO
CREATE PROCEDURE Question12
AS
--SELECT *
--FROM [dbo].[client]
--SELECT custref, creditlimit, balance, (creditlimit-balance) AS NewBalance
--FROM [dbo].[client]
SELECT city, MAX(balance) AS Maximum_balance
FROM [dbo].[client]
GROUP BY city
GO

-- 13
DROP PROC IF EXISTS Question13;
GO
CREATE PROCEDURE Question13
AS
--SELECT *
--FROM [dbo].[client]
--SELECT *
--FROM [dbo].[rep]
SELECT firstname + ' ' + lastname AS Client_name, RepFirstname + ' ' + RepLastName AS Rep_Name
FROM [dbo].[client], [dbo].[rep]
--SELECT firstname + ' ' + lastname AS Client_name, RepFirstname + ' ' + RepLastName AS Rep_Name
--FROM [dbo].[client]
--INNER JOIN [dbo].[rep] ON [firstname] = [RepFirstname];
--INNER JOIN [dbo].[rep] ON [firstname] = [RepFirstname];
GO


-- 14
DROP PROC IF EXISTS Question14;
GO
CREATE PROCEDURE Question14
AS
--SELECT *
--FROM [dbo].[client]
--SELECT *
--FROM [dbo].[custorder]
SELECT orderref, firstname, lastname, orderdate
FROM [dbo].[client], [dbo].[custorder]
--SELECT orderref, firstname, lastname, orderdate
--FROM [dbo].[client]
--INNER JOIN [dbo].[custorder]
--ON [custref] = [custref];
GO

-- 15
DROP PROC IF EXISTS Question15;
GO
CREATE PROCEDURE Question15
AS
--SELECT *
--FROM [dbo].[part]
--SELECT *
--FROM [dbo].[orderline]
SELECT orderref, description, onHand
FROM [dbo].[part], [dbo].[orderline]
WHERE orderref = '1007'
GO

-- 16
DROP PROC IF EXISTS Question16;
GO
CREATE PROCEDURE Question16
AS
--SELECT *
--FROM [dbo].[part]
--SELECT *
--FROM [dbo].[orderline]
SELECT orderref, description, quotedPrice, quantity
FROM [dbo].[part], [dbo].[orderline]
GO

-- 17
DROP PROC IF EXISTS Question17;
GO
CREATE PROCEDURE Question17
AS
SELECT orderref, description, quotedPrice, quantity
FROM [dbo].[part], [dbo].[orderline]
WHERE quotedPrice > 200
GO

-- 18
DROP PROC IF EXISTS Question18;
GO
CREATE PROCEDURE Question18
AS
SELECT orderdate, firstname, lastname, description, unitPrice
FROM [dbo].[orderline], [dbo].[client], [dbo].[custorder], [dbo].[part]
GO


-- 19
DROP PROC IF EXISTS Question19;
GO
CREATE PROCEDURE Question19
AS
SELECT orderdate, firstname, lastname, description, unitPrice
FROM [dbo].[orderline], [dbo].[client], [dbo].[custorder], [dbo].[part]
WHERE orderdate > '1999-6-10'
GO


-- 20
DROP PROC IF EXISTS Question20;
GO
CREATE PROCEDURE Question20
AS
SELECT orderdate, firstname, lastname, RepFirstname, RepLastName, description
FROM [dbo].[orderline], [dbo].[client], [dbo].[custorder], [dbo].[part], [dbo].[rep]
GO


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