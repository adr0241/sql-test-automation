-- Finn Callaghan Database Practical Test
-- 11/06/2021
USE Clientorders;
GO

-- 2
DROP PROC IF EXISTS Question2;
GO
CREATE PROCEDURE Question2
AS
SELECT firstname, lastname, city
FROM client
WHERE city = 'Dunedin';
GO

-- 3
DROP PROC IF EXISTS Question3;
GO
CREATE PROCEDURE Question3
AS
SELECT firstname, lastname
FROM client
WHERE lastname LIKE 'J%';
GO

-- 4
DROP PROC IF EXISTS Question4;
GO
CREATE PROCEDURE Question4
AS
SELECT firstname, lastname, balance
FROM client
WHERE balance BETWEEN 50 AND 150;
GO

-- 5
DROP PROC IF EXISTS Question5;
GO
CREATE PROCEDURE Question5
AS
SELECT firstname, lastname, city
FROM client
WHERE firstname = 'Mary' AND lastname = 'Nelson';
GO

-- 6
DROP PROC IF EXISTS Question6;
GO
CREATE PROCEDURE Question6
AS
SELECT firstname, lastname, balance, city
FROM client
WHERE balance < 200 AND city = 'Dunedin';
GO

-- 7
DROP PROC IF EXISTS Question7;
GO
CREATE PROCEDURE Question7
AS
SELECT custref, creditlimit, balance, (creditlimit - balance) AS NewBalance
FROM client;
GO

-- 8
DROP PROC IF EXISTS Question8;
GO
CREATE PROCEDURE Question8
AS
SELECT orderref, partref, quantity, quotedPrice,(quantity * quotedPrice) AS LineTotal
FROM orderline;
GO

-- 9
DROP PROC IF EXISTS Question9;
GO
CREATE PROCEDURE Question9
AS
SELECT orderref, orderdate
FROM custorder
WHERE orderdate > '1999/06/01';
GO

-- 10
DROP PROC IF EXISTS Question10;
GO
CREATE PROCEDURE Question10
AS
SELECT COUNT(custref) AS NumClientsLivingInCity, city
FROM client
GROUP BY city
HAVING COUNT(custref) > 3;
GO

-- 11
DROP PROC IF EXISTS Question11;
GO
CREATE PROCEDURE Question11
AS
SELECT rep.repref, SUM(client.balance) AS TotalBalance
FROM rep
INNER JOIN client ON client.repref = rep.repref
GROUP BY rep.repref;
GO

-- 12
DROP PROC IF EXISTS Question12;
GO
CREATE PROCEDURE Question12
AS
SELECT city, MAX(balance) AS MaximumBalance
FROM client
GROUP BY city;
GO

-- 13
DROP PROC IF EXISTS Question13;
GO
CREATE PROCEDURE Question13
AS
SELECT firstname + ' ' + lastname AS ClientName, (rep.RepFirstname + ' ' + rep.RepLastName) AS RepName
FROM client
INNER JOIN rep ON rep.repref = client.repref;
GO

-- 14
DROP PROC IF EXISTS Question14;
GO
CREATE PROCEDURE Question14
AS
SELECT custorder.orderref, firstname, lastname, custorder.orderdate
FROM client
INNER JOIN custorder ON custorder.custref = client.custref;
GO

-- 15
DROP PROC IF EXISTS Question15;
GO
CREATE PROCEDURE Question15
AS
SELECT orderref, part.description, part.onHand
FROM orderline
INNER JOIN part ON part.partref = orderline.partref
WHERE orderref = 1007;
GO

-- 16
DROP PROC IF EXISTS Question16;
GO
CREATE PROCEDURE Question16
AS
SELECT orderline.orderref, description, orderline.quotedPrice, orderline.quantity
FROM part
INNER JOIN orderline ON orderline.partref = part.partref
ORDER BY description;
GO

-- 17
DROP PROC IF EXISTS Question17;
GO
CREATE PROCEDURE Question17
AS
SELECT orderref, part.description, quotedPrice, quantity
FROM orderline
INNER JOIN part ON part.partref = orderline.partref
WHERE quotedPrice > 200;
GO

-- 18
DROP PROC IF EXISTS Question18;
GO
CREATE PROCEDURE Question18
AS
SELECT custorder.orderref, orderdate, client.firstname, client.lastname, part.description, part.unitPrice
FROM custorder
INNER JOIN client ON client.custref = custorder.custref
INNER JOIN orderline ON orderline.orderref = custorder.orderref
INNER JOIN part ON part.partref = orderline.partref;
GO

-- 19
DROP PROC IF EXISTS Question19;
GO
CREATE PROCEDURE Question19
AS
SELECT orderline.orderref, custorder.orderdate, client.firstname, client.lastname, part.description, part.unitPrice
FROM orderline
INNER JOIN custorder ON custorder.orderref = orderline.orderref
INNER JOIN client ON client.custref = custorder.custref
INNER JOIN part ON part.partref = orderline.partref
WHERE custorder.orderdate > '1999/06/10';
GO

-- 20
DROP PROC IF EXISTS Question20;
GO
CREATE PROCEDURE Question20
AS
SELECT custorder.orderref, orderdate, client.firstname, client.lastname, rep.RepFirstname, rep.RepLastName, part.description
FROM custorder
INNER JOIN client ON client.custref = custorder.custref
INNER JOIN rep ON rep.repref = client.repref
INNER JOIN orderline ON orderline.orderref = custorder.orderref
INNER JOIN part ON part.partref = orderline.partref;
GO

-- 21
DROP PROC IF EXISTS Question21;
GO
CREATE PROCEDURE Question21
AS
SELECT RepFirstname + ' ' + RepLastName AS RepName, SUM(client.balance) AS TotalBalance
FROM rep
INNER JOIN client ON client.repref = rep.repref
GROUP BY RepFirstname + ' ' + RepLastName;
GO

-- 22
DROP PROC IF EXISTS Question22;
GO
CREATE PROCEDURE Question22
AS
SELECT orderref, SUM(quantity * quotedPrice) AS LineTotal
FROM orderline
GROUP BY orderref;
GO