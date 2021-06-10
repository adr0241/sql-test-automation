use [NORTHWND];
GO

/*
select * from Orders
where [ShipCountry] = 'belgium'*/

--Q2
DROP PROC IF EXISTS Question2;
GO
CREATE PROCEDURE Question2
AS
Select [FirstName], [LastName], [Address], [City], [Region]
from [dbo].[Employees];
GO

--Q3
DROP PROC IF EXISTS Question3;
GO
CREATE PROCEDURE Question3
AS
Select [FirstName], [LastName], [Address], [City], [Region], [Country]
from [dbo].[Employees]
WHERE Country = 'USA';
GO

--Q4
DROP PROC IF EXISTS Question4;
GO
CREATE PROCEDURE Question4
AS
Select [FirstName], [LastName], [Address], [City], [Region], ShipCountry
from [dbo].[Employees]
inner join Orders
on Employees.EmployeeID = Orders.EmployeeID
WHERE ShipCountry = 'belgium' ;
GO

--Q5
DROP PROC IF EXISTS Question5;
GO
CREATE PROCEDURE Question5
AS
Select [FirstName], [LastName], [City], [HireDate]
from [dbo].[Employees]
WHERE LastName like '%S%'
and FirstName like '%M%' ;
GO

--Q6???
DROP PROC IF EXISTS Question6;
GO



--Q7??
DROP PROC IF EXISTS Question7;
GO
CREATE PROCEDURE Question7
AS
select distinct [FirstName], [LastName], [Title], [ProductName] 
from [dbo].[Employees]
inner join [dbo].[Orders]
on [dbo].[Employees].[EmployeeID] = [dbo].[Orders].[EmployeeID]
inner join [dbo].[Order Details]
on [dbo].[Orders].[OrderID] = [dbo].[Order Details].OrderID
inner join [dbo].[Products]
on [dbo].[Order Details].ProductID = [dbo].[Products].ProductID
where [ProductName] = 'Gravad Lax'
or [ProductName] = 'Mishi Kobe Niku';
GO

--Q8
DROP PROC IF EXISTS Question8;
GO

--Q9
DROP PROC IF EXISTS Question9;
GO
CREATE PROCEDURE Question9
AS
Select [FirstName], [LastName], DATEDIFF(DAY,[BirthDate], GetDate()) / 365 as age 
from [dbo].[Employees]
group by BirthDate, [FirstName], [LastName]
having DATEDIFF(DAY,[BirthDate], GetDate()) / 365 >= 60;
GO

--Q10
DROP PROC IF EXISTS Question10;
GO
CREATE PROCEDURE Question10
AS
select distinct [FirstName], [LastName], [Title], [ProductName] 
from [dbo].[Employees]
inner join [dbo].[Orders]
on [dbo].[Employees].[EmployeeID] = [dbo].[Orders].[EmployeeID]
inner join [dbo].[Order Details]
on [dbo].[Orders].[OrderID] = [dbo].[Order Details].OrderID
inner join [dbo].[Products]
on [dbo].[Order Details].ProductID = [dbo].[Products].ProductID
where [ProductName] = 'Chai';
GO

--Q11
DROP PROC IF EXISTS Question11;
GO
CREATE PROCEDURE Question11
AS
select Products.SupplierID, Suppliers.CompanyName, count(Products.ProductID)
from Suppliers
inner join Products
on Suppliers.SupplierID = Products.SupplierID
group by Products.SupplierID, Suppliers.CompanyName
having count(Products.ProductID) >= '3';
GO

--Q12
DROP PROC IF EXISTS Question12;
GO
CREATE PROCEDURE Question12
AS
select count(ContactName)
from Customers;
GO

--Q13
DROP PROC IF EXISTS Question13;
GO
CREATE PROCEDURE Question13
AS
select CompanyName, count(Orders.CustomerID) as #ofOrders
from Customers
inner join Orders
on Customers.CustomerID = Orders.CustomerID
group by CompanyName
having count(Orders.CustomerID) > '10';
GO

--Q14
DROP PROC IF EXISTS Question14;
GO
CREATE PROCEDURE Question14
AS
select ProductName, Products.CategoryID, UnitPrice, UnitsInStock, (UnitPrice * UnitsInStock) as TotalValue
from Products
inner join Categories
on Products.CategoryID = Categories.CategoryID
group by ProductName, Products.CategoryID, UnitPrice, UnitsInStock;
GO

--Q15
DROP PROC IF EXISTS Question15;
GO

--Q16
DROP PROC IF EXISTS Question16;
GO
CREATE PROCEDURE Question16
AS
select CompanyName, count(Orders.CustomerID) as #ofOrders
from Customers
inner join Orders
on Customers.CustomerID = Orders.CustomerID
group by CompanyName;
GO

--Q17
DROP PROC IF EXISTS Question17;
GO
CREATE PROCEDURE Question17
AS
select ProductName, Products.CategoryID, UnitPrice, UnitsInStock, (UnitPrice * UnitsInStock) as TotalValue
from Products
inner join Categories
on Products.CategoryID = Categories.CategoryID
group by ProductName, Products.CategoryID, UnitPrice, UnitsInStock;
GO
