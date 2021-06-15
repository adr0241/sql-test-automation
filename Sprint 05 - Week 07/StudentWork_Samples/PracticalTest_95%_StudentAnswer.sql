USE NORTHWND;
GO

-- Q1
DROP PROC IF EXISTS Question1;
GO
CREATE PROCEDURE Question1
AS
	SELECT Suppliers.SupplierID, Suppliers.CompanyName FROM Products
	INNER JOIN Suppliers ON Products.SupplierID = Suppliers.SupplierID
	GROUP BY Suppliers.SupplierID, Suppliers.CompanyName
	HAVING COUNT(ProductName) > 3;
GO

-- Q2
DROP PROC IF EXISTS Question2;
GO
CREATE PROCEDURE Question2
AS
	SELECT Suppliers.SupplierID, Suppliers.CompanyName FROM Products
	INNER JOIN Suppliers ON Products.SupplierID = Suppliers.SupplierID
	GROUP BY Suppliers.SupplierID, Suppliers.CompanyName
	HAVING COUNT(ProductName) > 3;
GO

-- Q3
DROP PROC IF EXISTS Question3;
GO
CREATE PROCEDURE Question3
AS
	SELECT Country, count(ContactName) AS numberOfCustomers FROM Customers
	GROUP BY Country
	HAVING count(ContactName) > 5
	ORDER BY count(ContactName) desc;
GO

-- Q4
DROP PROC IF EXISTS Question4;
GO
CREATE PROCEDURE Question4
AS
	SELECT ProductID, ProductName FROM Products
	WHERE UnitsInStock < 50
	ORDER BY UnitsInStock ASC;
GO

-- Q5
DROP PROC IF EXISTS Question5;
GO
CREATE PROCEDURE Question5
AS
	SELECT SupplierID, CompanyName FROM Suppliers
GO

-- Q6
DROP PROC IF EXISTS Question6;
GO
CREATE PROCEDURE Question6
AS
	SELECT CONCAT(FirstName, ' ', LastName) AS FullName, City FROM Employees
	WHERE City LIKE 'S%'
	OR city LIKE 'T%'
GO

-- Q7
DROP PROC IF EXISTS Question7;
GO
CREATE PROCEDURE Question7
AS
	SELECT Categories.CategoryName, Products.ProductName, Suppliers.CompanyName FROM Products
	INNER JOIN Categories ON Products.CategoryID = Categories.CategoryID
	INNER JOIN Suppliers ON Products.SupplierID = Suppliers.SupplierID
	WHERE Categories.CategoryName = 'Condiments'
GO

-- Q8
DROP PROC IF EXISTS Question8;
GO
CREATE PROCEDURE Question8
AS
	SELECT COUNT(ProductName) AS numberOfProductsStartingWithB FROM Products
	WHERE ProductName LIKE 'B%';
GO

-- Q9
DROP PROC IF EXISTS Question9;
GO
CREATE PROCEDURE Question9
AS
	SELECT ProductName, UnitPrice, UnitsInStock FROM Products
	ORDER BY UnitPrice ASC;
GO

-- Q10
DROP PROC IF EXISTS Question10;
GO
CREATE PROCEDURE Question10
AS
	SELECT ProductID, ProductName, UnitPrice, UnitsOnOrder FROM Products
	WHERE UnitsOnOrder > 5;
GO

-- Q11
DROP PROC IF EXISTS Question11;
GO
CREATE PROCEDURE Question11
AS
	SELECT TOP 20 UnitsOnOrder, ProductName FROM Products
	ORDER BY UnitsOnOrder DESC;
GO

-- Q12
DROP PROC IF EXISTS Question12;
GO
CREATE PROCEDURE Question12
AS
	SELECT Freight, OrderID, OrderDate, ShippedDate, CustomerID, ShipCountry FROM Orders
GO

-- Q13
DROP PROC IF EXISTS Question13;
GO
CREATE PROCEDURE Question13
AS
	SELECT Country, COUNT(CustomerID) AS numberOfCustomers FROM Customers
	GROUP BY Country
	HAVING COUNT(CustomerID) > 10
GO

-- Q14
DROP PROC IF EXISTS Question14;
GO
CREATE PROCEDURE Question14
AS
	SELECT CompanyName, ContactName, ContactTitle, City, Country FROM Suppliers
	WHERE City = 'Buenos Aires'
	AND Country = 'Argentina'
GO

-- Q15
DROP PROC IF EXISTS Question15;
GO
CREATE PROCEDURE Question15
AS
	SELECT CONCAT(FirstName, ' ', LastName) AS FullName, City FROM Employees
	WHERE City = 'Seattle'
	OR City = 'Redmond';
GO

-- Q16
DROP PROC IF EXISTS Question16;
GO
CREATE PROCEDURE Question16
AS
	SELECT EmployeeTerritories.EmployeeID, Employees.FirstName, Employees.LastName, Territories.TerritoryDescription FROM EmployeeTerritories
	INNER JOIN Employees ON EmployeeTerritories.EmployeeID = Employees.EmployeeID
	INNER JOIN Territories ON EmployeeTerritories.TerritoryID = Territories.TerritoryID
	WHERE TerritoryDescription LIKE 'B%';
GO

-- Q17
DROP PROC IF EXISTS Question17;
GO
CREATE PROCEDURE Question17
AS
	select DISTINCT c.CustomerID, c.CompanyName
	from Customers c
	inner join Orders o
	on o.CustomerID = c.CustomerID
	inner join [Order Details] od
	on o.OrderID = od.OrderID
	where od.ProductID IN 
	(select p.ProductID
	from Orders o
	inner join [Order Details] od
	on o.OrderID = od.OrderID
	inner join Products p
	on od.ProductID = p.ProductID
	where o.CustomerID = 'LAZYK' );
GO

-- Q18
DROP PROC IF EXISTS Question18;
GO
CREATE PROCEDURE Question18
AS
	SELECT Employees.FirstName + ' ' + Employees.LastName AS employeesName, Customers.ContactName AS customersName FROM Orders
	INNER JOIN Customers ON Orders.CustomerID = Customers.CustomerID
	INNER JOIN Employees ON Orders.EmployeeID = Employees.EmployeeID
	INNER JOIN Shippers ON Orders.ShipVia = Shippers.ShipperID
	WHERE Shippers.CompanyName = 'Speedy Express'
	AND Customers.City = 'Madrid';
GO

-- Q19
DROP PROC IF EXISTS Question19;
GO
CREATE PROCEDURE Question19
AS
	SELECT Employees.FirstName + ' ' + Employees.LastName AS FullName, Employees.Title FROM [Order Details]
	INNER JOIN Orders ON [Order Details].OrderID = Orders.OrderID
	INNER JOIN Employees ON Orders.EmployeeID = Employees.EmployeeID
	INNER JOIN Products ON [Order Details].ProductID = Products.ProductID
	WHERE Products.ProductName = 'Gravad Lax'
	OR Products.ProductName = 'Mishi Kobe Niku'
	GROUP BY Products.ProductName, Employees.FirstName, Employees.LastName, Employees.Title;
GO