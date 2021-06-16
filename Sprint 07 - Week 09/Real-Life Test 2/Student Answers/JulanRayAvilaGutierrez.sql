USE clientorders;
GO

--2. List only those clients that live in Dunedin.
-- (Mark 1)
DROP PROC IF EXISTS Question2;
GO
CREATE PROCEDURE Question2
AS
SELECT 
	firstname, 
	lastname, 
	city
FROM client
WHERE city = 'Dunedin';
GO


--3. List the clients whose last name begins with the letter J.
-- (Marks 1)
DROP PROC IF EXISTS Question3;
GO
CREATE PROCEDURE Question3
AS
SELECT 
	firstname, 
	lastname
FROM client
WHERE lastname LIKE 'J%';
GO



--4. Which clients have a balance between $50 and $150?
--(Marks 1)
DROP PROC IF EXISTS Question4;
GO
CREATE PROCEDURE Question4
AS
SELECT 
	firstname, 
	lastname, 
	balance
FROM client
WHERE balance BETWEEN 50 and 150;
GO

--5. What city does our client Mary Nelson live in? (Marks 2)
DROP PROC IF EXISTS Question5;
GO
CREATE PROCEDURE Question5
AS
SELECT 
	firstname, 
	lastname, 
	city
FROM client
WHERE firstname + ' ' + lastname = 'Mary Nelson';
GO

--6. Which clients have a balance below $200 and live in Dunedin?
--(Marks 2)
DROP PROC IF EXISTS Question6;
GO
CREATE PROCEDURE Question6
AS
SELECT 
	firstname, 
	lastname, 
	balance, 
	city
FROM client
WHERE balance < 200
AND city = 'Dunedin';
GO

--7. What is the difference between the clients limit and their current balance for
--each client? (Hint: calculate the limit field minus the balance field). Name the
--field you create NewBalance.
--(Marks 3)
DROP PROC IF EXISTS Question7;
GO
CREATE PROCEDURE Question7
AS
SELECT 
	creditlimit, 
	balance, 
	creditlimit - balance AS NewBlanace
FROM client;
GO


--8. What is the total price for each line of the order? (Hint: multiply the quantity by
--the quotedprice) Name the new field LineTotal.
--(Marks 2)
DROP PROC IF EXISTS Question8;
GO
CREATE PROCEDURE Question8
AS
SELECT
	*, 
	quantity * quotedPrice AS LineTotal
FROM orderline;
GO


--9. Which client orders (Custorder) were place after 1/6/99?
--(Marks 2)
DROP PROC IF EXISTS Question9;
GO
CREATE PROCEDURE Question9
AS
SELECT 
	orderref,
	orderdate
FROM custorder
WHERE orderdate > '1999-6-1';
GO


--10. How many clients live in each city where the number of clients is more than 3?
--(Marks 3)
DROP PROC IF EXISTS Question10;
GO
CREATE PROCEDURE Question10
AS
SELECT 
	city, 
	COUNT(*) AS NumClients
FROM client
GROUP BY City
HAVING COUNT(*) > 3; 
GO

--11. What is the total balance for each sales rep? (Marks 2)
DROP PROC IF EXISTS Question11;
GO
CREATE PROCEDURE Question11
AS
SELECT
	repref, 
	SUM(balance) AS  repBalance
FROM client
GROUP BY repref;
GO

--12. What is the maximum balance for each city? (Marks 2)
DROP PROC IF EXISTS Question12;
GO
CREATE PROCEDURE Question12
AS
SELECT city, MAX(balance) AS MaxBalance
FROM client
GROUP BY city;
GO

--13. List all of our clients and their client representatives (repref). Display the client
--name as one field, and the rep name as one field. (Marks 3)
DROP PROC IF EXISTS Question13;
GO
CREATE PROCEDURE Question13
AS
SELECT 
	firstname + ' ' + lastname AS ClientName,
	RepFirstname + ' ' + RepLastName AS RepName
FROM client C JOIN rep R 
ON C.repref = R.repref;
GO

--14. List the first and last name of the clients next to their customer order
--(custorder) and include the date of the customers order.
--(Marks 2)
DROP PROC IF EXISTS Question14;
GO
CREATE PROCEDURE Question14
AS
SELECT 
	orderref,
	firstname,
	lastname,
	orderdate
FROM client C join custorder CO
ON C.custref = CO.custref;
GO

--15. What are the descriptions and amount on hand of the parts that appear on
--orderline 1007. Show only the records for 1007 in your answer?
--(Marks 2)
DROP PROC IF EXISTS Question15;
GO
CREATE PROCEDURE Question15
AS
SELECT
	orderref, 
	description,
	onHand
FROM part P JOIN orderline O
ON P.partref = O.partref
WHERE orderref = 1007;
GO

--16. List the description of the parts and their quoted price and quantity on each
--orderline. Sort by description.
--(Marks 3)
DROP PROC IF EXISTS Question16;
GO
CREATE PROCEDURE Question16
AS
SELECT
	orderref, 
	description,
	quotedPrice,
	quantity
FROM part P JOIN orderline O
ON P.partref = O.partref
ORDER BY description;
GO

--17. List the description of the parts and their quoted price and quantity on each
--orderline. Only display the records that have a quoted price over 200.
--(Marks 3)
DROP PROC IF EXISTS Question17;
GO
CREATE PROCEDURE Question17
AS
SELECT 
	orderref,
	description,
	quotedPrice,
	quantity
FROM part P JOIN orderline O
ON P.partref = O.partref
WHERE quotedPrice > 200;
GO

--18. List all orders (order ref, order date), the client name for those orders, and all
--part descriptions and unit prices. (Marks 3)
DROP PROC IF EXISTS Question18;
GO
CREATE PROCEDURE Question18
AS
SELECT
	CO.orderref,
	orderdate,
	firstname,
	lastname,
	description,
	unitPrice
FROM custorder CO JOIN client C
ON CO.custref = C.custref
JOIN orderline O
ON  O.orderref = CO.orderref
JOIN part P
ON P.partref = O.partref;
GO

--19. List all orders (order ref, order date), the client name for those orders, and all
--part descriptions and unit prices. Display only the records where the order
--date is after 10/6/99. (Marks 3)
DROP PROC IF EXISTS Question19;
GO
CREATE PROCEDURE Question19
AS
SELECT
	CO.orderref,
	orderdate,
	firstname,
	lastname,
	description,
	unitPrice
FROM custorder CO JOIN client C
ON CO.custref = C.custref
JOIN orderline O
ON  O.orderref = CO.orderref
JOIN part P
ON P.partref = O.partref
WHERE orderdate > '1999-6-10';
GO


--20. List all orders (order ref, order date), the client name for those orders, the rep’s
--name, and all part descriptions. (Marks 3)
DROP PROC IF EXISTS Question20;
GO
CREATE PROCEDURE Question20
AS
SELECT 
	CO.orderref,
	orderdate,
	firstname + ' ' + lastname AS ClientName,
	RepFirstname + ' ' + RepLastName AS RepName,
	description
FROM custorder CO JOIN client C
ON CO.custref = C.custref
JOIN rep R
ON R.repref = C.repref
JOIN orderline O
ON  O.orderref = CO.orderref
JOIN part P
ON P.partref = O.partref;
GO

--21. What is the total balance for each sales rep. Display the rep name as one
--field. (Marks 3)
DROP PROC IF EXISTS Question21;
GO
CREATE PROCEDURE Question21
AS
SELECT 
	RepFirstname + ' ' + RepLastName AS repName,
	SUM(balance) AS repBalance 
FROM rep R
JOIN client C
ON R.repref = C.repref
GROUP BY RepFirstname, RepLastName;
GO

--22. Using the answer from Question 8, now display the total linetotal (sum of
--linetotal) for each Order (orderref). (Marks 3)
DROP PROC IF EXISTS Question22;
GO
CREATE PROCEDURE Question22
AS
SELECT 
	orderref,
	SUM(quantity * quotedPrice) AS LineTotal
	FROM orderline
GROUP BY orderref;
GO