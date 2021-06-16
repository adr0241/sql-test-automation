
--------------------1


use Clientorders;
GO

-------------------2

DROP PROC IF EXISTS Question2;
GO
CREATE PROCEDURE Question2
AS
SELECT firstname,lastname, city
	FROM client
		WHERE city = 'Dunedin';
GO


-------------------3

DROP PROC IF EXISTS Question3;
GO
CREATE PROCEDURE Question3
AS
SELECT firstname, lastname
	FROM client
		WHERE lastname LIKE 'J%';
GO

-------------------4
DROP PROC IF EXISTS Question4;
GO
CREATE PROCEDURE Question4
AS
SELECT firstname, lastname, balance
	FROM client
		WHERE balance > 50
		AND balance < 150;
GO

--------------------5
DROP PROC IF EXISTS Question5;
GO
CREATE PROCEDURE Question5
AS
SELECT firstname, lastname, city
	FROM client
		WHERE firstname = 'Mary'
		AND lastname = 'Nelson';
GO

-----------------------6
DROP PROC IF EXISTS Question6;
GO
CREATE PROCEDURE Question6
AS
SELECT firstname, lastname, balance, city
	FROM client
		WHERE city = 'Dunedin'
		AND balance < 200;
GO

-----------------7
DROP PROC IF EXISTS Question7;
GO
CREATE PROCEDURE Question7
AS
SELECT custref, creditlimit, balance, 
	(creditlimit - balance) AS NewBalance
	FROM client;
GO


----------------------8

DROP PROC IF EXISTS Question8;
GO
CREATE PROCEDURE Question8
AS
SELECT orderref, partref, quantity, quotedPrice,
	(quantity * quotedPrice) AS LineTotal
	FROM orderline;
GO

------------------------9
DROP PROC IF EXISTS Question9;
GO
CREATE PROCEDURE Question9
AS
SELECT orderref, orderdate
	FROM custorder
		WHERE orderdate > '1999-06-01';
GO

---------------------------10
DROP PROC IF EXISTS Question10;
GO
CREATE PROCEDURE Question10
AS
SELECT city, COUNT(custref) AS 'Number In each City'
	FROM client
		GROUP BY city
			HAVING COUNT(custref) > 3;
GO

---------------------------11
--TOTAL BALANCE FOR EACH REP IS CUST BALANCE * REP'S COMMISSION PERCENTAGE
--SELECT R.RepFirstname, R.RepLastName,
--		ROUND(SUM(C.balance * R.commission / 10), 2)  AS TotalSalesrepsBalance
--	FROM rep R
--	INNER JOIN client C ON C.repref = R.repref
--		GROUP BY RepLastName, RepFirstname;
--GO

-----------------------------11
DROP PROC IF EXISTS Question11;
GO
CREATE PROCEDURE Question11
AS
SELECT R.repref, SUM(C.balance * R.commission / 10) AS 'Total Balance'
	FROM rep R
	INNER JOIN client C ON C.repref = R.repref
		GROUP BY R.repref;
GO


---------------------------12

DROP PROC IF EXISTS Question12;
GO
CREATE PROCEDURE Question12
AS
SELECT city, MAX(balance) AS 'Maximum Balance'
	FROM client
		GROUP BY city;
GO

--------------------------13
DROP PROC IF EXISTS Question13;
GO
CREATE PROCEDURE Question13
AS
SELECT CONCAT(C.firstname, ' ', C.lastname) AS 'Client Name',
	CONCAT(R.RepFirstname, ' ', R.RepLastName) AS 'Rep Name'
	FROM client C
	INNER JOIN rep R ON C.repref = R.repref;
GO

-------------------------14
DROP PROC IF EXISTS Question14;
GO
CREATE PROCEDURE Question14
AS
SELECT CO.orderref, C.firstname, C.lastname, CO.orderdate
	FROM client C
	INNER JOIN custorder CO ON C.custref = CO.custref;
GO


-------------------------15

DROP PROC IF EXISTS Question15;
GO
CREATE PROCEDURE Question15
AS
SELECT OL.orderref, P.description, P.onHand
	FROM part P
	INNER JOIN orderline OL ON P.partref = OL.partref
		WHERE OL.orderref = 1007;
GO

---------------------------16
DROP PROC IF EXISTS Question16;
GO
CREATE PROCEDURE Question16
AS
SELECT OL.orderref, P.description, OL.quotedPrice, OL.quantity
	FROM orderline OL
	INNER JOIN part P ON P.partref = OL.partref
		ORDER BY P.description;
GO

--------------------17

DROP PROC IF EXISTS Question17;
GO
CREATE PROCEDURE Question17
AS
SELECT OL.orderref, P.description, OL.quotedPrice, OL.quantity
	FROM orderline OL
	INNER JOIN part P ON P.partref = OL.partref
		WHERE OL.quotedPrice > 200;
GO

--------------------18
DROP PROC IF EXISTS Question18;
GO
CREATE PROCEDURE Question18
AS
SELECT CO.orderref, CO.orderdate, C.firstname, C.lastname, P.description,
	P.unitPrice
	FROM CLIENT C
	INNER JOIN custorder CO ON C.custref = CO.custref
	INNER JOIN orderline OL ON CO.orderref = OL.orderref
	INNER JOIN part P ON P.partref = OL.partref;
GO

---------------------19
DROP PROC IF EXISTS Question19;
GO
CREATE PROCEDURE Question19
AS
SELECT CO.orderref, CO.orderdate, C.firstname, C.lastname, P.description,
	P.unitPrice
	FROM CLIENT C
	INNER JOIN custorder CO ON C.custref = CO.custref
	INNER JOIN orderline OL ON CO.orderref = OL.orderref
	INNER JOIN part P ON P.partref = OL.partref
		WHERE CO.orderdate > '1999-06-10';
GO


-----------------------20

DROP PROC IF EXISTS Question20;
GO
CREATE PROCEDURE Question20
AS
SELECT CO.orderref, CO.orderdate, C.firstname, C.lastname, R.RepFirstname,
	R.RepLastName, P.description
	FROM CLIENT C
	INNER JOIN custorder CO ON C.custref = CO.custref
	INNER JOIN orderline OL ON CO.orderref = OL.orderref
	INNER JOIN rep R ON R.repref = C.repref
	INNER JOIN part P ON P.partref = OL.partref;		
GO


-----------------------------21
DROP PROC IF EXISTS Question21;
GO
CREATE PROCEDURE Question21
AS
SELECT CONCAT(R.RepFirstname, ' ', R.RepLastName) AS 'Rep Name', 
	ROUND(SUM(C.balance * R.commission / 10 ), 2) AS 'Total Balance'
	FROM rep R
	INNER JOIN client C ON C.repref = R.repref
		GROUP BY CONCAT(R.RepFirstname, ' ', R.RepLastName)
			ORDER BY SUM(C.balance * R.commission / 10 );
GO



-------------------------------22

DROP PROC IF EXISTS Question22;
GO
CREATE PROCEDURE Question22
AS
SELECT orderref, SUM(quantity * quotedPrice) AS 'Total Linetotal'
	FROM orderline
		GROUP BY orderref;
GO
