USE Clientorders;


DROP PROC IF EXISTS Question2;
GO
CREATE PROCEDURE Question2
AS
SELECT [custref], [firstname], [lastname], [city] FROM [dbo].[client]
WHERE [city] = 'Dunedin'
GO

DROP PROC IF EXISTS Question3;
GO
CREATE PROCEDURE Question3
AS
SELECT [firstname], [lastname] FROM [dbo].[client] 
WHERE [lastname] LIKE 'J%'
GO

DROP PROC IF EXISTS Question4;
GO
CREATE PROCEDURE Question4
AS
SELECT [firstname], [lastname], [balance] FROM [dbo].[client]
WHERE [balance] < 150 AND [balance] > 50
GO

DROP PROC IF EXISTS Question5;
GO
CREATE PROCEDURE Question5
AS
SELECT [firstname], [lastname], [city] FROM [dbo].[client]
WHERE [firstname] = 'Mary' AND [lastname] = 'Nelson'
GO

DROP PROC IF EXISTS Question6;
GO
CREATE PROCEDURE Question6
AS
SELECT [firstname], [Lastname], [city], [balance] FROM [dbo].[client]
WHERE [balance] < 200 AND [city] = 'Dunedin'
GO

DROP PROC IF EXISTS Question7;
GO
CREATE PROCEDURE Question7
AS
SELECT [custref], [creditlimit], [balance], ([creditlimit] - [balance]) AS NewBalance FROM [dbo].[client]
GO

DROP PROC IF EXISTS Question8;
GO
CREATE PROCEDURE Question8
AS
SELECT *, ([quantity] * [quotedPrice]) AS LineTotal FROM [dbo].[orderline]
GO

DROP PROC IF EXISTS Question9;
GO
CREATE PROCEDURE Question9
AS
SELECT [orderref], [orderdate] FROM [dbo].[custorder]
WHERE [orderdate] > '1999/06/01'
GO

DROP PROC IF EXISTS Question10;
GO
CREATE PROCEDURE Question10
AS
SELECT count([custref]) as numOfClients, [city] FROM [dbo].[client]
GROUP BY city
HAVING count([custref]) > 3
GO

DROP PROC IF EXISTS Question11;
GO
CREATE PROCEDURE Question11
AS
SELECT [repref], sum([balance]) AS totalBalance FROM [dbo].[client]
GROUP BY [repref]
GO

/* COME BACK Q12 */
DROP PROC IF EXISTS Question12;
GO
CREATE PROCEDURE Question12
AS
SELECT [city], sum([balance]) AS cityMaxBal FROM [dbo].[client]
GROUP BY [city]
GO

DROP PROC IF EXISTS Question13;
GO
CREATE PROCEDURE Question13
AS
SELECT CONCAT([firstname], ' ', [lastname]) AS clientName, CONCAT([RepFirstname], ' ', [RepLastName]) AS repName FROM [dbo].[client]
inner join [dbo].[rep] on [dbo].[rep].[repref] = [dbo].[client].[repref]
GO

DROP PROC IF EXISTS Question14;
GO
CREATE PROCEDURE Question14
AS
SELECT [firstname], [lastname], [orderref], [orderdate] FROM [dbo].[client]
inner join [dbo].[custorder] on [dbo].[custorder].[custref] = [dbo].[client].[custref]
GO

DROP PROC IF EXISTS Question15;
GO
CREATE PROCEDURE Question15
AS
SELECT [orderref], [description], [onHand] FROM [dbo].[orderline]
inner join [dbo].[part] on [dbo].[part].[partref] = [dbo].[orderline].[partref]
WHERE [orderref] = 1007
GO

DROP PROC IF EXISTS Question16;
GO
CREATE PROCEDURE Question16
AS
SELECT [orderref], [description], [quotedPrice], [quantity] FROM [dbo].[orderline]
inner join [dbo].[part] on [dbo].[part].[partref] = [dbo].[orderline].[partref]
ORDER BY [description]
GO

DROP PROC IF EXISTS Question17;
GO
CREATE PROCEDURE Question17
AS
SELECT [orderref], [description], [quotedPrice], [quantity] FROM [dbo].[orderline]
inner join [dbo].[part] on [dbo].[part].[partref] = [dbo].[orderline].[partref]
WHERE [quotedPrice] > 200
GO

DROP PROC IF EXISTS Question18;
GO
CREATE PROCEDURE Question18
AS
--SELECT [orderref], [orderdate], [firstname], [description], [unitPrice] FROM [dbo].[orderline]
--inner join [dbo].[part] on [dbo].[part].[partref] = [dbo].[orderline].[partref]
--inner join [dbo].[custorder] on [dbo].[custorder].[orderref]= [dbo].[orderline].[orderref]
--inner join [dbo].[client] on [dbo].[client].[custref] = [dbo].[custorder].[custref]
GO

/* Q20 */
DROP PROC IF EXISTS Question20;
GO
CREATE PROCEDURE Question20
AS
--SELECT [orderref], [orderdate], [firstname], [lastname], [RepFirstname], [RepLastName], [description] FROM [dbo].[custorder]
--inner join [dbo].[client] on [dbo].[client].[custref] = [dbo].[custorder].[custref]
--inner join [dbo].[rep] on [dbo].[rep].[repref] = [dbo].[client].[repref]
--inner join [dbo].[part] on [dbo].[part].[partref] = [dbo].[orderline].[partref]
GO

/* Q21 */
DROP PROC IF EXISTS Question21;
GO
CREATE PROCEDURE Question21
AS
--SELECT CONCAT([RepFirstname], ' ', [RepLastName]) AS repName, sum(balance) as totalBal FROM [dbo].[client]
--inner join [dbo].[rep] on [dbo].[rep].[repref] = [dbo].[client].[repref]
--GROUP BY balance
GO


/* Q19 */
DROP PROC IF EXISTS Question19;
GO
CREATE PROCEDURE Question19
AS
--SELECT [orderref], [orderdate], [firstname], [lastname], [description], [unitPrice] FROM [dbo].[orderline]
--inner join [dbo].[custorder] on [dbo].[custorder].[orderref] = [dbo].[orderline].[orderref]
--WHERE [orderdate] > '10/6/99'
GO
