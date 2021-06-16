USE [Clientorders];


DROP PROC IF EXISTS Question2_ModelAnswer;
GO
CREATE PROCEDURE Question2_ModelAnswer
AS
	SELECT [firstname],[lastname],[city] FROM [dbo].[client]
	WHERE [city] = 'Dunedin';
GO

DROP PROC IF EXISTS Question3_ModelAnswer;
GO
CREATE PROCEDURE Question3_ModelAnswer
AS
	SELECT [firstname],[lastname] FROM [dbo].[client]
	WHERE [lastname] LIKE 'J%';
GO


DROP PROC IF EXISTS Question4_ModelAnswer;
GO
CREATE PROCEDURE Question4_ModelAnswer
AS
	SELECT [firstname],[lastname],[balance] FROM [dbo].[client]
	WHERE [balance] BETWEEN 50 AND 150;
GO

DROP PROC IF EXISTS Question5_ModelAnswer;
GO
CREATE PROCEDURE Question5_ModelAnswer
AS
	SELECT [firstname],[lastname],[city] FROM [dbo].[client]
	WHERE [firstname] = 'Mary' AND [lastname] = 'Nelson';
GO

DROP PROC IF EXISTS Question6_ModelAnswer;
GO
CREATE PROCEDURE Question6_ModelAnswer
AS
	SELECT [firstname],[lastname],[balance], [city] FROM [dbo].[client]
	WHERE [balance] < 200 AND [city] = 'Dunedin';
GO

DROP PROC IF EXISTS Question7_ModelAnswer;
GO
CREATE PROCEDURE Question7_ModelAnswer
AS
	SELECT [custref], [creditlimit], [balance], [creditlimit]-[balance]
	AS NewBalance
	FROM [dbo].[client];
GO

DROP PROC IF EXISTS Question8_ModelAnswer;
GO
CREATE PROCEDURE Question8_ModelAnswer
AS
	SELECT [orderref], [partref], [quantity], [quotedPrice],  
	[quantity]*[quotedPrice] AS LineTotal
	FROM [dbo].[orderline];
GO

DROP PROC IF EXISTS Question9_ModelAnswer;
GO
CREATE PROCEDURE Question9_ModelAnswer
AS
	SELECT [orderref],[orderdate]
	FROM [dbo].[custorder]
	WHERE [orderdate] > '6-1-99';
GO

DROP PROC IF EXISTS Question10_ModelAnswer;
GO
CREATE PROCEDURE Question10_ModelAnswer
AS
	SELECT [city], COUNT([custref]) AS 'Number in each city'
	FROM [dbo].[client]
	GROUP BY [city]
	HAVING COUNT([custref]) > 3;
GO

DROP PROC IF EXISTS Question11_ModelAnswer;
GO
CREATE PROCEDURE Question11_ModelAnswer
AS
	SELECT [dbo].[rep].[repref], SUM([dbo].[client].[balance])
	AS 'Total balance'
	FROM [dbo].[rep] INNER JOIN [dbo].[client]
	ON ([dbo].[rep].[repref]  = [dbo].[client].[repref])
	GROUP BY [dbo].[rep].[repref];
GO

DROP PROC IF EXISTS Question12_ModelAnswer;
GO
CREATE PROCEDURE Question12_ModelAnswer
AS
	SELECT [city], MAX([balance]) AS 'Maximum balance'
	FROM [dbo].[client]
	GROUP BY [city];
GO

DROP PROC IF EXISTS Question13_ModelAnswer;
GO
CREATE PROCEDURE Question13_ModelAnswer
AS
	SELECT CONCAT([dbo].[client].[firstname], ' ' , [dbo].[client].[lastname]) AS 'Client name', 
	CONCAT([dbo].[rep].[RepFirstname], ' ' , [dbo].[rep].[RepLastName]) AS 'Rep name'
	FROM [dbo].[client] INNER JOIN [dbo].[rep]
	ON ([dbo].[client].repref = [dbo].[rep].repref);
GO

DROP PROC IF EXISTS Question14_ModelAnswer;
GO
CREATE PROCEDURE Question14_ModelAnswer
AS
	SELECT [orderref], [firstname], [lastname], [orderdate]
	FROM [dbo].[client] INNER JOIN [dbo].[custorder]
	ON ([dbo].[custorder].custref = [dbo].[client].custref);
GO

DROP PROC IF EXISTS Question15_ModelAnswer;
GO
CREATE PROCEDURE Question15_ModelAnswer
AS
	SELECT [dbo].[custorder].[orderref], [description], [onhand]
	FROM [dbo].[custorder] INNER JOIN [dbo].[orderline]
	ON ([dbo].[custorder].orderref = [dbo].[orderline].orderref) INNER JOIN [dbo].[part]
	ON ([dbo].[orderline].partref = [dbo].[part].partref)
	WHERE [dbo].[custorder].[orderref] = '1007';
GO

DROP PROC IF EXISTS Question16_ModelAnswer;
GO
CREATE PROCEDURE Question16_ModelAnswer
AS
	SELECT [dbo].[orderline].orderref, [description], [quotedPrice], [quantity]
	FROM [dbo].[orderline] INNER JOIN [dbo].[part]
	ON ([dbo].[orderline].partref = [dbo].[part].partref)
	ORDER BY [description];
GO

DROP PROC IF EXISTS Question17_ModelAnswer;
GO
CREATE PROCEDURE Question17_ModelAnswer
AS
	SELECT [dbo].[custorder].orderref, [dbo].[part].description, [dbo].[orderline].quotedPrice,
	[dbo].[orderline].quantity
	FROM [dbo].[custorder] INNER JOIN [dbo].[orderline]
	ON ([dbo].[custorder].orderref = [dbo].[orderline].orderref) INNER JOIN [dbo].[part]
	ON ([dbo].[orderline].partref = [dbo].[part].partref)
	WHERE [dbo].[orderline].quotedPrice > 200;
GO

DROP PROC IF EXISTS Question18_ModelAnswer;
GO
CREATE PROCEDURE Question18_ModelAnswer
AS
	SELECT [dbo].[custorder].[orderref], [orderdate], [firstname], [lastname], [description], [unitprice]
	FROM [dbo].[custorder] INNER JOIN [dbo].[orderline]
	ON ([dbo].[custorder].orderref = [dbo].[orderline].orderref) INNER JOIN [dbo].[part]
	ON ([dbo].[orderline].partref = [dbo].[part].partref) INNER JOIN [dbo].[client]
	ON ([dbo].[client].custref = [dbo].[custorder].custref);
GO

DROP PROC IF EXISTS Question19_ModelAnswer;
GO
CREATE PROCEDURE Question19_ModelAnswer
AS
	SELECT [dbo].[custorder].[orderref], [orderdate], [firstname], [lastname], [description], [unitprice]
	FROM [dbo].[custorder] INNER JOIN [dbo].[orderline]
	ON ([dbo].[custorder].orderref = [dbo].[orderline].orderref) INNER JOIN [dbo].[part]
	ON ([dbo].[orderline].partref = [dbo].[part].partref) INNER JOIN [dbo].[client]
	ON ([dbo].[client].custref = [dbo].[custorder].custref)
	WHERE [orderdate] > '6-10-99';
GO

DROP PROC IF EXISTS Question20_ModelAnswer;
GO
CREATE PROCEDURE Question20_ModelAnswer
AS
	SELECT [dbo].[custorder].[orderref], [orderdate], [firstname], [lastname],[repfirstname], [replastname], [description]
	FROM [dbo].[custorder] INNER JOIN [dbo].[orderline]
	ON ([dbo].[custorder].orderref = [dbo].[orderline].orderref) INNER JOIN [dbo].[part]
	ON ([dbo].[orderline].partref = [dbo].[part].partref) INNER JOIN [dbo].[client]
	ON ([dbo].[client].custref = [dbo].[custorder].custref) INNER JOIN [dbo].[rep]
	ON ([dbo].[client].repref = [dbo].[rep].repref);
GO

DROP PROC IF EXISTS Question21_ModelAnswer;
GO
CREATE PROCEDURE Question21_ModelAnswer
AS
	SELECT CONCAT([dbo].[rep].[RepFirstname], ' ' , [dbo].[rep].[RepLastName]) AS 'Rep Name',
	SUM([dbo].[client].[balance]) AS 'Total balance'
	FROM [dbo].[rep] INNER JOIN [dbo].[client]
	ON ([dbo].[rep].[repref] = [dbo].[client].[repref])
	GROUP BY [dbo].[rep].[RepFirstname], [dbo].[rep].[RepLastName];
GO

DROP PROC IF EXISTS Question22_ModelAnswer;
GO
CREATE PROCEDURE Question22_ModelAnswer
AS
	SELECT [orderref], SUM([quantity]*[quotedPrice]) AS 'Total Linetotal'
	FROM [dbo].[orderline]
	GROUP BY [orderref];
GO