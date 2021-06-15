-- Q1 

USE NORTHWND;
GO

-- Q2
DROP PROC IF EXISTS Question2;
GO
CREATE PROCEDURE Question2
AS
SELECT [dbo].[Employees].[FirstName], [dbo].[Employees].[LastName], [dbo].[Employees].[Address], [dbo].[Employees].[City], [dbo].[Employees].[Region]
	FROM [dbo].[Employees];
GO

-- Q3
DROP PROC IF EXISTS Question3;
GO
CREATE PROCEDURE Question3
AS
SELECT [dbo].[Employees].[FirstName], [dbo].[Employees].[LastName], [dbo].[Employees].[Address], [dbo].[Employees].[City], [dbo].[Employees].[Region]
	FROM [dbo].[Employees]
	WHERE [dbo].[Employees].[Country] = 'USA';
GO

	
-- Q4
DROP PROC IF EXISTS Question4;
GO
CREATE PROCEDURE Question4
AS
SELECT [dbo].[Employees].[FirstName], [dbo].[Employees].[LastName], [dbo].[Employees].[Address], [dbo].[Employees].[City], [dbo].[Employees].[Region], [dbo].[Orders].[ShipCountry]
	FROM [dbo].[Employees]
	 INNER JOIN [dbo].[Orders] ON [dbo].[Employees].[EmployeeID] = [dbo].[Orders].[EmployeeID]
	WHERE [Orders].[ShipCountry] = 'Belgium';
GO


-- Q5
DROP PROC IF EXISTS Question5;
GO
CREATE PROCEDURE Question5
AS
SELECT [dbo].[Employees].[FirstName], [dbo].[Employees].[LastName], [dbo].[Employees].[City], [dbo].[Employees].[HireDate]
	FROM [dbo].[Employees]
	WHERE [dbo].[Employees].[LastName] LIKE 'S%'
	AND [dbo].[Employees].[FirstName] LIKE 'M%';
GO


-- Q6
DROP PROC IF EXISTS Question6;
GO
CREATE PROCEDURE Question6
AS
SELECT [dbo].[Employees].[FirstName], [dbo].[Employees].[LastName], [dbo].[Customers].[CompanyName], [dbo].[Shippers].[CompanyName]
	FROM [dbo].[Employees]
		INNER JOIN [dbo].[Orders] ON [dbo].[Employees].[EmployeeID] = [dbo].[Orders].[EmployeeID]
		INNER JOIN [dbo].[Shippers] ON [dbo].[Orders].[ShipVia] = [dbo].[Shippers].[ShipperID]
		INNER JOIN [dbo].[Customers] ON [dbo].[Orders].[CustomerID] = [dbo].[Customers].[CustomerID]
	WHERE [dbo].[Shippers].[CompanyName] = 'Speedy Express'
	AND [dbo].[Customers].[City] = 'Bruxelles';
GO


-- Q7
DROP PROC IF EXISTS Question7;
GO
CREATE PROCEDURE Question7
AS
SELECT DISTINCT([dbo].[Employees].[Title]), [dbo].[Employees].[FirstName], [dbo].[Employees].[LastName]
	FROM [dbo].[Employees]
	INNER JOIN [dbo].[Orders] ON [dbo].[Employees].[EmployeeID] = [dbo].[Orders].[EmployeeID]
	INNER JOIN [dbo].[Order Details] ON [dbo].[Orders].[OrderID] = [dbo].[Order Details].[OrderID]
	INNER JOIN [dbo].[Products] ON [dbo].[Order Details].[ProductID] = [dbo].[Products].[ProductID]
	WHERE [dbo].[Products].[ProductName] = 'Gravad Lax' 
	OR [dbo].[Products].[ProductName] = 'Mishi Kobe Niku';
GO


-- Q8 
DROP PROC IF EXISTS Question8;
GO
CREATE PROCEDURE Question8
AS
SELECT DISTINCT([dbo].[Employees].[FirstName]), [dbo].[Employees].[LastName], [dbo].[Employees].[City]
	FROM [dbo].[Employees]
		INNER JOIN [dbo].[Orders] ON [dbo].[Employees].[EmployeeID] = [dbo].[Orders].[EmployeeID]
		INNER JOIN [dbo].[Customers] ON [dbo].[Orders].[CustomerID] = [dbo].[Customers].[CustomerID]
	WHERE [dbo].[Employees].[City] = [dbo].[Customers].[City];
GO


-- Q9
DROP PROC IF EXISTS Question9;
GO
CREATE PROCEDURE Question9
AS
SELECT [dbo].[Employees].[FirstName], [dbo].[Employees].[LastName], [dbo].[Employees].[Address], [dbo].[Employees].[City], [dbo].[Employees].[Region], [dbo].[Employees].[BirthDate], DATEDIFF(YYYY, [dbo].[Employees].[BirthDate], getdate()) AS [Age]
	FROM [dbo].[Employees]
	WHERE DATEDIFF(dd, [dbo].[Employees].[BirthDate], '1961-06-01') > 60
	ORDER BY [dbo].[Employees].[BirthDate] DESC;
GO




-- Q10
DROP PROC IF EXISTS Question10;
GO
CREATE PROCEDURE Question10
AS
SELECT DISTINCT([dbo].[Employees].[FirstName]), [dbo].[Employees].[LastName], [dbo].[Products].[ProductName]
	FROM [dbo].[Employees]
		INNER JOIN [dbo].[Orders] ON [dbo].[Employees].[EmployeeID] = [dbo].[Orders].[EmployeeID]
		INNER JOIN [dbo].[Order Details] ON [dbo].[Orders].[OrderID] = [dbo].[Order Details].[OrderID]
		INNER JOIN [dbo].[Products] ON [dbo].[Order Details].[ProductID] = [dbo].[Products].[ProductID]
	WHERE [dbo].[Products].[ProductName] = 'Chai';
GO


-- Q11
DROP PROC IF EXISTS Question11;
GO
CREATE PROCEDURE Question11
AS
SELECT a.[SupplierID], a.[CompanyName], a.[No. of Products]
	FROM (
		SELECT [dbo].[Suppliers].[SupplierID], [dbo].[Suppliers].[CompanyName], COUNT([dbo].[Products].[SupplierID]) AS [No. of Products]
			FROM [dbo].[Suppliers]
				INNER JOIN [dbo].[Products] ON [dbo].[Suppliers].[SupplierID] = [dbo].[Products].[SupplierID]
			GROUP BY [dbo].[Suppliers].[SupplierID], [dbo].[Suppliers].[CompanyName]) AS a
	WHERE a.[No. of Products] > 3;
GO


-- Q12
DROP PROC IF EXISTS Question12;
GO
CREATE PROCEDURE Question12
AS
SELECT a.[Customer Num], a.[Country]
	FROM (
		SELECT COUNT([dbo].[Customers].[CustomerID]) AS [Customer Num], [dbo].[Customers].[Country]
			FROM [dbo].[Customers]
			GROUP BY [dbo].[Customers].[Country]) AS a
	WHERE a.[Customer Num] > 5
	ORDER BY a.[Customer Num] DESC;
GO


-- Q13
DROP PROC IF EXISTS Question13;
GO
CREATE PROCEDURE Question13
AS
SELECT a.[CompanyName], a.[# OF PURCHASES]
	FROM (
		SELECT [dbo].[Customers].[CompanyName], COUNT([dbo].[Orders].[OrderID]) AS [# OF PURCHASES]
			FROM [dbo].[Customers]
				INNER JOIN [dbo].[Orders] ON [dbo].[Customers].[CustomerID] = [dbo].[Orders].[CustomerID]
			GROUP BY [dbo].[Customers].[CompanyName]) AS a
	WHERE a.[# OF PURCHASES] > 10;
GO


-- Q14
DROP PROC IF EXISTS Question14;
GO
CREATE PROCEDURE Question14
AS
SELECT [dbo].[Products].[ProductName], [dbo].[Products].[CategoryID], [dbo].[Products].[UnitPrice], [dbo].[Products].[UnitsInStock], [UnitPrice] * [UnitsInStock] AS [Total Value]
	FROM [dbo].[Products];
GO


-- Q15
DROP PROC IF EXISTS Question15;
GO
CREATE PROCEDURE Question15
AS
SELECT [dbo].[Categories].[CategoryName], [dbo].[Products].[ProductName], [dbo].[Suppliers].[CompanyName]
	FROM [dbo].[Categories]
	 INNER JOIN [dbo].[Products] ON [dbo].[Categories].[CategoryID] = [dbo].[Products].[CategoryID]
	 INNER JOIN [dbo].[Suppliers] ON [dbo].[Products].[SupplierID] = [dbo].[Suppliers].[SupplierID]
	WHERE [dbo].[Categories].[CategoryName] = 'Condiments';
GO


-- Q16
DROP PROC IF EXISTS Question16;
GO
CREATE PROCEDURE Question16
AS
SELECT [dbo].[Customers].[CompanyName], COUNT([dbo].[Orders].[OrderID]) AS [# of Orders Placed]
	FROM [dbo].[Customers]
		INNER JOIN [dbo].[Orders] ON [dbo].[Customers].[CustomerID] = [dbo].[Orders].[CustomerID]
	GROUP BY [dbo].[Orders].[CustomerID], [dbo].[Customers].[CompanyName];
GO


-- Q17
DROP PROC IF EXISTS Question17;
GO
CREATE PROCEDURE Question17
AS
SELECT [dbo].[Products].[ProductName], [dbo].[Products].[UnitsOnOrder], [dbo].[Products].[UnitsInStock]
	FROM [dbo].[Products]
	WHERE [dbo].[Products].[UnitsInStock] < [dbo].[Products].[UnitsOnOrder];
GO


-- Q18 
DROP PROC IF EXISTS Question18;
GO
CREATE PROCEDURE Question18
AS
SELECT [dbo].[Categories].[CategoryName], AVG([dbo].[Products].[UnitPrice]) AS [AVERAGE PRICE]
	FROM [dbo].[Categories]
		INNER JOIN [dbo].[Products] ON [dbo].[Categories].[CategoryID] = [dbo].[Products].[CategoryID]
	GROUP BY [dbo].[Categories].[CategoryName];
GO


-- Q19
DROP PROC IF EXISTS Question19;
GO
CREATE PROCEDURE Question19
AS
SELECT CONCAT([dbo].[Employees].[FirstName], ' ', [dbo].[Employees].[LastName]) AS [EmployeeName], [dbo].[Employees].[City]
	FROM [dbo].[Employees]
	WHERE [dbo].[Employees].[City] LIKE 'S%'
	OR [dbo].[Employees].[City] LIKE 'T%';
GO
