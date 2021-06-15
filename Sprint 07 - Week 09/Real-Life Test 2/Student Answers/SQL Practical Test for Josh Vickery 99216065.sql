--1
DROP PROC IF EXISTS Question2;
GO
CREATE PROCEDURE Question2
AS
SELECT firstname, lastname, city
FROM client
WHERE city ='Dunedin';
GO

--2
DROP PROC IF EXISTS Question3;
GO
CREATE PROCEDURE Question3
AS
SELECT firstname, lastname
FROM client
WHERE lastname LIKE 'J%';
GO

--3
DROP PROC IF EXISTS Question4;
GO
CREATE PROCEDURE Question4
AS
SELECT firstname, lastname, balance
FROM client
WHERE balance BETWEEN '50' AND '150';
GO


--4
DROP PROC IF EXISTS Question5;
GO
CREATE PROCEDURE Question5
AS
SELECT firstname, lastname, city
FROM client
WHERE firstname='Mary' 
AND lastname='Nelson';
GO


--5
DROP PROC IF EXISTS Question6;
GO
CREATE PROCEDURE Question6
AS
SELECT firstname, lastname, city, balance
FROM client
WHERE city='Dunedin' AND balance < '200';
GO


--6
DROP PROC IF EXISTS Question7;
GO
CREATE PROCEDURE Question7
AS
SELECT custref, creditlimit, balance
FROM client;
GO


--7
DROP PROC IF EXISTS Question8;
GO
CREATE PROCEDURE Question8
AS
SELECT orderref, partref, quantity, quotedprice
FROM orderline;
GO


--8
DROP PROC IF EXISTS Question9;
GO
CREATE PROCEDURE Question9
AS
SELECT orderref, orderdate
FROM custorder
WHERE orderdate >'1999-06-01';
GO


--9
DROP PROC IF EXISTS Question10;
GO
CREATE PROCEDURE Question10
AS
SELECT city, SUM(DISTINCT custref) AS [Number in each city]
FROM client
WHERE city >'3'
GROUP BY city, custref;
GO


--10
DROP PROC IF EXISTS Question11;
GO
CREATE PROCEDURE Question11
AS
SELECT SUM(DISTINCT repref) AS [repref], SUM(DISTINCT balance) AS [Total Balance]
FROM client
GROUP BY repref, balance;
GO


--11
DROP PROC IF EXISTS Question12;
GO
CREATE PROCEDURE Question12
AS
SELECT city, MAX(DISTINCT balance) AS [Maximum Balance]
FROM client
GROUP BY city, balance;
GO


--12
DROP PROC IF EXISTS Question13;
GO
CREATE PROCEDURE Question13
AS
SELECT firstname, lastname, repfirstname, replastname
FROM client, rep;
GO


--13
DROP PROC IF EXISTS Question14;
GO
CREATE PROCEDURE Question14
AS
SELECT orderref, firstname, lastname, orderdate
FROM client, custorder;
GO


--14
DROP PROC IF EXISTS Question15;
GO
CREATE PROCEDURE Question15
AS
SELECT orderref, description, onhand
FROM orderline, part
WHERE orderref='1007';
GO


--15
DROP PROC IF EXISTS Question16;
GO
CREATE PROCEDURE Question16
AS
SELECT description, quotedprice, quantity
FROM orderline, part
ORDER BY description;
GO


--16
DROP PROC IF EXISTS Question17;
GO
CREATE PROCEDURE Question17
AS
SELECT orderref, quotedprice, description, onhand
FROM orderline, part
WHERE quotedPrice >'200';
GO


--17
DROP PROC IF EXISTS Question18;
GO
CREATE PROCEDURE Question18
AS
SELECT orderline.orderref, orderdate, firstname, lastname, description, unitPrice
FROM orderline, part, client, custorder;
GO


--18
DROP PROC IF EXISTS Question19;
GO
CREATE PROCEDURE Question19
AS
SELECT orderline.orderref, orderdate, firstname, lastname, description, unitPrice
FROM orderline, part, client, custorder
WHERE orderdate >'1999-06-10';
GO


--19
DROP PROC IF EXISTS Question20;
GO
CREATE PROCEDURE Question20
AS
SELECT orderline.orderref, orderdate, firstname, lastname, repfirstname, replastname, description, unitPrice
FROM orderline, part, client, rep, custorder
WHERE orderdate >'1999-06-10';
GO


--20
DROP PROC IF EXISTS Question21;
GO
CREATE PROCEDURE Question21
AS
SELECT repfirstname, replastname , balance
FROM rep, client;
GO


--21
DROP PROC IF EXISTS Question22;
GO
CREATE PROCEDURE Question22
AS
SELECT orderref, SUM(unitPrice) AS [Total Linetotal]
FROM orderline, part
group by orderref, unitPrice;
GO

 
