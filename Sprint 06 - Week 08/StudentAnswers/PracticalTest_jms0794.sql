USE NORTHWND;
GO

-- 2
DROP PROC IF EXISTS Question2;
GO
CREATE PROCEDURE Question2
AS
SELECT
	FirstName + ' ' + LastName AS 'Employee Name',
	Address,
	City,
	Region
FROM Employees;
GO

-- 3
DROP PROC IF EXISTS Question3;
GO
CREATE PROCEDURE Question3
AS
SELECT
	FirstName + ' ' + LastName AS 'Employee Name',
	Address,
	City,
	Region,
	Country
FROM Employees
WHERE Country = 'USA';
GO

-- 4.
DROP PROC IF EXISTS Question4;
GO
CREATE PROCEDURE Question4
AS
SELECT
	e.FirstName + ' ' + e.LastName AS 'Employee Name',
	e.Address,
	e.City,
	e.Region,
	e.Country,
	o.ShipCountry
FROM Employees e
INNER JOIN Orders o ON e.EmployeeID=o.EmployeeID
WHERE o.ShipCountry = 'Belgium';
GO

-- 5.
DROP PROC IF EXISTS Question5;
GO
CREATE PROCEDURE Question5
AS
SELECT
	FirstName,
	LastName,
	City,
	HireDate
FROM Employees
WHERE 
	FirstName LIKE 'M%'
	AND
	LastName LIKE 'S%';
GO

-- 6.
DROP PROC IF EXISTS Question6;
GO
CREATE PROCEDURE Question6
AS
SELECT
	e.FirstName + ' ' + e.LastName AS 'Employee Name',
	c.CompanyName,
	s.CompanyName,
	c.City
FROM Employees e
INNER JOIN Orders o ON e.EmployeeID=o.EmployeeID
INNER JOIN Customers c ON o.CustomerID=c.CustomerID
INNER JOIN Shippers s ON o.ShipVia=s.ShipperID
WHERE 
	c.City = 'Bruxelles'
	AND
	s.CompanyName = 'Speedy Express';
GO

-- 7.
DROP PROC IF EXISTS Question7;
GO
CREATE PROCEDURE Question7
AS
SELECT DISTINCT
	e.Title,
	e.FirstName + ' ' + e.LastName AS 'Employee Name'
FROM Employees e
INNER JOIN Orders o ON e.EmployeeID=o.EmployeeID
INNER JOIN [dbo].[Order Details] od ON o.OrderID=od.OrderID
INNER JOIN Products p ON od.ProductID=p.ProductID
WHERE 
	ProductName = 'Gravad Lax' 
	OR 
	ProductName = 'Mishi Kobe Niku';
GO

-- 8.
DROP PROC IF EXISTS Question8;
GO
CREATE PROCEDURE Question8
AS
SELECT DISTINCT
	e.FirstName + ' ' + e.LastName AS 'Employee Name',
	e.City
FROM Employees e
INNER JOIN Orders o ON e.EmployeeID=o.EmployeeID
INNER JOIN Customers c ON o.CustomerID=c.CustomerID
WHERE e.City = c.City;
GO

/*-- Verification that Janet shouldn�t be on this list:
SELECT * FROM Employees WHERE FirstName = 'Janet'

SELECT 
	o.EmployeeID,
	c.*
FROM Employees e
INNER JOIN Orders o ON e.EmployeeID=o.EmployeeID
INNER JOIN Customers c ON o.CustomerID=c.CustomerID
WHERE o.EmployeeID = 3
ORDER BY c.City*/

-- 9.
DROP PROC IF EXISTS Question9;
GO
CREATE PROCEDURE Question9
AS
SELECT
	FirstName + ' ' + LastName AS 'Employee Name',
	Address,
	City,
	Region,
	YEAR(BirthDate) AS 'BirthDate',
	DATEDIFF(year, BirthDate, GETDATE()) AS 'Age'
FROM Employees
WHERE DATEDIFF(year, BirthDate, GETDATE()) > 60
ORDER BY DATEDIFF(year, BirthDate, GETDATE());
GO

-- 10.
DROP PROC IF EXISTS Question10;
GO
CREATE PROCEDURE Question10
AS
SELECT DISTINCT
	e.FirstName + ' ' + e.LastName AS 'Employee Name',
	p.ProductName
FROM Employees e
INNER JOIN Orders o ON e.EmployeeID=o.EmployeeID
INNER JOIN [dbo].[Order Details] od ON o.OrderID=od.OrderID
INNER JOIN Products p ON od.ProductID=p.ProductID
WHERE 
	p.ProductName = 'Chai' ;
GO

-- 11.
DROP PROC IF EXISTS Question11;
GO
CREATE PROCEDURE Question11
AS
SELECT
	s.SupplierID,
	s.CompanyName,
	COUNT(p.ProductName) AS 'No. of Products'
FROM Products p
INNER JOIN Suppliers s ON p.SupplierID=s.SupplierID
GROUP BY s.SupplierID, s.CompanyName
HAVING COUNT(p.ProductName) > 3;
GO

-- 12.
DROP PROC IF EXISTS Question12;
GO
CREATE PROCEDURE Question12
AS
SELECT
	COUNT(Country) AS 'Customer Num',
	Country
FROM Customers
GROUP BY Country
HAVING COUNT(Country) > 5
ORDER BY COUNT(Country) DESC;
GO

-- 13.
DROP PROC IF EXISTS Question13;
GO
CREATE PROCEDURE Question13
AS
SELECT 
	c.CompanyName,
	COUNT(o.CustomerID) AS 'No. of Purchases'
FROM  Orders o
INNER JOIN Customers c ON o.CustomerID=c.CustomerID
GROUP BY c.CompanyName
HAVING COUNT(o.CustomerID) > 10
ORDER BY c.CompanyName;
GO


--SELECT * FROM Orders ORDER BY CustomerID

-- 14.
DROP PROC IF EXISTS Question14;
GO
CREATE PROCEDURE Question14
AS
SELECT
	ProductName,
	CategoryID,
	UnitPrice,
	UnitsInStock,
	SUM(UnitPrice * UnitsInStock) AS 'Total Value'
FROM Products
GROUP BY	
	ProductName,
	CategoryID,
	UnitPrice,
	UnitsInStock
ORDER BY CategoryID;
GO

-- 15.
DROP PROC IF EXISTS Question15;
GO
CREATE PROCEDURE Question15
AS
SELECT
	c.CategoryName,
	p.ProductName,
	s.CompanyName
FROM Products p
INNER JOIN Suppliers s ON p.SupplierID=s.SupplierID
INNER JOIN Categories c ON p.CategoryID=c.CategoryID
WHERE c.CategoryName = 'Condiments';
GO

-- 16.
DROP PROC IF EXISTS Question16;
GO
CREATE PROCEDURE Question16
AS
SELECT
	c.CompanyName,
	COUNT(o.CustomerID) AS 'No. of Orders Placed'
FROM  Orders o
INNER JOIN Customers c ON o.CustomerID=c.CustomerID
GROUP BY c.CompanyName;
GO

-- 17.
DROP PROC IF EXISTS Question17;
GO
CREATE PROCEDURE Question17
AS
SELECT
	ProductName,
	UnitsOnOrder,
	UnitsInStock
FROM Products
WHERE UnitsInStock < UnitsOnOrder;
GO

-- 18.
DROP PROC IF EXISTS Question18;
GO
CREATE PROCEDURE Question18
AS
SELECT
	c.CategoryName,
	AVG(p.UnitPrice)
FROM Products p
INNER JOIN Categories c ON p.CategoryID=c.CategoryID
GROUP BY c.CategoryName;
GO

-- 19.
DROP PROC IF EXISTS Question19;
GO
CREATE PROCEDURE Question19
AS
SELECT
	FirstName + ' ' + LastName AS 'Employee Name',
	City
FROM Employees
WHERE 
	City LIKE 'S%'
	OR
	City LIKE 'T%';
GO
