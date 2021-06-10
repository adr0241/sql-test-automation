USE NORTHWND;
GO

-- Question 2
DROP PROC IF EXISTS Question2;
GO
CREATE PROCEDURE Question2
AS
SELECT [FirstName] AS 'First Name', [LastName] AS 'Last Name', [Address] AS 'Address', [City] AS 'City', [Region] AS 'Region'
FROM [dbo].[Employees];
GO

-- Question 3
DROP PROC IF EXISTS Question3;
GO
CREATE PROCEDURE Question3
AS
SELECT [FirstName] AS 'First Name', [LastName] AS 'Last Name', [Address] AS 'Address', [City] AS 'City', [Region] AS 'Region', [Country] AS 'Country'
FROM [dbo].[Employees]
WHERE [Country] = 'USA';
GO

-- Question 4
DROP PROC IF EXISTS Question4;
GO
CREATE PROCEDURE Question4
AS
SELECT [FirstName] AS 'First Name', [LastName] AS 'Last Name', [Address] AS 'Address', [City] AS 'City', [Region] AS 'Region', [ShipCountry] AS 'Ship Country'
FROM [dbo].[Employees] INNER JOIN [dbo].[Orders] 
ON [dbo].[Employees].[EmployeeID] = [dbo].[Orders].[EmployeeID]
AND [ShipCountry] = 'Belgium';
GO

-- Question 5
DROP PROC IF EXISTS Question5;
GO
CREATE PROCEDURE Question5
AS
SELECT [FirstName] AS 'First Name', [LastName] AS 'Last Name', [City] AS 'City', [HireDate] AS 'Hire Date'
FROM [dbo].[Employees]
WHERE [LastName] LIKE 'S%'
AND [FirstName] LIKE 'M%';
GO

-- Question 6 
DROP PROC IF EXISTS Question6;
GO
CREATE PROCEDURE Question6
AS
SELECT [FirstName] AS 'First Name', [LastName] AS 'Last Name', [ContactName] AS 'Customer Name', [CompanyName] AS 'Company Name'
FROM [dbo].[Employees] INNER JOIN [dbo].[Orders]
ON [dbo].[Employees].[EmployeeID] = [dbo].[Orders].[EmployeeID]
INNER JOIN [dbo].[Customers]
ON [dbo].[Orders].[CustomerID] = [dbo].[Customers].[CustomerID]
AND [dbo].[Customers].[CompanyName] = 'Speedy Express'
AND [dbo].[Customers].[City] = 'Bruxelles';
GO

-- Question 7
DROP PROC IF EXISTS Question7;
GO
CREATE PROCEDURE Question7
AS
SELECT DISTINCT[ProductName] AS 'Product Name', [Title] AS 'Employee Title', [FirstName] AS 'First Name', [LastName] AS 'Last Name'
FROM [dbo].[Employees] INNER JOIN [dbo].[Orders]
ON [dbo].[Employees].[EmployeeID] = [dbo].[Orders].[EmployeeID]
INNER JOIN [dbo].[Order Details]
ON [dbo].[Orders].[OrderID] = [dbo].[Order Details].[OrderID]
INNER JOIN [dbo].[Products]
ON [dbo].[Order Details].[ProductID] = [dbo].[Products].[ProductID]
AND [dbo].[Products].[ProductName] = 'Gravad Lax'
OR [dbo].[Products].[ProductName] = 'Mishi Kobe Niku';
GO

DROP PROC IF EXISTS Question8;
GO

-- Question 9
DROP PROC IF EXISTS Question9;
GO
CREATE PROCEDURE Question9
AS
SELECT [FirstName] AS 'First Name', [LastName] AS 'Last Name', [Address] AS 'Address', [City] AS 'City', [Region] AS 'Region', [BirthDate] AS 'Birth Date', DATEDIFF(year, [BirthDate], [HireDate]) AS 'Age'
FROM [dbo].[Employees]
WHERE DATEDIFF(year, [BirthDate], [HireDate]) > 60;
GO

-- Question 10
DROP PROC IF EXISTS Question10;
GO
CREATE PROCEDURE Question10
AS
SELECT [FirstName] AS 'First Name', [LastName] AS 'Last Name', [ProductName] AS 'ProductName'
FROM [dbo].[Employees] INNER JOIN [dbo].[Orders]
ON [dbo].[Employees].[EmployeeID] = [dbo].[Orders].[EmployeeID]
INNER JOIN [dbo].[Order Details]
ON [dbo].[Orders].[OrderID] = [dbo].[Order Details].[OrderID]
INNER JOIN [dbo].[Products]
ON [dbo].[Order Details].[ProductID] = [dbo].[Products].[ProductID]
AND [ProductName] = 'Chai';
GO

-- Question 11
DROP PROC IF EXISTS Question11;
GO

-- Question 12
DROP PROC IF EXISTS Question12;
GO

DROP PROC IF EXISTS Question13;
GO

-- Question 14
DROP PROC IF EXISTS Question14;
GO

DROP PROC IF EXISTS Question15;
GO
DROP PROC IF EXISTS Question16;
GO
DROP PROC IF EXISTS Question17;
GO
DROP PROC IF EXISTS Question18;
GO

-- Question 19. 
DROP PROC IF EXISTS Question19;
GO
CREATE PROCEDURE Question19
AS
SELECT CONCAT([FirstName],' ',[LastName]) AS 'Employee Name', [City] AS 'City'
FROM [dbo].[Employees]
WHERE [City] = 'S%'
OR [City] = 'T%';
GO
