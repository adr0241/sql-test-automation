-- Question 2
DROP PROC IF EXISTS Question2;
GO
CREATE PROCEDURE Question2
AS
SELECT firstname, lastname, city FROM client
WHERE city = 'Dunedin'
GO

-- Question 3
DROP PROC IF EXISTS Question3;
GO
CREATE PROCEDURE Question3
AS
SELECT firstname, lastname FROM client
WHERE lastname LIKE 'J%'
GO

-- Question 4
DROP PROC IF EXISTS Question4;
GO
CREATE PROCEDURE Question4
AS
SELECT firstname, lastname, balance FROM client
WHERE balance >= 50
AND balance <= 150
GO

-- Question 5
DROP PROC IF EXISTS Question5;
GO
CREATE PROCEDURE Question5
AS
SELECT firstname, lastname, city FROM client
WHERE firstname = 'Mary'
AND lastname = 'Nelson'
GO

-- Question 6
DROP PROC IF EXISTS Question6;
GO
CREATE PROCEDURE Question6
AS
SELECT firstname, lastname, balance, city FROM client
WHERE balance < 200
AND city = 'Dunedin'
GO

-- Question 7
DROP PROC IF EXISTS Question7;
GO
CREATE PROCEDURE Question7
AS
SELECT custref, creditlimit, balance, creditlimit - balance as NewBalance 
FROM client
GO

-- Question 8
DROP PROC IF EXISTS Question8;
GO
CREATE PROCEDURE Question8
AS
SELECT *, quantity * quotedPrice as LineTotal 
FROM orderline
GO

-- Question 9
DROP PROC IF EXISTS Question9;
GO
CREATE PROCEDURE Question9
AS
SELECT orderref, orderdate FROM custorder
WHERE orderdate > '1999/06/01'
GO

-- Question 10
DROP PROC IF EXISTS Question10;
GO
CREATE PROCEDURE Question10
AS
SELECT city, COUNT(*) as 'Number in each city'
FROM client
GROUP BY city
HAVING COUNT(*) > 3
GO

-- Question 11
DROP PROC IF EXISTS Question11;
GO
CREATE PROCEDURE Question11
AS
SELECT rep.repref, 
SUM(quantity * quotedPrice) as 'Total balance'
FROM orderline
INNER JOIN custorder ON orderline.orderref = custorder.orderref
INNER JOIN client ON custorder.custref = client.custref
INNER JOIN part ON orderline.partref = part.partref
INNER JOIN rep on client.repref = rep.repref
GROUP BY rep.repref
GO

-- Question 12
DROP PROC IF EXISTS Question12;
GO
CREATE PROCEDURE Question12
AS
SELECT city, MAX(balance) AS 'Maximum balance'
FROM client
GROUP BY city
GO

-- Question 13
DROP PROC IF EXISTS Question13;
GO
CREATE PROCEDURE Question13
AS
SELECT 
CONCAT(firstname, ' ' , lastname) as 'Client name', 
CONCAT(RepFirstname, ' ' , RepLastName) as 'Rep Name'
FROM client
INNER JOIN rep ON client.repref=rep.repref
GO

-- Question 14
DROP PROC IF EXISTS Question14;
GO
CREATE PROCEDURE Question14
AS
SELECT orderref, firstname, lastname, orderdate
FROM custorder
INNER JOIN client ON custorder.custref = client.custref
GO

-- Question 15
DROP PROC IF EXISTS Question15;
GO
CREATE PROCEDURE Question15
AS
SELECT orderref, description, onhand
FROM part
INNER JOIN orderline ON part.partref = orderline.partref
WHERE orderline.orderref = 1007
GO

-- Question 16
DROP PROC IF EXISTS Question16;
GO
CREATE PROCEDURE Question16
AS
SELECT orderref, description, quotedprice, quantity
FROM orderline
INNER JOIN part ON orderline.partref = part.partref
ORDER BY description
GO

-- Question 17
DROP PROC IF EXISTS Question17;
GO
CREATE PROCEDURE Question17
AS
SELECT orderref, description, quotedprice, quantity
FROM orderline
INNER JOIN part ON orderline.partref = part.partref
WHERE quotedPrice > 200
GO

-- Question 18
DROP PROC IF EXISTS Question18;
GO
CREATE PROCEDURE Question18
AS
SELECT orderline.orderref, orderdate, firstname, lastname, description, unitprice
FROM orderline
INNER JOIN custorder ON orderline.orderref = custorder.orderref
INNER JOIN client ON custorder.custref = client.custref
INNER JOIN part ON orderline.partref = part.partref
GO

-- Question 19
DROP PROC IF EXISTS Question19;
GO
CREATE PROCEDURE Question19
AS
SELECT orderline.orderref, orderdate, firstname, lastname, description, unitprice
FROM orderline
INNER JOIN custorder ON orderline.orderref = custorder.orderref
INNER JOIN client ON custorder.custref = client.custref
INNER JOIN part ON orderline.partref = part.partref
WHERE orderdate > '1999-06-10'
GO

-- Question 20
DROP PROC IF EXISTS Question20;
GO
CREATE PROCEDURE Question20
AS
SELECT orderline.orderref, orderdate, firstname, lastname, repfirstname, replastname, description
FROM orderline
INNER JOIN custorder ON orderline.orderref = custorder.orderref
INNER JOIN client ON custorder.custref = client.custref
INNER JOIN part ON orderline.partref = part.partref
INNER JOIN rep ON client.repref = rep.repref
GO

-- Question 21
DROP PROC IF EXISTS Question21;
GO
CREATE PROCEDURE Question21
AS
SELECT CONCAT(rep.RepFirstname, ' ', rep.RepLastName) AS 'Rep Name',
SUM(quantity * quotedPrice) as 'Total balance'
FROM orderline
INNER JOIN custorder ON orderline.orderref = custorder.orderref
INNER JOIN client ON custorder.custref = client.custref
INNER JOIN part ON orderline.partref = part.partref
INNER JOIN rep on client.repref = rep.repref
GROUP BY CONCAT(rep.RepFirstname, ' ', rep.RepLastName)
GO


-- Question 22
DROP PROC IF EXISTS Question22;
GO
CREATE PROCEDURE Question22
AS
SELECT orderref, SUM(quantity * quotedPrice) as 'Total Linetotal'
FROM orderline
GROUP BY orderref
GO