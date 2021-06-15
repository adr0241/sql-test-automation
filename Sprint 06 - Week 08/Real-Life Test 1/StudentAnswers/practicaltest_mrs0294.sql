-- DE103 Practical - Mason Snape
USE NORTHWND;
GO
-- Q1 Database restored successfully!

-- Q2
DROP PROC IF EXISTS Question2;
GO
CREATE PROCEDURE Question2
AS
SELECT [FirstName],[LastName],[Address],[City],[Region] FROM Employees;
GO

-- Q3
DROP PROC IF EXISTS Question3;
GO
CREATE PROCEDURE Question3
AS
SELECT [FirstName],[LastName],[Address],[City],[Region],[Country] FROM Employees
WHERE Country LIKE 'USA';
GO

-- Q4
DROP PROC IF EXISTS Question4;
GO
CREATE PROCEDURE Question4
AS
SELECT [FirstName],[LastName],[Address],[City],[Region],[ShipCountry] FROM Employees
INNER JOIN Orders ON Employees.EmployeeID = Orders.EmployeeID
WHERE ShipCountry LIKE 'Belgium';
GO

-- Q5
DROP PROC IF EXISTS Question5;
GO
CREATE PROCEDURE Question5
AS
SELECT [FirstName],[LastName],[City],[HireDate] FROM Employees
WHERE LastName LIKE 'S%' AND FirstName LIKE 'M%';
GO

-- Q6 !!!!
DROP PROC IF EXISTS Question6;
GO


-- Q7 !!!!
DROP PROC IF EXISTS Question7;
GO


-- Q8
DROP PROC IF EXISTS Question8;
GO
CREATE PROCEDURE Question8
AS
SELECT [FirstName], [LastName], Employees.City 
FROM Employees INNER JOIN Customers on Employees.City = Customers.City
WHERE Employees.City = Customers.City
GROUP BY [FirstName], [LastName], Employees.City;
GO

-- Q9
DROP PROC IF EXISTS Question9;
GO
CREATE PROCEDURE Question9
AS
SELECT [FirstName], [LastName], [Address],[City], [Region], YEAR(BirthDate) AS 'BIRTHDAY', ROUND(DATEDIFF(DAY, [BirthDate], GetDate()) / 365.25,0) AS 'Age' FROM Employees
GROUP BY  BirthDate, FirstName, LastName, [Address], City, region
HAVING ROUND(DATEDIFF(DAY, [BirthDate], GetDate()) / 365.25, 0) >'60'
ORDER BY ROUND(DATEDIFF(DAY, [BirthDate], GetDate()) / 365.25, 0);
GO

-- Q10
DROP PROC IF EXISTS Question10;
GO
CREATE PROCEDURE Question10
AS
SELECT FirstName, LastName, [ProductName] FROM Employees, Products
WHERE ProductName LIKE 'Chai'
ORDER BY FirstName;
GO

-- Q11
DROP PROC IF EXISTS Question11;
GO
CREATE PROCEDURE Question11
AS
SELECT Suppliers.SupplierID, CompanyName, COUNT(ProductID) AS 'No of Products' FROM Suppliers
INNER JOIN Products on suppliers.SupplierID = products.SupplierID
GROUP BY  Suppliers.SupplierID, CompanyName
HAVING COUNT(*)>'3';
GO

-- Q12
DROP PROC IF EXISTS Question12;
GO
CREATE PROCEDURE Question12
AS
SELECT COUNT(CustomerID) AS 'Count of Customers', [Country] FROM Customers
GROUP BY Country
HAVING COUNT(*)>'5'
ORDER BY COUNT(*) DESC;
GO

-- Q13
DROP PROC IF EXISTS Question13;
GO
CREATE PROCEDURE Question13
AS
SELECT [CompanyName], COUNT(OrderID) AS '# OF PURCHASES' FROM Customers
INNER JOIN Orders ON Orders.CustomerID = Customers.CustomerID
GROUP BY CompanyName
HAVING COUNT(*)>'10';
GO

-- Q14
DROP PROC IF EXISTS Question14;
GO
CREATE PROCEDURE Question14
AS
SELECT [ProductName],[CategoryID], [UnitPrice], [UnitsInStock], (UnitPrice*UnitsInStock) AS 'Total Value of All Products' FROM Products;
GO

-- Q15
DROP PROC IF EXISTS Question15;
GO
CREATE PROCEDURE Question15
AS
SELECT [CategoryName],[ProductName], Suppliers.CompanyName From Categories
INNER JOIN Products ON products.CategoryID = Categories.CategoryID
INNER JOIN Suppliers ON Suppliers.SupplierID = Products.SupplierID
WHERE CategoryName LIKE 'Condiments';
GO

-- Q16
DROP PROC IF EXISTS Question16;
GO
CREATE PROCEDURE Question16
AS
SELECT [CompanyName], COUNT(OrderID) AS '# of Orders Placed' FROM Customers
INNER JOIN Orders ON Orders.CustomerID = Customers.CustomerID
GROUP BY CompanyName;
GO

-- Q17
DROP PROC IF EXISTS Question17;
GO
CREATE PROCEDURE Question17
AS
SELECT [ProductName],[UnitsOnOrder],[UnitsInStock] FROM Products
WHERE UnitsInStock < UnitsOnOrder;
GO

-- Q18
DROP PROC IF EXISTS Question18;
GO
CREATE PROCEDURE Question18
AS
SELECT [CategoryName], AVG(UnitPrice) AS 'AVERAGE PRICE' FROM Products
INNER JOIN Categories ON Categories.CategoryID = Products.CategoryID
GROUP BY CategoryName;
GO

-- Q19
DROP PROC IF EXISTS Question19;
GO
CREATE PROCEDURE Question19
AS
SELECT  CONCAT(firstname, ' ', lastname) AS 'Employee Name', City FROM Employees
WHERE City LIKE 'S%' OR City LIKE 'T%';
GO


