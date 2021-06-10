-- Andy Proud
-- BCDE103 Practical Test
-- 02/06/21

-- USEFUL CODE

USE [NORTHWND];
GO

/*SELECT * FROM [dbo].[Categories]
SELECT * FROM [dbo].[CustomerDemographics]
SELECT * FROM [dbo].[Customers] WHERE City = 'kirkland'
SELECT * FROM [dbo].[Employees] WHERE FirstName = 'Janet'
SELECT * FROM [dbo].[EmployeeTerritories]
SELECT * FROM [dbo].[Order Details]
SELECT * FROM [dbo].[Orders] WHERE CustomerID = 'TRAIH'
SELECT * FROM [dbo].[Products]
SELECT * FROM [dbo].[Region]
SELECT * FROM [dbo].[Shippers]
SELECT * FROM [dbo].[Suppliers]
SELECT * FROM [dbo].[Territories]*/

-- Q2
DROP PROC IF EXISTS Question2;
GO
CREATE PROCEDURE Question2
AS
SELECT FirstName + ' ' + LastName AS [Employee Name], Address, Region
FROM Employees;
GO

-- Q3
DROP PROC IF EXISTS Question3;
GO
CREATE PROCEDURE Question3
AS
SELECT FirstName + ' ' + LastName AS [Employee Name], Address, Region
FROM Employees
WHERE Country = 'USA';
GO

-- Q4
DROP PROC IF EXISTS Question4;
GO
CREATE PROCEDURE Question4
AS
SELECT FirstName + ' ' + LastName AS [Employee Name], Address, Region, ShipCountry
FROM Orders
INNER JOIN Employees ON Orders.EmployeeID = Employees.EmployeeID
WHERE ShipCountry = 'Belgium';
GO

-- Q5
DROP PROC IF EXISTS Question5;
GO
CREATE PROCEDURE Question5
AS
SELECT FirstName, LastName, City, HireDate
FROM Employees
WHERE LastName LIKE 'S%' AND FirstName LIKE 'M%';
GO

-- Q6
DROP PROC IF EXISTS Question6;
GO
CREATE PROCEDURE Question6
AS
SELECT FirstName + ' ' + LastName AS [Employee Name], Customers.CompanyName AS [Customer Name], Shippers.CompanyName AS [Shipper Name]
FROM Employees
INNER JOIN Orders ON Orders.EmployeeID = Employees.EmployeeID
INNER JOIN Customers ON Customers.CustomerID = Orders.CustomerID
INNER JOIN Shippers ON Shippers.ShipperID = Orders.ShipVia
WHERE Shippers.CompanyName = 'Speedy Express' AND Customers.City = 'Bruxelles';
GO

-- Q7
DROP PROC IF EXISTS Question7;
GO
CREATE PROCEDURE Question7
AS
SELECT DISTINCT Title, FirstName + ' ' + LastName AS [Employee Name] FROM Employees
INNER JOIN Orders ON Employees.EmployeeID = Orders.EmployeeID
INNER JOIN [Order Details] ON [Order Details].OrderID = Orders.OrderID
INNER JOIN Products ON Products.ProductID = [Order Details].ProductID
WHERE ProductName IN ('Gravad Lax', 'Mishi Kobe Niku');
GO

-- Q8
DROP PROC IF EXISTS Question8;
GO
CREATE PROCEDURE Question8
AS
SELECT DISTINCT Employees.FirstName + ' ' + Employees.LastName AS [Employee Name], Employees.City
FROM Employees
INNER JOIN Orders ON Orders.EmployeeID = Employees.EmployeeID
INNER JOIN Customers ON Customers.CustomerID = Orders.CustomerID
WHERE Employees.City = Customers.City;
GO

-- Q9
DROP PROC IF EXISTS Question9;
GO
CREATE PROCEDURE Question9
AS
SELECT Employees.FirstName + ' ' + Employees.LastName AS [Employee Name], Address, City, Region, DATEPART(YEAR, BirthDate) AS [Birth Year] , DATEDIFF(YEAR, BirthDate, SYSDATETIME()) AS [Age]
FROM Employees WHERE DATEDIFF(YEAR, BirthDate, SYSDATETIME()) > 60;
GO

-- Q10
DROP PROC IF EXISTS Question10;
GO
CREATE PROCEDURE Question10
AS
SELECT DISTINCT Employees.FirstName + ' ' + Employees.LastName AS [Employee Name], Products.ProductName
FROM Employees
INNER JOIN Orders ON Orders.EmployeeID = Employees.EmployeeID
INNER JOIN [Order Details] ON [Order Details].OrderID = Orders.OrderID
INNER JOIN Products ON [Order Details].ProductID = Products.ProductID
WHERE Products.ProductName = 'Chai';
GO

-- Q11
DROP PROC IF EXISTS Question11;
GO
CREATE PROCEDURE Question11
AS
SELECT DISTINCT Products.SupplierID, Suppliers.CompanyName, COUNT(ProductID) AS [No. of Products]
FROM Products
INNER JOIN Suppliers ON Products.SupplierID = Suppliers.SupplierID
GROUP BY Products.SupplierID, Suppliers.CompanyName
HAVING COUNT(ProductID)  > 3;
GO

-- Q12
DROP PROC IF EXISTS Question12;
GO
CREATE PROCEDURE Question12
AS
SELECT Country, COUNT(CustomerID) AS [No. of Customers]
FROM Customers
GROUP BY Country
HAVING COUNT(CustomerID) > 5;
GO


-- Q13
DROP PROC IF EXISTS Question13;
GO
CREATE PROCEDURE Question13
AS
SELECT CustomerID, COUNT(customerid)
FROM Orders
GROUP BY customerid
HAVING COUNT(customerid) > 10;
GO

-- Q14
DROP PROC IF EXISTS Question14;
GO
CREATE PROCEDURE Question14
AS
SELECT ProductName, CategoryID, UnitPrice, UnitsInStock, SUM(UnitPrice * UnitsInStock) AS [Total Value]
FROM Products
GROUP BY ProductID, ProductName, CategoryID, UnitPrice, UnitsInStock;
GO

-- Q15
DROP PROC IF EXISTS Question15;
GO
CREATE PROCEDURE Question15
AS
SELECT CategoryName, ProductName, CompanyName FROM Products
INNER JOIN Categories ON Categories.CategoryID = Products.CategoryID
INNER JOIN Suppliers ON Suppliers.SupplierID = Products.SupplierID
WHERE CategoryName = 'Condiments';
GO

-- Q16
DROP PROC IF EXISTS Question16;
GO
CREATE PROCEDURE Question16
AS
SELECT CompanyName, COUNT(OrderID) AS [No. of Orders]
FROM Customers
INNER JOIN Orders on Orders.CustomerID = Customers.CustomerID
GROUP BY CompanyName;
GO

-- Q17
DROP PROC IF EXISTS Question17;
GO
CREATE PROCEDURE Question17
AS
SELECT ProductName, UnitsOnOrder, UnitsInStock
FROM Products
WHERE UnitsInStock < UnitsOnOrder;
GO

-- Q18
DROP PROC IF EXISTS Question18;
GO
CREATE PROCEDURE Question18
AS
SELECT Categories.CategoryName, AVG(UnitPrice)
FROM Products
INNER JOIN Categories ON Categories.CategoryID = Products.CategoryID
GROUP BY Categories.CategoryName;
GO

-- Q19
DROP PROC IF EXISTS Question19;
GO
CREATE PROCEDURE Question19
AS
SELECT Employees.FirstName + ' ' + Employees.LastName AS [Employee Name], City
FROM Employees
WHERE City LIKE '[S, T]%';
GO