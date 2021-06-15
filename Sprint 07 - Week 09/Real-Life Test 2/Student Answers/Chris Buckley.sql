USE Clientorders;


DROP PROC IF EXISTS Question2;
GO
CREATE PROCEDURE Question2
AS
SELECT firstname, lastname, city
FROM [dbo].[client]
WHERE city = 'Dunedin';
GO

DROP PROC IF EXISTS Question3;
GO
CREATE PROCEDURE Question3
AS
SELECT firstname, lastname
FROM [dbo].[client]
WHERE lastname like 'J%';
GO

DROP PROC IF EXISTS Question4;
GO
CREATE PROCEDURE Question4
AS
SELECT firstname, lastname, balance
FROM client
WHERE balance between 50 and 150;
GO

DROP PROC IF EXISTS Question5;
GO
CREATE PROCEDURE Question5
AS
SELECT firstname, lastname, city
FROM Client
WHERE firstname like 'Mary' and lastname like 'Nelson'
GO

DROP PROC IF EXISTS Question6;
GO
CREATE PROCEDURE Question6
AS
SELECT firstname, lastname, balance, city
FROM client
WHERE balance < '200' and city like 'Dunedin'
GO

DROP PROC IF EXISTS Question7;
GO
CREATE PROCEDURE Question7
AS
SELECT custref, creditlimit, balance, creditlimit-balance AS NewBalance 
FROM Client
GO

DROP PROC IF EXISTS Question8;
GO
CREATE PROCEDURE Question8
AS
SELECT orderref, partref, quantity, quotedPrice, quantity*quotedPrice AS LineTotal
FROM [dbo].[orderline]
GO

DROP PROC IF EXISTS Question9;
GO
CREATE PROCEDURE Question9
AS
SELECT orderref, orderdate
FROM [dbo].[custorder]
WHERE orderdate > '1999-6-1'
GO

DROP PROC IF EXISTS Question10;
GO
CREATE PROCEDURE Question10
AS
SELECT  city, COUNT(city) 'Number in each city'
FROM [dbo].[client]
GROUP BY city
HAVING COUNT(*) > 4
GO

DROP PROC IF EXISTS Question11;
GO
CREATE PROCEDURE Question11
AS
GO

DROP PROC IF EXISTS Question12;
GO
CREATE PROCEDURE Question12
AS
SELECT City, MAX(balance)'Maximum Balance'
FROM [dbo].[client]
GROUP BY city
GO

DROP PROC IF EXISTS Question13;
GO
CREATE PROCEDURE Question13
AS
--SELECT (firstname + ' ' + lastname), (RepFirstname + ' ' + RepLastName)
--FROM [dbo].[client] AS C
--LEFT JOIN [dbo].[rep] AS R
--	ON R.repref = C.repref
--GROUP BY firstname
GO

DROP PROC IF EXISTS Question14;
GO
CREATE PROCEDURE Question14
AS
SELECT orderref, cl.firstname, lastname, orderdate
FROM [dbo].[client] AS CL
LEFT JOIN [dbo].[custorder] AS CU
	ON CL.custref = CU.custref
GO
	
DROP PROC IF EXISTS Question15;
GO
CREATE PROCEDURE Question15
AS
SELECT orderref, description, onhand
FROM [dbo].[orderline] AS O
LEFT JOIN [dbo].[part] AS P
	ON O.partref = P.partref
WHERE orderref = 1007
GO

DROP PROC IF EXISTS Question16;
GO
CREATE PROCEDURE Question16
AS
SELECT orderref, description, onhand, quotedPrice
FROM [dbo].[orderline] AS O
LEFT JOIN [dbo].[part] AS P
	ON O.partref = P.partref
	ORDER by 'Description'
GO

DROP PROC IF EXISTS Question17;
GO
CREATE PROCEDURE Question17
AS
GO

DROP PROC IF EXISTS Question18;
GO
CREATE PROCEDURE Question18
AS
GO

DROP PROC IF EXISTS Question19;
GO
CREATE PROCEDURE Question19
AS
GO

DROP PROC IF EXISTS Question20;
GO
CREATE PROCEDURE Question20
AS
SELECT o.orderref, orderdate, firstname, lastname, description, unitPrice, RepFirstname, RepLastName
FROM [dbo].[client] AS cl
LEFT JOIN [dbo].[custorder] AS cu
	ON cl.custref = cu.custref
		LEFT JOIN [dbo].[orderline] AS o
			ON o.orderref = cu.orderref
				LEFT JOIN [dbo].[part] AS p
					ON p.partref = o.partref
						LEFT JOIN [dbo].[rep] AS R
							ON r.repref = cl.repref
GO
		
DROP PROC IF EXISTS Question21;
GO
CREATE PROCEDURE Question21
AS
--SELECT RepFirstname + ' ' + RepLastName AS 'Rep Name', SUM(balance)
--FROM [dbo].[rep] AS R
--LEFT JOIN [dbo].[client] AS CL
--	ON R.repref = CL. repref
--	HAVING SUM(balance)
--	GROUP BY balance
GO


DROP PROC IF EXISTS Question22;
GO
CREATE PROCEDURE Question22
AS
GO


