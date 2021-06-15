USE Clientorders;

DROP PROC IF EXISTS Question2;
GO
CREATE PROCEDURE Question2
AS
SELECT [firstname], [lastname], [city] FROM [dbo].[client] WHERE [city] = 'Dunedin'
GO

DROP PROC IF EXISTS Question3;
GO
CREATE PROCEDURE Question3
AS
SELECT [firstname], [lastname] FROM [dbo].[client] WHERE [lastname] LIKE 'J%'
GO

DROP PROC IF EXISTS Question4;
GO
CREATE PROCEDURE Question4
AS
SELECT [firstname], [lastname], [balance] FROM [dbo].[client] WHERE [balance] > 49.99 AND [balance] < 151
GO

DROP PROC IF EXISTS Question5;
GO
CREATE PROCEDURE Question5
AS
SELECT [firstname], [lastname], [city] FROM [dbo].[client] WHERE [firstname] = 'Mary' AND [lastname] = 'Nelson'
GO

DROP PROC IF EXISTS Question6;
GO
CREATE PROCEDURE Question6
AS
SELECT [firstname], [lastname],[balance], [city] FROM [dbo].[client] WHERE [city] = 'Dunedin' AND [balance] < 200
GO

DROP PROC IF EXISTS Question7;
GO
CREATE PROCEDURE Question7
AS
SELECT [custref], [creditlimit], [balance] FROM [dbo].[client] 
GO

DROP PROC IF EXISTS Question8;
GO
CREATE PROCEDURE Question8
AS
SELECT [orderref], [partref], [quantity], [quotedPrice] FROM [dbo].[orderline]
GO

DROP PROC IF EXISTS Question9;
GO
CREATE PROCEDURE Question9
AS
SELECT [orderref], [orderdate] FROM [dbo].[custorder] WHERE [orderdate] > '1999/06/1'
GO

DROP PROC IF EXISTS Question10;
GO
CREATE PROCEDURE Question10
AS
SELECT [city], COUNT(custref) FROM [dbo].[client] GROUP BY [city] HAVING COUNT(custref) > 3
GO

DROP PROC IF EXISTS Question11;
GO
CREATE PROCEDURE Question11
AS
SELECT Rep.repref, balance FROM [dbo].[rep] RIGHT JOIN [dbo].[client] ON Client.repref = rep.repref
GO

DROP PROC IF EXISTS Question12;
GO
CREATE PROCEDURE Question12
AS
SELECT [city], SUM(balance) FROM [dbo].[client] GROUP BY [city]
GO

DROP PROC IF EXISTS Question13;
GO
CREATE PROCEDURE Question13
AS
SELECT CONCAT(firstname,' ', lastname), CONCAT([RepFirstname], ' ', [RepLastName]) FROM [dbo].[client], [dbo].[rep]
GO

DROP PROC IF EXISTS Question14;
GO
CREATE PROCEDURE Question14
AS
--SELECT [orderref], [firstname], [lastname], [orderdate] FROM [dbo].[client], [dbo].[custorder] GROUP BY [orderref]
GO

DROP PROC IF EXISTS Question15;
GO
CREATE PROCEDURE Question15
AS
SELECT [orderref], [onHand], [description] FROM [dbo].[orderline], [dbo].[part] WHERE [orderref] = '1007' 
GO

DROP PROC IF EXISTS Question16;
GO
CREATE PROCEDURE Question16
AS
SELECT [orderref], [description], [quotedPrice], [quantity] FROM [dbo].[orderline], [dbo].[part] ORDER BY [description]
GO

DROP PROC IF EXISTS Question17;
GO
CREATE PROCEDURE Question17
AS
SELECT [orderref], [description], [quotedPrice], [quantity] FROM [dbo].[orderline], [dbo].[part] WHERE [quotedPrice] > 199
GO

DROP PROC IF EXISTS Question18;
GO
CREATE PROCEDURE Question18
AS
SELECT ORDERLINE.orderref, [orderdate], [firstname], [lastname], [description], [unitPrice] FROM [dbo].[client], [dbo].[custorder], [dbo].[orderline], [dbo].[part] 
GO

DROP PROC IF EXISTS Question19;
GO
CREATE PROCEDURE Question19
AS
SELECT [orderref], [orderdate], [firstname], [lastname], [description], [unitPrice] FROM [dbo].[client], [dbo].[custorder], [dbo].[part] WHERE [orderdate] > '1999/06/10'
GO

DROP PROC IF EXISTS Question20;
GO
CREATE PROCEDURE Question20
AS
SELECT [orderref], [orderdate], [firstname], [lastname], [RepFirstname], [RepLastName], [description] FROM [dbo].[part], [dbo].[client], [dbo].[rep], [dbo].[custorder]
GO

DROP PROC IF EXISTS Question21;
GO
CREATE PROCEDURE Question21
AS
SELECT [balance], CONCAT([RepFirstname], ' ', [RepLastName]) FROM [dbo].[client], [dbo].[rep]
GO

DROP PROC IF EXISTS Question22;
GO
CREATE PROCEDURE Question22
AS
GO
