
DROP PROC IF EXISTS Question2;
GO
CREATE PROCEDURE Question2
AS
SELECT firstname, lastname, city
FROM client
WHERE city = 'Dunedin';
GO

DROP PROC IF EXISTS Question3;
GO
CREATE PROCEDURE Question3
AS
SELECT firstname, lastname
FROM client
WHERE lastname LIKE 'J%';
GO

DROP PROC IF EXISTS Question4;
GO
CREATE PROCEDURE Question4
AS
SELECT firstname, lastname, balance
FROM client
WHERE balance > 50 AND balance < 150;
GO

DROP PROC IF EXISTS Question5;
GO
CREATE PROCEDURE Question5
AS
SELECT firstname, lastname, city
FROM client
WHERE firstname = 'Mary' AND lastname = 'Nelson';
GO

DROP PROC IF EXISTS Question6;
GO
CREATE PROCEDURE Question6
AS
SELECT firstname, lastname, balance, city
FROM client
WHERE balance < 200 AND city = 'Dunedin';
GO

DROP PROC IF EXISTS Question7;
GO
CREATE PROCEDURE Question7
AS
SELECT custref, creditlimit, balance, (creditlimit - balance) AS NewBalance
FROM client;
GO

DROP PROC IF EXISTS Question8;
GO
CREATE PROCEDURE Question8
AS
SELECT orderref, partref, quantity, quotedPrice, (quantity * quotedPrice) AS LineTotal
FROM orderline;
GO

DROP PROC IF EXISTS Question9;
GO
CREATE PROCEDURE Question9
AS
SELECT custorder.orderref, custorder.orderdate
FROM custorder
INNER JOIN client ON custorder.custref=client.custref
WHERE custorder.orderdate > '1999-06-01';
GO

DROP PROC IF EXISTS Question10;
GO
CREATE PROCEDURE Question10
AS
SELECT city, COUNT(city) AS NumOfClients
FROM client
GROUP BY city
HAVING COUNT(city) > 3;
GO

DROP PROC IF EXISTS Question11;
GO
CREATE PROCEDURE Question11
AS
SELECT rep.RepFirstname, rep.RepLastName, SUM((orderline.quantity * orderline.quotedPrice) * (rep.commission / 100)) AS RepBalance
FROM rep
INNER JOIN client ON rep.repref=client.repref
INNER JOIN custorder ON client.custref=custorder.custref
INNER JOIN orderline ON custorder.orderref=orderline.orderref
GROUP BY rep.RepFirstname, rep.RepLastName;
GO

DROP PROC IF EXISTS Question12;
GO
CREATE PROCEDURE Question12
AS
SELECT city, SUM(balance) AS MaxBalance
FROM client
GROUP BY city;
GO

DROP PROC IF EXISTS Question13;
GO
CREATE PROCEDURE Question13
AS
SELECT CONCAT(client.firstname, ' ', client.lastname) AS CustName, CONCAT(rep.RepFirstName, ' ', rep.RepLastName) AS RepName
FROM client
INNER JOIN rep ON client.repref=rep.repref;
GO

DROP PROC IF EXISTS Question14;
GO
CREATE PROCEDURE Question14
AS
SELECT custorder.orderref, custorder.orderdate, client.firstname, client.lastname
FROM custorder
INNER JOIN client ON custorder.custref=client.custref;
GO

DROP PROC IF EXISTS Question15;
GO
CREATE PROCEDURE Question15
AS
SELECT orderline.orderref, part.description, part.onHand
FROM orderline
INNER JOIN part ON orderline.partref=part.partref
WHERE orderline.orderref = 1007;
GO

DROP PROC IF EXISTS Question16;
GO
CREATE PROCEDURE Question16
AS
SELECT orderline.orderref, part.description, orderline.quotedPrice, orderline.quantity
FROM orderline
INNER JOIN part ON orderline.partref=part.partref
ORDER BY part.description;
GO

DROP PROC IF EXISTS Question17;
GO
CREATE PROCEDURE Question17
AS
SELECT orderline.orderref, part.description, orderline.quotedPrice, orderline.quantity
FROM orderline
INNER JOIN part ON orderline.partref=part.partref
WHERE orderline.quotedPrice > 200;
GO

DROP PROC IF EXISTS Question18;
GO
CREATE PROCEDURE Question18
AS
SELECT custorder.orderref, custorder.orderdate, CONCAT(client.firstname, ' ', client.lastname) AS ClientName, part.description, part.unitPrice
FROM orderline
INNER JOIN custorder ON orderline.orderref=custorder.orderref
INNER JOIN client ON custorder.custref=client.custref
INNER JOIN part ON orderline.partref=part.partref;
GO

DROP PROC IF EXISTS Question19;
GO
CREATE PROCEDURE Question19
AS
SELECT custorder.orderref, custorder.orderdate, CONCAT(client.firstname, ' ', client.lastname) AS ClientName, part.description, part.unitPrice
FROM orderline
INNER JOIN custorder ON orderline.orderref=custorder.orderref
INNER JOIN client ON custorder.custref=client.custref
INNER JOIN part ON orderline.partref=part.partref
WHERE custorder.orderdate > '1999-06-10';
GO

DROP PROC IF EXISTS Question20;
GO
CREATE PROCEDURE Question20
AS
SELECT custorder.orderref, custorder.orderdate, CONCAT(client.firstname, ' ', client.lastname) AS ClientName, CONCAT(rep.RepFirstname, ' ', rep.RepLastName) AS RepName, part.description
FROM orderline
INNER JOIN custorder ON orderline.orderref=custorder.orderref
INNER JOIN client ON custorder.custref=client.custref
INNER JOIN part ON orderline.partref=part.partref
INNER JOIN rep ON client.repref=rep.repref;
GO

DROP PROC IF EXISTS Question21;
GO
CREATE PROCEDURE Question21
AS
SELECT CONCAT(rep.RepFirstname, ' ', rep.RepLastName) AS RepName, SUM(orderline.quantity * orderline.quotedPrice) AS TotalBalance
FROM rep
INNER JOIN client ON rep.repref=client.repref
INNER JOIN custorder ON client.custref=custorder.custref
INNER JOIN orderline ON custorder.orderref=orderline.orderref
GROUP BY rep.RepFirstname, rep.RepLastName;
GO

DROP PROC IF EXISTS Question22;
GO
CREATE PROCEDURE Question22
AS
SELECT orderref, SUM(quantity * quotedPrice) AS LineTotal
FROM orderline
GROUP BY orderref;
GO