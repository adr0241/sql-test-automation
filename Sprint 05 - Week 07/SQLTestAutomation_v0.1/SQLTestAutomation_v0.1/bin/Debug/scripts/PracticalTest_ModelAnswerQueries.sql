USE NORTHWND;
GO

-- Q1
DROP PROC IF EXISTS Question1_ModelAnswer;
GO
CREATE PROCEDURE Question1_ModelAnswer
AS
	SELECT Suppliers.SupplierID, Suppliers.CompanyName FROM Products
	INNER JOIN Suppliers ON Products.SupplierID = Suppliers.SupplierID
	GROUP BY Suppliers.SupplierID, Suppliers.CompanyName
	HAVING COUNT(ProductName) > 3;
GO

-- Q2
DROP PROC IF EXISTS Question2_ModelAnswer;
GO
CREATE PROCEDURE Question2_ModelAnswer
AS
	SELECT Suppliers.SupplierID, Suppliers.CompanyName FROM Products
	INNER JOIN Suppliers ON Products.SupplierID = Suppliers.SupplierID
	GROUP BY Suppliers.SupplierID, Suppliers.CompanyName
	HAVING COUNT(ProductName) > 3;
GO

-- Q3
DROP PROC IF EXISTS Question3_ModelAnswer;
GO
CREATE PROCEDURE Question3_ModelAnswer
AS
	SELECT Country, count(ContactName) AS numberOfCustomers FROM Customers
	GROUP BY Country
	HAVING count(ContactName) > 5
	ORDER BY count(ContactName) desc;
GO

-- Q4
DROP PROC IF EXISTS Question4_ModelAnswer;
GO
CREATE PROCEDURE Question4_ModelAnswer
AS
	SELECT ProductID, ProductName FROM Products
	WHERE UnitsInStock < 50
	ORDER BY UnitsInStock ASC;
GO

-- Q5
DROP PROC IF EXISTS Question5_ModelAnswer;
GO
CREATE PROCEDURE Question5_ModelAnswer
AS
	SELECT SupplierID, CompanyName FROM Suppliers
	WHERE Country = 'Germany'
GO

-- Q6
DROP PROC IF EXISTS Question6_ModelAnswer;
GO
CREATE PROCEDURE Question6_ModelAnswer
AS
	SELECT CONCAT(FirstName, ' ', LastName) AS FullName, City FROM Employees
	WHERE City LIKE 'S%'
	OR city LIKE 'T%'
GO

-- Q7
DROP PROC IF EXISTS Question7_ModelAnswer;
GO
CREATE PROCEDURE Question7_ModelAnswer
AS
	SELECT Categories.CategoryName, Products.ProductName, Suppliers.CompanyName FROM Products
	INNER JOIN Categories ON Products.CategoryID = Categories.CategoryID
	INNER JOIN Suppliers ON Products.SupplierID = Suppliers.SupplierID
	WHERE Categories.CategoryName = 'Condiments'
GO

-- Q8
DROP PROC IF EXISTS Question8_ModelAnswer;
GO
CREATE PROCEDURE Question8_ModelAnswer
AS
	SELECT COUNT(ProductName) AS numberOfProductsStartingWithB FROM Products
	WHERE ProductName LIKE 'B%';
GO

-- Q9
DROP PROC IF EXISTS Question9_ModelAnswer;
GO
CREATE PROCEDURE Question9_ModelAnswer
AS
	SELECT ProductName, UnitPrice, UnitsInStock FROM Products
	ORDER BY UnitPrice ASC;
GO

-- Q10
DROP PROC IF EXISTS Question10_ModelAnswer;
GO
CREATE PROCEDURE Question10_ModelAnswer
AS
	SELECT ProductID, ProductName, UnitPrice, UnitsOnOrder FROM Products
	WHERE UnitsOnOrder > 5;
GO

-- Q11
DROP PROC IF EXISTS Question11_ModelAnswer;
GO
CREATE PROCEDURE Question11_ModelAnswer
AS
	SELECT TOP 20 UnitsOnOrder, ProductName FROM Products
	ORDER BY UnitsOnOrder DESC;
GO

-- Q12
DROP PROC IF EXISTS Question12_ModelAnswer;
GO
CREATE PROCEDURE Question12_ModelAnswer
AS
	SELECT Freight, OrderID, OrderDate, ShippedDate, CustomerID, ShipCountry FROM Orders
	ORDER BY Freight ASC;
GO

-- Q13
DROP PROC IF EXISTS Question13_ModelAnswer;
GO
CREATE PROCEDURE Question13_ModelAnswer
AS
	SELECT Country, COUNT(CustomerID) AS numberOfCustomers FROM Customers
	GROUP BY Country
	HAVING COUNT(CustomerID) > 10
	ORDER BY COUNT(CustomerID) ASC;
GO

-- Q14
DROP PROC IF EXISTS Question14_ModelAnswer;
GO
CREATE PROCEDURE Question14_ModelAnswer
AS
	SELECT CompanyName, ContactName, ContactTitle, City, Country FROM Suppliers
	WHERE City = 'Buenos Aires'
	AND Country = 'Argentina'
GO

-- Q15
DROP PROC IF EXISTS Question15_ModelAnswer;
GO
CREATE PROCEDURE Question15_ModelAnswer
AS
	SELECT CONCAT(FirstName, ' ', LastName) AS FullName, City FROM Employees
	WHERE City = 'Seattle'
	OR City = 'Redmond';
GO

-- Q16
DROP PROC IF EXISTS Question16_ModelAnswer;
GO
CREATE PROCEDURE Question16_ModelAnswer
AS
	SELECT EmployeeTerritories.EmployeeID, Employees.FirstName, Employees.LastName, Territories.TerritoryDescription FROM EmployeeTerritories
	INNER JOIN Employees ON EmployeeTerritories.EmployeeID = Employees.EmployeeID
	INNER JOIN Territories ON EmployeeTerritories.TerritoryID = Territories.TerritoryID
	WHERE TerritoryDescription LIKE 'B%';
GO

-- Q17
DROP PROC IF EXISTS Question17_ModelAnswer;
GO
CREATE PROCEDURE Question17_ModelAnswer
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
DROP PROC IF EXISTS Question18_ModelAnswer;
GO
CREATE PROCEDURE Question18_ModelAnswer
AS
	SELECT Employees.FirstName + ' ' + Employees.LastName AS employeesName, Customers.ContactName AS customersName FROM Orders
	INNER JOIN Customers ON Orders.CustomerID = Customers.CustomerID
	INNER JOIN Employees ON Orders.EmployeeID = Employees.EmployeeID
	INNER JOIN Shippers ON Orders.ShipVia = Shippers.ShipperID
	WHERE Shippers.CompanyName = 'Speedy Express'
	AND Customers.City = 'Madrid';
GO

-- Q19
DROP PROC IF EXISTS Question19_ModelAnswer;
GO
CREATE PROCEDURE Question19_ModelAnswer
AS
	SELECT Employees.FirstName + ' ' + Employees.LastName AS FullName, Employees.Title FROM [Order Details]
	INNER JOIN Orders ON [Order Details].OrderID = Orders.OrderID
	INNER JOIN Employees ON Orders.EmployeeID = Employees.EmployeeID
	INNER JOIN Products ON [Order Details].ProductID = Products.ProductID
	WHERE Products.ProductName = 'Gravad Lax'
	OR Products.ProductName = 'Mishi Kobe Niku'
	GROUP BY Products.ProductName, Employees.FirstName, Employees.LastName, Employees.Title;
GO