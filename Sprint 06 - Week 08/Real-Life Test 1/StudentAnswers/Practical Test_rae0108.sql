use [NORTHWND];
GO

--Q2 Give the name, address, city, and region of employees
DROP PROC IF EXISTS Question2;
GO
CREATE PROCEDURE Question2
AS
SELECT  FirstName, LastName, address, city, region
FROM [dbo].[Employees];
GO

--Q3  Give the name, address, city, and region of employees living in USA.
DROP PROC IF EXISTS Question3;
GO
CREATE PROCEDURE Question3
AS
SELECT FirstName, LastName, address, city, region 
FROM [dbo].[Employees]
WHERE [Country] = 'USA';
GO


--q4 Give the name, address, city, and region of employees that have placed orders to be delivered in Belgium
DROP PROC IF EXISTS Question4;
GO
CREATE PROCEDURE Question4
AS
SELECT FirstName, LastName, address, city, region 
FROM [dbo].[Employees] e
INNER JOIN [dbo].[Orders] o 
ON o.EmployeeID = e.EmployeeID
WHERE ShipCountry = 'Belgium';
GO


--Q5 . Display the First Name, Last Name, City and Hire Date of Employees whose Last Name starts with 'S' and First Name starts with 'M'.
DROP PROC IF EXISTS Question5;
GO
CREATE PROCEDURE Question5
AS
SELECT FirstName, LastName, city, HireDate
FROM [dbo].[Employees]
WHERE FirstName like '%M%' AND LastName like '%S%';
GO


--Q6 . Give the employee name and the customer name for orders that are sent by the company �Speedy Express� to customers who live in Bruxelles.
DROP PROC IF EXISTS Question6;
GO
CREATE PROCEDURE Question6
AS
SELECT e.Firstname, e.LastName, c.ContactName, c.CompanyName
FROM [dbo].[Employees] e
INNER JOIN  [dbo].[Orders] o 
ON o.EmployeeID = e.EmployeeID
LEFT JOIN [dbo].[Customers] C
ON o.CustomerID = c.CustomerID
WHERE c.region like 'Bruxelles%';
GO


--SELECT * FROM [dbo].[Customers]


--Q7 Give the title and name of employees who have sold at least one of the products �Gravad Lax� or �Mishi Kobe Niku�. Names should not repeat if they
--have sold both or one item twice.
DROP PROC IF EXISTS Question7;
GO
CREATE PROCEDURE Question7
AS
SELECT e.Title, e.FirstName, e.LastName 
FROM [dbo].[Employees] e
INNER JOIN [dbo].[Orders] O 
ON e.EmployeeID = o.EmployeeID 
INNER JOIN [dbo].[Order Details] od
ON o.EmployeeID = od.ProductID
inner join [dbo].[Products] p
ON od.ProductID = p.ProductID
WHERE Productname like '%Gravad Lax%'
SELECT  productName, ProductID
FROM [dbo].[Products]
WHERE ProductName = 'Mishi Kobe Niku';
GO


--select * from [dbo].[Products]

--Q8 Give the name of employees and the city where they live for employees who have sold to customers in the same city.
DROP PROC IF EXISTS Question8;
GO
CREATE PROCEDURE Question8
AS
SELECT e.FirstName, e.LastName, e.city
FROM [dbo].[Employees] e 
INNER JOIN [dbo].[Orders] o 
ON e.City = o.ShipCity ;
GO


--Q9Write a query to get the name, address, city, and region of employees older than 60 years
DROP PROC IF EXISTS Question9;
GO
CREATE PROCEDURE Question9
AS
SELECT datediff(yy,BirthDate,getdate()) as [Age],
FirstName, LastName, Address, city, region, BirthDate
FROM [dbo].[Employees] 
WHERE BirthDate > DATEADD(yy, -60,GETDATE());
GO


--SELECT birthDate,
--datediff(yy,BirthDate,getdate()) as [Age]
--from [dbo].[Employees]
--where birthDate < 60 

--Q19 Display the First Name and Last Name (concatenated) and City of all Employees who live in cities that start with the letter �S� or �T�.
DROP PROC IF EXISTS Question19;
GO
CREATE PROCEDURE Question19
AS
SELECT Firstname + ' ' + LastName, city 
FROM [dbo].[Employees]
WHERE City LIKE '%S%' OR City LIKE '%T%';
GO


/*SELECT FistName, LastName
FROM [dbo].[Employees]*/

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