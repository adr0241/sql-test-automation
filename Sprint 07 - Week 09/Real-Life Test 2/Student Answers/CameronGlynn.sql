/* Cameron Glynn (99228504), DTEC502 Final Practical Test*/
USE [Clientorders];

/* Q2 */
DROP PROC IF EXISTS Question2;
GO
CREATE PROCEDURE Question2
AS
SELECT [firstname],[lastname],[city] FROM [dbo].[client]
WHERE [city] = 'Dunedin';
GO

/* Q3 */
DROP PROC IF EXISTS Question3;
GO
CREATE PROCEDURE Question3
AS
SELECT [firstname],[lastname] FROM [dbo].[client]
WHERE [lastname] LIKE 'J%';
GO

/* Q4 */
DROP PROC IF EXISTS Question4;
GO
CREATE PROCEDURE Question4
AS
SELECT [firstname],[lastname],[balance] FROM [dbo].[client]
WHERE [balance] BETWEEN 50 AND 150;
GO

/* Q5 */
DROP PROC IF EXISTS Question5;
GO
CREATE PROCEDURE Question5
AS
SELECT [firstname],[lastname],[city] FROM [dbo].[client]
WHERE [firstname] = 'Mary' AND [lastname] = 'Nelson';
GO

/* Q6 */
DROP PROC IF EXISTS Question6;
GO
CREATE PROCEDURE Question6
AS
SELECT [firstname],[lastname],[balance], [city] FROM [dbo].[client]
WHERE [balance] < 200 AND [city] = 'Dunedin';
GO

/* Q9 */
DROP PROC IF EXISTS Question9;
GO
CREATE PROCEDURE Question9
AS
SELECT [orderref],[orderdate]
FROM [dbo].[custorder]
WHERE [orderdate] > '6-1-99';
GO

/* Q7 */
DROP PROC IF EXISTS Question7;
GO
CREATE PROCEDURE Question7
AS
SELECT [custref], [creditlimit], [balance], [creditlimit]-[balance]
AS NewBalance
FROM [dbo].[client];
GO

/* Q8 */
DROP PROC IF EXISTS Question8;
GO
CREATE PROCEDURE Question8
AS
SELECT [orderref], [partref], [quantity], [quotedPrice],  
[quantity]*[quotedPrice] AS LineTotal
FROM [dbo].[orderline];
GO

/* Q10 */
DROP PROC IF EXISTS Question10;
GO
CREATE PROCEDURE Question10
AS
SELECT [city], COUNT([custref]) AS 'Number in each city'
FROM [dbo].[client]
GROUP BY [city]
HAVING COUNT([custref]) > 3;
GO

/* Q11 */
DROP PROC IF EXISTS Question11;
GO
CREATE PROCEDURE Question11
AS
SELECT [dbo].[rep].[repref], SUM([dbo].[client].[balance])
AS 'Total balance'
FROM [dbo].[rep] INNER JOIN [dbo].[client]
ON ([dbo].[rep].[repref]  = [dbo].[client].[repref])
GROUP BY [dbo].[rep].[repref];
GO

/* Q12 */
DROP PROC IF EXISTS Question12;
GO
CREATE PROCEDURE Question12
AS
SELECT [city], MAX([balance]) AS 'Max balance'
FROM [dbo].[client]
GROUP BY [city];
GO

/* Q13 */
DROP PROC IF EXISTS Question13;
GO
CREATE PROCEDURE Question13
AS
SELECT CONCAT([dbo].[client].[firstname], ' ' , [dbo].[client].[lastname]) AS 'Client name', 
CONCAT([dbo].[rep].[RepFirstname], ' ' , [dbo].[rep].[RepLastName]) AS 'Rep name'
FROM [dbo].[client] INNER JOIN [dbo].[rep]
ON ([dbo].[client].repref = [dbo].[rep].repref);
GO

/* Q22 */
DROP PROC IF EXISTS Question22;
GO
CREATE PROCEDURE Question22
AS
SELECT [orderref], SUM([quantity]*[quotedPrice]) AS 'Total Linetotal'
FROM [dbo].[orderline]
GROUP BY [orderref];
GO


/* Q21 */
DROP PROC IF EXISTS Question21;
GO
CREATE PROCEDURE Question21
AS
SELECT CONCAT([dbo].[rep].[RepFirstname], ' ' , [dbo].[rep].[RepLastName]) AS 'Rep Name',
SUM([dbo].[client].[balance]) AS 'Total balance'
FROM [dbo].[rep] INNER JOIN [dbo].[client]
ON ([dbo].[rep].[repref] = [dbo].[client].[repref])
GROUP BY [dbo].[rep].[RepFirstname], [dbo].[rep].[RepLastName];
GO


/* Q17 */
DROP PROC IF EXISTS Question17;
GO
CREATE PROCEDURE Question17
AS
SELECT [dbo].[custorder].orderref, [dbo].[part].description, [dbo].[orderline].quotedPrice,
[dbo].[orderline].quantity
FROM [dbo].[custorder] INNER JOIN [dbo].[orderline]
ON ([dbo].[custorder].orderref = [dbo].[orderline].orderref) INNER JOIN [dbo].[part]
ON ([dbo].[orderline].partref = [dbo].[part].partref)
WHERE [dbo].[orderline].quotedPrice > 200;
GO


/* Q14 */
DROP PROC IF EXISTS Question14;
GO
CREATE PROCEDURE Question14
AS
SELECT [orderref], [firstname], [lastname], [orderdate]
FROM [dbo].[client] INNER JOIN [dbo].[custorder]
ON ([dbo].[custorder].custref = [dbo].[client].custref);
GO


/* Q15 */
DROP PROC IF EXISTS Question15;
GO
CREATE PROCEDURE Question15
AS
SELECT [dbo].[custorder].[orderref], [description], [onHand]
FROM [dbo].[custorder] INNER JOIN [dbo].[orderline]
ON ([dbo].[custorder].orderref = [dbo].[orderline].orderref) INNER JOIN [dbo].[part]
ON ([dbo].[orderline].partref = [dbo].[part].partref)
WHERE [dbo].[custorder].[orderref] = '1007';
GO


/* Q16 */
DROP PROC IF EXISTS Question16;
GO
CREATE PROCEDURE Question16
AS
SELECT [dbo].[orderline].orderref, [description], [quotedPrice], [quantity]
FROM [dbo].[orderline] INNER JOIN [dbo].[part]
ON ([dbo].[orderline].partref = [dbo].[part].partref)
ORDER BY [description];
GO


/* Q18 */
DROP PROC IF EXISTS Question18;
GO
CREATE PROCEDURE Question18
AS
SELECT [dbo].[custorder].[orderref], [orderdate], [firstname], [lastname], [description], [unitPrice]
FROM [dbo].[custorder] INNER JOIN [dbo].[orderline]
ON ([dbo].[custorder].orderref = [dbo].[orderline].orderref) INNER JOIN [dbo].[part]
ON ([dbo].[orderline].partref = [dbo].[part].partref) INNER JOIN [dbo].[client]
ON ([dbo].[client].custref = [dbo].[custorder].custref);
GO


/* Q19 */
DROP PROC IF EXISTS Question19;
GO
CREATE PROCEDURE Question19
AS
SELECT [dbo].[custorder].[orderref], [orderdate], [firstname], [lastname], [description], [unitPrice]
FROM [dbo].[custorder] INNER JOIN [dbo].[orderline]
ON ([dbo].[custorder].orderref = [dbo].[orderline].orderref) INNER JOIN [dbo].[part]
ON ([dbo].[orderline].partref = [dbo].[part].partref) INNER JOIN [dbo].[client]
ON ([dbo].[client].custref = [dbo].[custorder].custref)
WHERE [orderdate] > '6-10-99';
GO


/* Q20 */
DROP PROC IF EXISTS Question20;
GO
CREATE PROCEDURE Question20
AS
SELECT [dbo].[custorder].[orderref], [orderdate], [firstname], [lastname],[RepFirstname], [RepLastName], [description]
FROM [dbo].[custorder] INNER JOIN [dbo].[orderline]
ON ([dbo].[custorder].orderref = [dbo].[orderline].orderref) INNER JOIN [dbo].[part]
ON ([dbo].[orderline].partref = [dbo].[part].partref) INNER JOIN [dbo].[client]
ON ([dbo].[client].custref = [dbo].[custorder].custref) INNER JOIN [dbo].[rep]
ON ([dbo].[client].repref = [dbo].[rep].repref);
GO
