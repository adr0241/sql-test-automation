/*
Jason Henson 
jah926@arastudent.ac.nz
11400870
*/
-- Question 1:
 
-- Question 2:
DROP PROC IF EXISTS Question2;
GO
CREATE PROCEDURE Question2
AS
SELECT firstname, lastname, city FROM client
WHERE city = 'Dunedin'
GO
 
 
-- Question 3:
DROP PROC IF EXISTS Question3;
GO
CREATE PROCEDURE Question3
AS
SELECT firstname, lastname FROM client
WHERE lastname LIKE 'J%'
GO
 

-- Question 4:
DROP PROC IF EXISTS Question4;
GO
CREATE PROCEDURE Question4
AS
SELECT firstname, lastname, balance FROM client
WHERE balance BETWEEN '50' AND '150'
GO
 

-- Question 5:
DROP PROC IF EXISTS Question5;
GO
CREATE PROCEDURE Question5
AS
SELECT firstname, lastname, city FROM client
WHERE firstname = 'Mary'
AND lastname = 'Nelson'
GO


-- Question 6:
DROP PROC IF EXISTS Question6;
GO
CREATE PROCEDURE Question6
AS
SELECT firstname, lastname, balance, city FROM client
WHERE city = 'Dunedin'
AND balance < '200'
GO
 
-- Question 7:
DROP PROC IF EXISTS Question7;
GO
CREATE PROCEDURE Question7
AS
SELECT custref, creditlimit, balance, (creditlimit - balance) AS 'NewBalance'
FROM client
GO
 

-- Question 8:
DROP PROC IF EXISTS Question8;
GO
CREATE PROCEDURE Question8
AS
SELECT orderref, partref, quantity, quotedprice, 
(quantity * quotedPrice) AS 'LineTotal'
FROM orderline
GO
 

-- Question 9:
DROP PROC IF EXISTS Question9;
GO
CREATE PROCEDURE Question9
AS
SELECT orderref, orderdate
FROM custorder
-- Convert NZ format to American format
WHERE orderdate > '6-1-99'
GO
 

-- Question 10:
DROP PROC IF EXISTS Question10;
GO
CREATE PROCEDURE Question10
AS
SELECT city, COUNT(custref) AS 'Number in each city'
FROM client
GROUP BY city
HAVING COUNT(custref) > 3
GO
 

-- Question 11:
DROP PROC IF EXISTS Question11;
GO
CREATE PROCEDURE Question11
AS
SELECT repref, SUM(client.balance) AS 'Total balance'
FROM client
GROUP BY repref
GO

 

-- Question 12:
DROP PROC IF EXISTS Question12;
GO
CREATE PROCEDURE Question12
AS
SELECT TOP 3 city, SUM(balance) AS 'Maximum Balance'
FROM client
GROUP BY city
GO


-- Question 13:
DROP PROC IF EXISTS Question13;
GO
CREATE PROCEDURE Question13
AS
SELECT CONCAT_WS(' ', c.firstname, c.lastname) AS 'Client name',
CONCAT_WS(' ', r.RepFirstname, r.RepLastName) AS 'Rep name'
FROM client c
INNER JOIN rep r
ON c.repref = r.repref
GO

 

-- Question 14:
DROP PROC IF EXISTS Question14;
GO
CREATE PROCEDURE Question14
AS
SELECT co.orderref, c.firstname, c.lastname, co.orderdate
FROM client c
INNER JOIN custorder co
ON c.custref = co.custref
GO

 

-- Question 15:
DROP PROC IF EXISTS Question15;
GO
CREATE PROCEDURE Question15
AS
SELECT ol.orderref, p.description, p.onHand
FROM orderline ol
INNER JOIN part p
ON ol.partref = p.partref
GROUP BY ol.orderref, p.description, p.onHand
HAVING ol.orderref = '1007'
GO
 

-- Question 16:
DROP PROC IF EXISTS Question16;
GO
CREATE PROCEDURE Question16
AS
SELECT ol.orderref, p.description, ol.quotedPrice, ol.quantity
FROM orderline ol
INNER JOIN part p
ON ol.partref = p.partref
ORDER BY p.description
GO

 

-- Question 17:
DROP PROC IF EXISTS Question17;
GO
CREATE PROCEDURE Question17
AS
SELECT ol.orderref, p.description, ol.quotedPrice, ol.quantity
FROM orderline ol
INNER JOIN part p
ON ol.partref = p.partref
WHERE ol.quotedPrice > 200
GO
 

-- Question 18:
DROP PROC IF EXISTS Question18;
GO
CREATE PROCEDURE Question18
AS
SELECT co.orderref, co.orderdate,
c.firstname, c.lastname, 
p.description, p.unitPrice
FROM custorder co
INNER JOIN client c
ON c.custref = co.custref
INNER JOIN orderline ol
ON ol.orderref = co.orderref
INNER JOIN part p
ON ol.partref = p.partref
GO

 

-- Question 19:
DROP PROC IF EXISTS Question19;
GO
CREATE PROCEDURE Question19
AS
SELECT co.orderref, co.orderdate,
c.firstname, c.lastname, 
p.description, p.unitPrice
FROM custorder co
INNER JOIN client c
ON c.custref = co.custref
INNER JOIN orderline ol
ON ol.orderref = co.orderref
INNER JOIN part p
ON ol.partref = p.partref
-- Convert NZ Date to US Date
WHERE co.orderdate > '06/10/99'
GO
 
-- Question 20:
DROP PROC IF EXISTS Question20;
GO
CREATE PROCEDURE Question20
AS
SELECT co.orderref, co.orderdate,
c.firstname, c.lastname, 
r.RepFirstname, r.RepLastName,
p.description
FROM custorder co
INNER JOIN client c
ON c.custref = co.custref
INNER JOIN rep r
ON r.repref = c.repref
INNER JOIN orderline ol
ON ol.orderref = co.orderref
INNER JOIN part p
ON ol.partref = p.partref
GO

 

-- Question 21:
DROP PROC IF EXISTS Question21;
GO
CREATE PROCEDURE Question21
AS
SELECT CONCAT_WS(' ', r.RepFirstname, r.RepLastName) AS 'Rep Name',
SUM(c.balance) AS 'Total Balance'
FROM client c
INNER JOIN rep r
ON r.repref = c.repref
GROUP BY r.RepFirstname, r.RepLastName
GO

 

-- Question 22:
DROP PROC IF EXISTS Question22;
GO
CREATE PROCEDURE Question22
AS
SELECT orderref, SUM(quantity * quotedprice) AS 'Total Linetotal'
FROM orderline
GROUP BY orderref
GO
 

