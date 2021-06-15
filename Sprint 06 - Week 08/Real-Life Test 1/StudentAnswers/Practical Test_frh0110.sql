--1
USE [NORTHWND];
GO

--2
DROP PROC IF EXISTS Question2;
GO
CREATE PROCEDURE Question2
AS
SELECT
	FirstName,
	LastName,
	Address,
	City,
	Region
FROM Employees;
GO

--3
DROP PROC IF EXISTS Question3;
GO
CREATE PROCEDURE Question3
AS
SELECT
	FirstName,
	LastName,
	Address,
	City,
	Region,
	Country
FROM Employees
WHERE Country = 'USA';
GO

--4
DROP PROC IF EXISTS Question4;
GO
CREATE PROCEDURE Question4
AS
SELECT
	Employees.FirstName,
	Employees.LastName,
	Employees.Address,
	Employees.City,
	Employees.Region,
	Orders.ShipCountry
FROM Employees
INNER JOIN Orders ON Orders.EmployeeID = Employees.EmployeeID
WHERE Orders.ShipCountry = 'Belgium';
GO

--5
DROP PROC IF EXISTS Question5;
GO
CREATE PROCEDURE Question5
AS
SELECT
	FirstName,
	LastName,
	Address,
	City,
	HireDate
FROM Employees
WHERE LastName LIKE 'S%' AND FirstName LIKE 'M%';
GO

--6
DROP PROC IF EXISTS Question6;
GO
CREATE PROCEDURE Question6
AS
SELECT
	Employees.FirstName,
	Employees.LastName,
	Customers.CompanyName,
	Shippers.CompanyName
FROM Employees
INNER JOIN Orders ON Orders.EmployeeID = Employees.EmployeeID
INNER JOIN Shippers ON Shippers.ShipperID = [Orders].ShipVia
INNER JOIN Customers ON Orders.[CustomerID] = Customers.CustomerID
WHERE Shippers.CompanyName = 'Speedy Express' AND Customers.City = 'Bruxelles';
GO

--7 ---------------
DROP PROC IF EXISTS Question7;
GO
CREATE PROCEDURE Question7
AS
SELECT
	Employees.Title,
	Employees.FirstName,
	Employees.LastName
FROM (SELECT Orders.OrderID from orders
	INNER JOIN [Order Details] ON [Order Details].OrderID = Orders.OrderID
	INNER JOIN Products ON Products.ProductID = [Order Details].ProductID
	WHERE ProductName = 'Gravad Lax' OR ProductName = 'Mishi Kobe Niku') as pgm,
	Employees
INNER JOIN Orders ON Orders.EmployeeID = Employees.EmployeeID
INNER JOIN [Order Details] ON [Order Details].OrderID = Orders.OrderID
INNER JOIN Products ON Products.ProductID = [Order Details].ProductID
GROUP BY Employees.Title,
	Employees.FirstName,
	Employees.LastName
HAVING count(pgm.OrderID) > 1;
GO


--8
DROP PROC IF EXISTS Question8;
GO
CREATE PROCEDURE Question8
AS
SELECT DISTINCT
	Employees.FirstName,
	Employees.LastName,
	Employees.City
FROM Employees
INNER JOIN Orders ON Orders.EmployeeID = Employees.EmployeeID
INNER JOIN [Order Details] ON [Order Details].OrderID = Orders.OrderID
INNER JOIN Products ON Products.ProductID = [Order Details].ProductID
INNER JOIN Customers ON Orders.CustomerID = Customers.CustomerID
WHERE Customers.City = Employees.City;
select * from employees where FirstName = 'janet';
select * from Customers where City = 'Kirkland';
GO

--9
DROP PROC IF EXISTS Question9;
GO
CREATE PROCEDURE Question9
AS
SELECT
	FirstName,
	LastName,
	Address,
	City,
	Region,
	BirthDate,
	DATEDIFF(year,BirthDate,GETDATE()) AS 'AGE'
FROM Employees
WHERE DATEDIFF(year,BirthDate,GETDATE()) > 60
ORDER BY DATEDIFF(year,BirthDate,GETDATE());
GO

--10
DROP PROC IF EXISTS Question10;
GO
CREATE PROCEDURE Question10
AS
SELECT DISTINCT
	Employees.FirstName,
	Employees.LastName,
	Products.ProductName
FROM Employees
INNER JOIN Orders ON Orders.EmployeeID = Employees.EmployeeID
INNER JOIN [Order Details] ON [Order Details].OrderID = Orders.OrderID
INNER JOIN Products ON Products.ProductID = [Order Details].ProductID
WHERE ProductName = 'Chai';
GO

--11
DROP PROC IF EXISTS Question11;
GO
CREATE PROCEDURE Question11
AS
SELECT
	Suppliers.SupplierID,
	Suppliers.CompanyName,
	COUNT(Products.ProductID) AS 'No. of Products'
FROM Suppliers
INNER JOIN Products ON Suppliers.SupplierID = Products.SupplierID

GROUP BY Suppliers.SupplierID,Suppliers.CompanyName
HAVING COUNT(Products.ProductID) > 3;
GO

--12
DROP PROC IF EXISTS Question12;
GO
CREATE PROCEDURE Question12
AS
SELECT
	count(CustomerID) AS 'Cusotmer Num',
	Country
FROM Customers
GROUP BY Country
HAVING count(CustomerID) > 5
ORDER BY count(CustomerID) DESC;
GO

--13
DROP PROC IF EXISTS Question13;
GO
CREATE PROCEDURE Question13
AS
SELECT
	Customers.CompanyName,
	COUNT(Orders.OrderID) AS '# OF PURCHASES'
FROM Customers
INNER JOIN Orders ON Orders.CustomerID = Customers.CustomerID
GROUP BY Customers.CompanyName
HAVING COUNT(Orders.OrderID) > 10;
GO

--14
DROP PROC IF EXISTS Question14;
GO
CREATE PROCEDURE Question14
AS
SELECT
	ProductName,
	CategoryID,
	UnitPrice,
	UnitsInStock,
	SUM(UnitPrice * UnitsInStock) 'Total Value'
FROM Products
GROUP BY ProductName,CategoryID,UnitPrice,UnitsInStock;
GO

--15
DROP PROC IF EXISTS Question15;
GO
CREATE PROCEDURE Question15
AS
SELECT
	Categories.CategoryName,
	Products.ProductName,
	Suppliers.CompanyName
FROM Categories
INNER JOIN Products ON Products.CategoryID = Categories.CategoryID
INNER JOIN Suppliers ON Suppliers.SupplierID = Products.SupplierID
WHERE Categories.CategoryName = 'Condiments';
GO
	
--16
DROP PROC IF EXISTS Question16;
GO
CREATE PROCEDURE Question16
AS
SELECT
	Customers.CompanyName,
	COUNT(orders.OrderID) AS '# of Orders Placed'
FROM Customers
INNER JOIN Orders ON Orders.CustomerID = Customers.CustomerID
GROUP BY Customers.CompanyName;
GO

--17
DROP PROC IF EXISTS Question17;
GO
CREATE PROCEDURE Question17
AS
SELECT 
	Products.ProductName,
	Products.UnitsOnOrder,
	Products.UnitsInStock
FROM products
WHERE UnitsInStock < UnitsOnOrder;
GO

--18
DROP PROC IF EXISTS Question18;
GO
CREATE PROCEDURE Question18
AS
SELECT
	Categories.CategoryName,
	AVG(Products.UnitPrice)
from Categories
INNER JOIN Products ON Products.CategoryID = Categories.CategoryID
GROUP BY Categories.CategoryName;
GO

--19
DROP PROC IF EXISTS Question19;
GO
CREATE PROCEDURE Question19
AS
SELECT
	CONCAT(FirstName,' ',LastName) AS 'Employee Name',
	City
FROM Employees
WHERE City LIKE 'S%' OR City LIKE 'T%';
GO