USE NORTHWND;


DROP PROC IF EXISTS Question2_ModelAnswer;
GO
CREATE PROCEDURE Question2_ModelAnswer
AS
	select E.FirstName, E.LastName, E.Address, E.City, E.Region 
	from Employees E;
GO

DROP PROC IF EXISTS Question3_ModelAnswer;
GO
CREATE PROCEDURE Question3_ModelAnswer
AS
	select E.FirstName, E.LastName, E.Address, E.City, E.Region, E.Country
	from Employees E
	where E.Country = 'USA';
GO


DROP PROC IF EXISTS Question9_ModelAnswer;
GO
CREATE PROCEDURE Question9_ModelAnswer
AS
	select E.FirstName, E.LastName, E.Address, E.City, E.Region, DATEPART(YEAR, e.BirthDate) AS BIRTHDATE,
	(DATEPART(YEAR, CURRENT_TIMESTAMP ) -DATEPART(YEAR, e.BirthDate)) AS Age
	from Employees E
	where (DATEPART(YEAR, CURRENT_TIMESTAMP ) -DATEPART(YEAR, e.BirthDate))> 60
	order by E.BirthDate desc;
GO

DROP PROC IF EXISTS Question4_ModelAnswer;
GO
CREATE PROCEDURE Question4_ModelAnswer
AS
	select  E.FirstName, E.LastName, E.Address, E.City, E.Region,O.ShipCountry
	from employees E
	INNER JOIN Orders O on E.EmployeeID = O.EmployeeID
	where O.ShipCountry = 'Belgium';
GO

DROP PROC IF EXISTS Question6_ModelAnswer;
GO
CREATE PROCEDURE Question6_ModelAnswer
AS
	select E.FirstName, E.LastName, C.CompanyName, S.CompanyName
	from Employees e
	INNER JOIN Orders o on E.EmployeeID = O.EmployeeID
	INNER JOIN Customers c on O.CustomerID = C.CustomerID
	INNER JOIN Shippers s on O.ShipVia = S.ShipperID
	where C.City = 'Bruxelles'
	AND
	S.CompanyName = 'Speedy Express';
GO

DROP PROC IF EXISTS Question7_ModelAnswer;
GO
CREATE PROCEDURE Question7_ModelAnswer
AS
	select DISTINCT E.Title, E.FirstName, E.LastName
	from Employees E,
	Orders O,
	 [dbo].[Order Details] D,
	[dbo].[Products] P
	WHERE E.EmployeeID = O.EmployeeID
	AND
	D.OrderID = O.OrderID
	AND
	D.ProductID = P.ProductID
	AND (P.ProductName = 'Gravad Lax' 
	OR P.ProductName = 'Mishi Kobe Niku');
GO

DROP PROC IF EXISTS Question13_ModelAnswer;
GO
CREATE PROCEDURE Question13_ModelAnswer
AS
	select C.CompanyName, COUNT(*) AS '# OF PURCHASES'
	from Customers C, Orders O
	WHERE C.CustomerID = O.CustomerID
	GROUP BY C.CompanyName
	HAVING Count(*) > 10;
GO

DROP PROC IF EXISTS Question8_ModelAnswer;
GO
CREATE PROCEDURE Question8_ModelAnswer
AS
	select DISTINCT E.FirstName, E.LastName, E.City
	from Employees E,
	Orders O,
	Customers C 
	WHERE O.CustomerID = C.CustomerID
	AND E.City = C.City;
GO

DROP PROC IF EXISTS Question10_ModelAnswer;
GO
CREATE PROCEDURE Question10_ModelAnswer
AS
	SELECT DISTINCT E.FirstName, E.LastName,P.ProductName FROM [dbo].[Products] P, [dbo].[Order Details] OD,
	[dbo].[Orders] O,[dbo].[Employees] E
	WHERE P.ProductID = OD.ProductID
	AND
	OD.OrderID = O.OrderID
	AND
	O.EmployeeID = E.EmployeeID
	AND P.ProductName ='CHAI';
GO

DROP PROC IF EXISTS Question18_ModelAnswer;
GO
CREATE PROCEDURE Question18_ModelAnswer
AS
	select [CategoryName], AVG(UnitPrice) AS 'AVERAGE PRICE'
	from Products P, Categories C
	where p.CategoryID = C.CategoryID
	GROUP BY [CategoryName];
GO

DROP PROC IF EXISTS Question11_ModelAnswer;
GO
CREATE PROCEDURE Question11_ModelAnswer
AS
	select  S.SupplierID, S.CompanyName, count(*) as 'No. of Products'
	from Suppliers S, Products P
	where s.SupplierID = p.SupplierID
	group by S.SupplierID, S.CompanyName
	having Count(p.ProductID) > 3;
GO

DROP PROC IF EXISTS Question14_ModelAnswer;
GO
CREATE PROCEDURE Question14_ModelAnswer
AS
	select [ProductName],[CategoryID],[UnitPrice], [UnitsInStock],sum([UnitPrice]*[UnitsInStock]) as 'Total Value'
	from Products P
	group by[ProductName], [CategoryID],[UnitsInStock], [UnitPrice] 
	order by  [CategoryID];
GO

DROP PROC IF EXISTS Question16_ModelAnswer;
GO
CREATE PROCEDURE Question16_ModelAnswer
AS
	select [CompanyName], count([OrderID]) as '# of Orders Placed'
	from [dbo].[Customers] C, [dbo].[Orders] O
	where C.CustomerID = O.CustomerID
	group by [CompanyName];
GO

DROP PROC IF EXISTS Question17_ModelAnswer;
GO
CREATE PROCEDURE Question17_ModelAnswer
AS
	SELECT ProductName,  UnitsOnOrder , UnitsInStock
	FROM Products
	WHERE ((UnitsInStock)<UnitsOnOrder);
GO

DROP PROC IF EXISTS Question12_ModelAnswer;
GO
CREATE PROCEDURE Question12_ModelAnswer
AS
	SELECT COUNT(CustomerID) AS 'Customer Num', Country
	FROM [dbo].[Customers]
	GROUP BY
	Country
	HAVING
	COUNT(CustomerID) > 5
	ORDER BY COUNT(CompanyName) DESC ;
GO

DROP PROC IF EXISTS Question19_ModelAnswer;
GO
CREATE PROCEDURE Question19_ModelAnswer
AS
	SELECT CONCAT([FirstName], ' ', [LastName])AS [EmployeeName], City
	FROM [dbo].[Employees]
	WHERE City LIKE 'S%'
	OR City LIKE 'T%';
GO

DROP PROC IF EXISTS Question15_ModelAnswer;
GO
CREATE PROCEDURE Question15_ModelAnswer
AS
	SELECT CategoryName, ProductName, CompanyName
	FROM [dbo].[Products] P
	INNER JOIN [dbo].[Categories] C
	ON P.CategoryID = C.CategoryID
	INNER JOIN [dbo].[Suppliers] S
	ON P.SupplierID = S.SupplierID
	WHERE CategoryName = 'Condiments';
GO

DROP PROC IF EXISTS Question5_ModelAnswer;
GO
CREATE PROCEDURE Question5_ModelAnswer
AS
	SELECT FirstName, LastName, City, HireDate
		FROM [dbo].[Employees]
		WHERE LastName LIKE 'S%'
		AND FirstName LIKE 'M%';
GO