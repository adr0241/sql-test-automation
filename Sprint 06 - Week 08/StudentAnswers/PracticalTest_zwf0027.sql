/*Q2*/
DROP PROC IF EXISTS Question2;
GO
CREATE PROCEDURE Question2
AS
SELECT FirstName, LastName, Address, City, Region FROM [dbo].[Employees];
GO

/*Q3*/
DROP PROC IF EXISTS Question3;
GO
CREATE PROCEDURE Question3
AS
SELECT FirstName, LastName, Address, City, Region FROM [dbo].[Employees]
WHERE Country = 'USA';
GO

/*Q4*/
DROP PROC IF EXISTS Question4;
GO
CREATE PROCEDURE Question4
AS
SELECT FirstName, LastName, City, HireDate FROM Employees
FULL OUTER JOIN Orders
ON Employees.EmployeeID = Orders.EmployeeID
WHERE Orders.ShipCountry = 'Belgium';
GO

/*Q5*/
DROP PROC IF EXISTS Question5;
GO
CREATE PROCEDURE Question5
AS
SELECT FirstName, LastName, City, HireDate FROM Employees
WHERE LastName LIKE 'S' + '%' AND FirstName LIKE 'M' + '%';
GO

/*Q6*/
DROP PROC IF EXISTS Question6;
GO
CREATE PROCEDURE Question6
AS
SELECT Employees.FirstName, Employees.LastName, Customers.CompanyName FROM Employees, Customers
FULL OUTER JOIN Orders 
ON CompanyName = 'Speedy Express'
WHERE ShipCity = 'Bruxelles'
GO

DROP PROC IF EXISTS Question7;
GO
DROP PROC IF EXISTS Question8;
GO
DROP PROC IF EXISTS Question9;
GO
DROP PROC IF EXISTS Question10;
GO
DROP PROC IF EXISTS Question11;
GO
DROP PROC IF EXISTS Question12;
GO
DROP PROC IF EXISTS Question13;
GO
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
DROP PROC IF EXISTS Question19;
GO

/*I think I missed too many lectures. I'm completely lost after this point.*/

