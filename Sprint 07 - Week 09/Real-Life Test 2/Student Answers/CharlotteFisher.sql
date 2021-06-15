-- Charlotte Fisher Final Scripting Exam
-- 11/06/2021

-- Question Two
DROP PROC IF EXISTS Question2;
GO
CREATE PROCEDURE Question2
AS
SELECT [firstname], [lastname], [city]
FROM [dbo].[client]
WHERE [city] = 'Dunedin';
GO
-- RESULT: 7 Rows

-- Question Three
DROP PROC IF EXISTS Question3;
GO
CREATE PROCEDURE Question3
AS
SELECT [firstname], [lastname]
FROM [dbo].[client]
WHERE [lastname] LIKE 'J%';
GO
-- RESULT: 2 Rows

-- Question Four
DROP PROC IF EXISTS Question4;
GO
CREATE PROCEDURE Question4
AS
SELECT [firstname], [lastname], [balance]
FROM [dbo].[client]
WHERE [balance] BETWEEN 50 AND 150;
GO
-- RESULT: 3 Rows

-- Question Five
DROP PROC IF EXISTS Question5;
GO
CREATE PROCEDURE Question5
AS
SELECT [firstname], [lastname], [city]
FROM [dbo].[client]
WHERE [firstname] = 'Mary' AND [lastname] = 'Nelson';
GO
-- RESULT: 1 Row

-- Question Six
DROP PROC IF EXISTS Question6;
GO
CREATE PROCEDURE Question6
AS
SELECT [firstname], [lastname], [city], [balance]
FROM [dbo].[client]
WHERE [city] = 'Dunedin'
AND [balance] < 200;
GO
-- RESULT: 4 Rows

-- Quesiton Seven
DROP PROC IF EXISTS Question7;
GO
CREATE PROCEDURE Question7
AS
SELECT [custref], [creditlimit], [balance], ([creditlimit] - [balance]) AS 'NewBalance'
FROM [dbo].[client];
GO
-- Result: 15 Rows

-- Quesiton Eight
DROP PROC IF EXISTS Question8;
GO
CREATE PROCEDURE Question8
AS
SELECT *, ([quantity] * [quotedPrice]) AS 'LineTotal'
FROM [dbo].[orderline];
GO
-- RESULT: 9 Rows

-- Question Nine
DROP PROC IF EXISTS Question9;
GO
CREATE PROCEDURE Question9
AS
SELECT [orderref], [orderdate]
FROM [dbo].[custorder]
WHERE [orderdate] > '1999-06-1';
GO
-- RESULT: 3 Rows 

-- Question 10
DROP PROC IF EXISTS Question10;
GO
CREATE PROCEDURE Question10
AS
SELECT [city], COUNT(*) AS 'NumberOfClients'
FROM [dbo].[client]
GROUP BY [city]
HAVING COUNT(*) > 3;
GO
-- RESULT: 2 Rows

-- Question 11
DROP PROC IF EXISTS Question11;
GO
CREATE PROCEDURE Question11
AS
SELECT [dbo].[rep].[repref], SUM([balance]) AS 'TotalBalance'
FROM [dbo].[rep] INNER JOIN [dbo].[client]
ON [dbo].[rep].repref = [dbo].[client].repref
GROUP BY [dbo].[rep].[repref];
GO
-- RESULT: 3 Rows

-- Question 12
DROP PROC IF EXISTS Question12;
GO
CREATE PROCEDURE Question12
AS
SELECT [city], MAX([balance]) AS 'MaximumBalance'
FROM [dbo].[client]
GROUP BY [city];
GO
-- RESULT: 3 Rows

-- Question 13
DROP PROC IF EXISTS Question13;
GO
CREATE PROCEDURE Question13
AS
SELECT CONCAT([firstname], ' ',[lastname]) AS 'ClientName', CONCAT([RepFirstname], ' ',[RepLastName]) AS 'RepName'
FROM [dbo].[client] INNER JOIN [dbo].[rep]
ON [dbo].[client].repref = [dbo].[rep].repref;
GO
-- RESULT: 15 Rows;

-- Question 14
DROP PROC IF EXISTS Question14;
GO
CREATE PROCEDURE Question14
AS
SELECT [orderref], [firstname], [lastname], [orderdate]
FROM [dbo].[client] INNER JOIN [dbo].[custorder]
ON [dbo].[client].custref = [dbo].[custorder].custref;
GO
-- RESULT: 5 Rows

-- Question 15
DROP PROC IF EXISTS Question15;
GO
CREATE PROCEDURE Question15
AS
SELECT [orderref], [description], [onHand]
FROM [dbo].[orderline] INNER JOIN [dbo].[part]
ON [dbo].[orderline].partref = [dbo].[part].partref
WHERE [orderref] = 1007;
GO

-- RESULT: 2 Rows

-- Question 16
DROP PROC IF EXISTS Question16;
GO
CREATE PROCEDURE Question16
AS
SELECT [orderref], [description], [quotedPrice], [quantity]
FROM [dbo].[orderline] INNER JOIN [dbo].[part]
ON [dbo].[orderline].partref = [dbo].[part].partref
ORDER BY [description];
GO

-- RESULT: 9 Rows

-- Question 17
DROP PROC IF EXISTS Question17;
GO
CREATE PROCEDURE Question17
AS
SELECT [orderref], [description], [quotedPrice], [quantity]
FROM [dbo].[orderline] INNER JOIN [dbo].[part]
ON [dbo].[orderline].partref = [dbo].[part].partref
WHERE [quotedPrice] > 200;
GO

-- RESULT: 4 Rows

-- Question 18
DROP PROC IF EXISTS Question18;
GO
CREATE PROCEDURE Question18
AS
SELECT [dbo].[custorder].[orderref], [orderdate], [firstname], [lastname], [description], [unitPrice]
FROM [dbo].[client], [dbo].[custorder], [dbo].[part], [dbo].[orderline]
WHERE [dbo].[client].custref = [dbo].[custorder].custref
AND [dbo].[custorder].orderref = [dbo].[orderline].orderref
AND [dbo].[orderline].partref = [dbo].[part].partref;
GO

-- RESULT: 9 Rows

-- Question 19
DROP PROC IF EXISTS Question19;
GO
CREATE PROCEDURE Question19
AS
SELECT [dbo].[custorder].[orderref], [orderdate], [firstname], [lastname], [description], [unitPrice]
FROM [dbo].[client], [dbo].[custorder], [dbo].[part], [dbo].[orderline]
WHERE [dbo].[client].custref = [dbo].[custorder].custref
AND [dbo].[custorder].orderref = [dbo].[orderline].orderref
AND [dbo].[orderline].partref = [dbo].[part].partref
AND [orderdate] > '1999-06-10';
GO

-- RESULTS: 3 Rows

-- Question 20
DROP PROC IF EXISTS Question20;
GO
CREATE PROCEDURE Question20
AS
SELECT [dbo].[custorder].[orderref], [firstname], [lastname], [RepFirstname], [RepLastName], [description]
FROM [dbo].[client], [dbo].[custorder], [dbo].[part], [dbo].[orderline], [dbo].[rep]
WHERE [dbo].[client].custref = [dbo].[custorder].custref 
AND [dbo].[client].repref = [dbo].[rep].repref
AND [dbo].[custorder].orderref = [dbo].[orderline].orderref
AND [dbo].[orderline].partref = [dbo].[part].partref;
GO

-- RESULT: 9 Rows

-- Question 21
DROP PROC IF EXISTS Question21;
GO
CREATE PROCEDURE Question21
AS
SELECT CONCAT([RepFirstname],' ',[RepLastName]) AS 'RepName', SUM([balance]) AS 'TotalBalance'
FROM [dbo].[rep] INNER JOIN [dbo].[client]
ON [dbo].[rep].repref = [dbo].[client].repref
GROUP BY [RepFirstname], [RepLastName];
GO

-- RESULT: 3 Rows

-- Question 22
DROP PROC IF EXISTS Question22;
GO
CREATE PROCEDURE Question22
AS
SELECT [orderref], SUM([quantity] * [quotedPrice]) AS 'LineTotal'
FROM [dbo].[orderline]
GROUP BY [orderref];
GO

-- RESULT: 5 Rows