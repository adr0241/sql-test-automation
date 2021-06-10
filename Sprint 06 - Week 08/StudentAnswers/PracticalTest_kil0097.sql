USE NORTHWND;
GO

/*SELECT * FROM Employees
SELECT * FROM Orders*/

-- Query 1
DROP PROC IF EXISTS Question2;
GO
CREATE PROCEDURE Question2
AS
SELECT CONCAT(FirstName, ' ',LastName) AS 'Name', Address, City, Region
FROM Employees;
GO


-- Querry 2
DROP PROC IF EXISTS Question3;
GO
CREATE PROCEDURE Question3
AS
SELECT CONCAT(FirstName, ' ',LastName) AS 'Name', Address, City, Region
FROM Employees
WHERE Country = 'USA';
GO


-- Querry 3
DROP PROC IF EXISTS Question4;
GO
CREATE PROCEDURE Question4
AS
SELECT CONCAT(FirstName, ' ',LastName) AS 'Name', Address, City, Region, ShipCountry
FROM Employees
INNER JOIN Orders ON Employees.EmployeeID = Orders.EmployeeID
WHERE ShipCountry = 'Belgium';
GO

-- Querry 4
DROP PROC IF EXISTS Question5;
GO
CREATE PROCEDURE Question5
AS
SELECT FirstName, LastName, City, HireDate
FROM Employees
WHERE FirstName LIKE 'M%' AND LastName LIKE 'S%';
GO

-- Querry 5
DROP PROC IF EXISTS Question6;
GO
CREATE PROCEDURE Question6
AS
SELECT FirstName, LastName, Customers.CompanyName, Shippers.CompanyName
FROM Employees
INNER JOIN Orders ON Orders.EmployeeID = Employees.EmployeeID
INNER JOIN Customers ON Customers.CustomerID = Orders.CustomerID
INNER JOIN Shippers ON Shippers.ShipperID = Orders.ShipVia
WHERE Customers.City = 'Bruxelles' AND Shippers.CompanyName = 'Speedy Express';
GO


--Query 6
DROP PROC IF EXISTS Question7;
GO
CREATE PROCEDURE Question7
AS
SELECT DISTINCT Title, FirstName, LastName
FROM Employees
INNER JOIN Orders ON Orders.EmployeeID = Employees.EmployeeID
INNER JOIN [Order Details] ON [Order Details].OrderID = Orders.OrderID
INNER JOIN Products On Products.ProductID = [Order Details].ProductID
WHERE ProductName = 'Gravad Lax' OR ProductName = 'Mishi Kobe Niku';
GO

--Querry 7
DROP PROC IF EXISTS Question8;
GO
CREATE PROCEDURE Question8
AS
SELECT FirstName, LastName, Employees.City
FROM Employees
INNER JOIN Orders ON Orders.EmployeeID = Employees.EmployeeID
INNER JOIN Customers ON Orders.CustomerID = Customers.CustomerID
WHERE Employees.City = Customers.City;
GO

--Querry 8
DROP PROC IF EXISTS Question9;
GO
CREATE PROCEDURE Question9
AS
SELECT FirstName, LastName, Address, City, Region, BirthDate
FROM Employees
WHERE BirthDate < '1961';
GO

-- Query 9
DROP PROC IF EXISTS Question10;
GO
CREATE PROCEDURE Question10
AS
SELECT DISTINCT FirstName, LastName, ProductName
FROM Employees
INNER JOIN Orders ON Orders.EmployeeID = Employees.EmployeeID
INNER JOIN [Order Details] ON [Order Details].OrderID = Orders.OrderID
INNER JOIN Products On Products.ProductID = [Order Details].ProductID
WHERE ProductName = 'Chai';
GO

-- Query 10
DROP PROC IF EXISTS Question11;
GO
CREATE PROCEDURE Question11
AS
SELECT Suppliers.SupplierID, CompanyName, Count(CompanyName) AS 'NoOfProducts'
FROM Suppliers
INNER JOIN Products ON Products.SupplierID = Suppliers.SupplierID
INNER JOIN [Order Details] ON [Order Details].ProductID = Products.ProductID
GROUP BY CompanyName, Suppliers.SupplierID
SELECT * FROM CPN
WHERE NoOfProducts > '3';
GO


-- Query 11
DROP PROC IF EXISTS Question12;
GO
CREATE PROCEDURE Question12
AS
SELECT Country, COUNT(ContactName) AS 'NumberOfCustomers'
FROM Customers
GROUP BY Country
SELECT * FROM NOCIC
WHERE NumberOfCustomers > 5
ORDER BY NumberOfCustomers DESC;
GO


--Query 12
DROP PROC IF EXISTS Question13;
GO
CREATE PROCEDURE Question13
AS
SELECT ContactName, COUNT(CustomerID) AS 'NoOfPurchase'
FROM Customers
GROUP BY ContactName;
GO


--Query 13
DROP PROC IF EXISTS Question14;
GO
CREATE PROCEDURE Question14
AS
SELECT ProductName, CategoryID, UnitPrice, UnitsInStock, UnitsInStock*UnitPrice AS 'TotalValue'
FROM Products;
GO

-- Query 15
DROP PROC IF EXISTS Question16;
GO
CREATE PROCEDURE Question16
AS
SELECT ContactName, COUNT(OrderID)AS NoOfOrders
FROM Customers
INNER JOIN Orders ON Customers.CustomerID = Orders.CustomerID
GROUP BY ContactName;
GO

DROP PROC IF EXISTS Question15;
GO
DROP PROC IF EXISTS Question19;
GO

--Query 16
DROP PROC IF EXISTS Question17;
GO
CREATE PROCEDURE Question17
AS
SELECT ProductName, UnitsOnOrder, UnitsInStock
FROM Products
WHERE UnitsOnOrder > UnitsInStock;
GO

--Query 17
DROP PROC IF EXISTS Question18;
GO
CREATE PROCEDURE Question18
AS
SELECT CategoryName, AVG(UnitPrice) AS 'AVERAGE PRICE'
FROM Categories
INNER JOIN Products ON Products.CategoryID = Categories.CategoryID
GROUP BY CategoryName;
GO

--Query 18