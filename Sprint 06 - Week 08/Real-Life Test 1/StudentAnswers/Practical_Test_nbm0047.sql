USE [NORTHWND];
GO

-- q2
DROP PROC IF EXISTS Question2;
GO
CREATE PROCEDURE Question2
AS
SELECT [FirstName],[LastName], [Address], [City], [Region] FROM [dbo].[Employees];
GO

-- q3
DROP PROC IF EXISTS Question3;
GO
CREATE PROCEDURE Question3
AS
SELECT [FirstName],[LastName], [Address], [City], [Region] FROM [dbo].[Employees]
WHERE [Country] = 'USA';
GO

-- q4
DROP PROC IF EXISTS Question4;
GO
CREATE PROCEDURE Question4
AS
SELECT [FirstName],[LastName], [Address], [City], [Region] FROM [dbo].[Employees], [dbo].[Orders]
WHERE [dbo].[Employees].[EmployeeID] = [dbo].[Orders].[EmployeeID]
AND [ShipCountry] = 'Belgium';
GO

-- q5
DROP PROC IF EXISTS Question5;
GO
CREATE PROCEDURE Question5
AS
SELECT [FirstName],[LastName],  [City], [HireDate] FROM [dbo].[Employees]
WHERE [LastName] LIKE 'S%'
AND [FirstName] LIKE 'M%';
GO

--q6
DROP PROC IF EXISTS Question6;
GO
CREATE PROCEDURE Question6
AS
SELECT [FirstName],[LastName], [Customers].CompanyName FROM [dbo].[Employees], [dbo].[Orders], [dbo].[Customers],[dbo].[Shippers] 
WHERE [dbo].[Employees].[EmployeeID] = [dbo].[Orders].[EmployeeID]
AND [dbo].[Orders].[CustomerID] = [dbo].[Customers].[CustomerID]
AND [dbo].[Orders].ShipVia = Shippers.ShipperID
AND Shippers.CompanyName LIKE 'Speedy Express'
AND [dbo].[Orders].[ShipCity] = 'Bruxelles';
GO

--q7
DROP PROC IF EXISTS Question7;
GO
CREATE PROCEDURE Question7
AS
SELECT [Title],[FirstName],[LastName] FROM [dbo].[Employees],[dbo].[Orders], [dbo].[Order Details],[dbo].[Products]
WHERE Employees.EmployeeID = Orders.EmployeeID
AND Orders.OrderID= [Order Details].OrderID
AND [Order Details].ProductID = Products.ProductID
AND ProductName = 'Gravad Lax' 
OR ProductName = 'Mishi Kobe Niku'
GROUP BY [Title],[FirstName],[LastName];
GO

--q8
DROP PROC IF EXISTS Question8;
GO
CREATE PROCEDURE Question8
AS
SELECT [FirstName],[LastName], Employees.[City] FROM [dbo].[Employees], [dbo].[Orders], [dbo].[Customers]
WHERE [dbo].[Employees].[EmployeeID] = [dbo].[Orders].[EmployeeID]
AND [dbo].[Orders].[CustomerID] = [dbo].[Customers].[CustomerID]
AND Employees.City = Customers.City
GROUP BY [FirstName],[LastName], Employees.[City];
GO

--q9
DROP PROC IF EXISTS Question9;
GO
CREATE PROCEDURE Question9
AS
SELECT [FirstName],[LastName], [Address], [City], [Region] FROM [dbo].[Employees]
WHERE DATEDIFF(YEAR,[BirthDate], '2022-06-02') > 60;
GO

--q10
DROP PROC IF EXISTS Question10;
GO
CREATE PROCEDURE Question10
AS
SELECT [FirstName],[LastName] FROM [Employees],[dbo].[Orders], [dbo].[Order Details],[dbo].[Products]
WHERE Employees.EmployeeID = Orders.EmployeeID
AND Orders.OrderID= [Order Details].OrderID
AND [Order Details].ProductID = Products.ProductID
AND [Order Details].ProductID = 1
GROUP BY [FirstName],[LastName]
SELECT * FROM [dbo].[Products] WHERE ProductName = 'Chai';
GO

--q11
DROP PROC IF EXISTS Question11;
GO
CREATE PROCEDURE Question11
AS
SELECT [Suppliers].[SupplierID], [CompanyName] FROM [dbo].[Suppliers],[dbo].[Products]
WHERE Suppliers.SupplierID = Products.SupplierID
GROUP BY [Suppliers].[SupplierID], [CompanyName]
HAVING (COUNT(Products.SupplierID)) > 3;
GO

--q12
DROP PROC IF EXISTS Question12;
GO
CREATE PROCEDURE Question12
AS
SELECT [Country], COUNT([CustomerID]) AS NoOfCustomers
FROM [dbo].[Customers]
GROUP BY [Country]
HAVING COUNT([CustomerID]) > 5
ORDER BY (COUNT([CustomerID])) DESC;
GO

--q13
DROP PROC IF EXISTS Question13;
GO
CREATE PROCEDURE Question13
AS
SELECT [CompanyName], [ProductName] , [Quantity] FROM [dbo].[Customers] c
INNER JOIN [dbo].[Orders] o
ON c.CustomerID = o.CustomerID
INNER JOIN [Order Details] od
ON o.OrderID = od.OrderID
INNER JOIN Products p
ON  p.ProductID = od.ProductID
WHERE [Quantity] > 10
GROUP BY [CompanyName], [ProductName] , [Quantity];
GO

--q14
DROP PROC IF EXISTS Question14;
GO
CREATE PROCEDURE Question14
AS
SELECT [ProductName], [CategoryID], [UnitPrice], [UnitsInStock], ([UnitPrice]*[UnitsInStock]) AS TotalValueofStock
FROM [dbo].[Products];
GO

--q15
DROP PROC IF EXISTS Question15;
GO
CREATE PROCEDURE Question15
AS
SELECT [CategoryName], [ProductName], [CompanyName] FROM Categories, Products, Suppliers
WHERE Categories.CategoryID = Products.CategoryID
AND Products.SupplierID = Suppliers.SupplierID
AND CategoryName = 'Condiments';
GO

--q16
DROP PROC IF EXISTS Question16;
GO
CREATE PROCEDURE Question16
AS
SELECT [CompanyName], COUNT([OrderID]) AS NoOfOrders
FROM [dbo].[Customers], [dbo].[Orders]
WHERE Customers.CustomerID = Orders.CustomerID
GROUP BY [CompanyName];
GO

--17
DROP PROC IF EXISTS Question17;
GO
CREATE PROCEDURE Question17
AS
SELECT [ProductName], [UnitsOnOrder], [UnitsInStock] FROM [dbo].[Products]
WHERE ([UnitsInStock] < [UnitsOnOrder]);
GO

--q18
DROP PROC IF EXISTS Question18;
GO
CREATE PROCEDURE Question18
AS
SELECT [CategoryName], (AVG([UnitPrice])) AS AvgPrice FROM Categories, Products
WHERE  Categories.CategoryID = Products.CategoryID
GROUP BY [CategoryName];
GO

--q19
DROP PROC IF EXISTS Question19;
GO
CREATE PROCEDURE Question19
AS
SELECT CONCAT([FirstName], ' ', [LastName]) AS EmployeeName, [City]
FROM [dbo].[Employees]
WHERE [City] LIKE 'S%'
OR [City] LIKE 'T%';
GO

