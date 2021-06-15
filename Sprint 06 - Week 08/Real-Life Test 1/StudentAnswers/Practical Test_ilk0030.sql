/*
BCDE103 Database Design
Practical Test
Ilya Kriel
2021
*/

USE [NORTHWND];
go

-- Queries
-- Q2 Give the name, address, city, and region of employees.
DROP PROC IF EXISTS Question2;
GO
CREATE PROCEDURE Question2
AS
select 
e.FirstName,
e.Address,
e.City,
e.Region
from Employees e;
GO

-- Q3 Give the name, address, city, and region of employees living in USA.
DROP PROC IF EXISTS Question3;
GO
CREATE PROCEDURE Question3
AS
select 
e.FirstName,
e.Address,
e.City,
e.Region
from Employees e
where e.Country = 'USA';
GO

-- select * from Employees

-- Q4 Give the name, address, city, and region of employees that have placed orders to be delivered in Belgium. 
DROP PROC IF EXISTS Question4;
GO
CREATE PROCEDURE Question4
AS
select 
e.FirstName,
e.Address,
e.City,
e.Region
from Employees e
JOIN Orders o ON o.EmployeeID = e.EmployeeID
Where o.ShipCountry = 'Belgium';
GO

-- Q5 Display the First Name, Last Name, City and Hire Date of Employees 
	-- whose Last Name starts with 'S' and First Name starts with 'M'.
DROP PROC IF EXISTS Question5;
GO
CREATE PROCEDURE Question5
AS
select 
e.FirstName,
e.Address,
e.City,
e.HireDate
from Employees e
where e.LastName like 'S%' and e.FirstName like 'M%';
GO

-- Q6 Give the employee name and the customer name for orders
	-- that are sent by the company �Speedy Express� to customers who live in Bruxelles.
DROP PROC IF EXISTS Question6;
GO
CREATE PROCEDURE Question6
AS
select 
e.FirstName,
e.LastName,
c.CompanyName,
s.CompanyName 
from Employees e
JOIN Orders o ON o.EmployeeID = e.EmployeeID
JOIN Customers c ON c.CustomerID = o.CustomerID
JOIN Shippers s ON s.ShipperID = o.ShipVia
where s.CompanyName = 'Speedy Express' AND c.City = 'Bruxelles';
GO

-- Q7 Give the title and name of employees who have sold at least one of the 
	-- products �Gravad Lax� or �Mishi Kobe Niku�. Names should not repeat if they 
	-- have sold both or one item twice.
DROP PROC IF EXISTS Question7;
GO
CREATE PROCEDURE Question7
AS
select distinct 
e.Title,
e.FirstName,
e.LastName,
p.ProductName
from Employees e
JOIN Orders o ON o.EmployeeID = e.EmployeeID
JOIN [Order Details] od ON od.OrderID = o.OrderID
JOIN Products p ON p.ProductID = od.ProductID
where p.ProductName = 'Gravad Lax' or p.ProductName = 'Mishi Kobe Niku';
GO


/*select * from Employees
select * from Orders
select * from [Order Details]
select * from Products*/



-- Q8  Give the name of employees and the city where they live for employees who 
-- have sold to customers in the same city.
DROP PROC IF EXISTS Question8;
GO
CREATE PROCEDURE Question8
AS
select distinct
e.FirstName,
e.LastName,
e.City 
from Employees e
JOIN Orders o ON o.EmployeeID = e.EmployeeID
JOIN Customers c ON c.CustomerID = o.CustomerID
where e.City = c.City;
GO


-- Q9 Write a query to get the name, address, city, and region of employees older 
-- than 60 years.
DROP PROC IF EXISTS Question9;
GO
CREATE PROCEDURE Question9
AS
select 
e.FirstName,
e.LastName,
e.Address,
e.City,
e.Region,
e.BirthDate,
DATEDIFF(YEAR, e.BirthDate, GETDATE()) AS Age
from Employees e
where DATEDIFF(YEAR, e.BirthDate, GETDATE()) > 60;
GO

-- Q10 Give the name of all employees who sold �Chai�.
DROP PROC IF EXISTS Question10;
GO
CREATE PROCEDURE Question10
AS
select distinct 
e.FirstName,
e.LastName,
p.ProductName
from Employees e
JOIN Orders o ON o.EmployeeID = e.EmployeeID
JOIN [Order Details] od ON od.OrderID = o.OrderID
JOIN Products p ON p.ProductID = od.ProductID
where p.ProductName = 'chai';
GO

-- Q11 Give the identifier and the name of the companies that provide more than 3 products.
DROP PROC IF EXISTS Question11;
GO
CREATE PROCEDURE Question11
AS
select distinct
s.SupplierID,
s.CompanyName,
COUNT(s.SupplierID) AS 'Number of products'
from Suppliers s
JOIN Products p ON p.SupplierID = s.SupplierID
group by s.SupplierID, s.CompanyName
having COUNT(s.SupplierID) > 3;
GO

-- Q12  Write a query that lists the number of customers in each country. Only include 
-- countries with more than 5 customers and order them by descending order of 
-- Number of Companies.
DROP PROC IF EXISTS Question12;
GO
CREATE PROCEDURE Question12
AS
select 
COUNT(Distinct (c.City)) AS 'Customer Num',
c.City
from Customers c
group by c.City
having COUNT(Distinct (c.City)) > 5
Order by COUNT(c.CompanyName);
GO


--select * from Customers


-- Q13 Give the name of customers who have MADE MORE THAN 10 purchases OF 
-- any product.
DROP PROC IF EXISTS Question13;
GO
CREATE PROCEDURE Question13
AS
Select * 
from Orders o
JOIN Customers c ON c.CustomerID = o.CustomerID
JOIN [Order Details] od ON od.OrderID = o.OrderID;
GO

/*select * from [Order Details]
select * from Orders*/

-- Q14  Give the ProductName, CategoryID, UnitPrice, UnitsInStock and Total Value of 
-- all the products.
DROP PROC IF EXISTS Question14;
GO
CREATE PROCEDURE Question14
AS
select 
p.ProductName,
c.CategoryID,
p.UnitPrice,
p.UnitsInStock,
SUM(od.UnitPrice) AS 'Total Value'
from [Order Details] od
JOIN Products p ON p.ProductID = od.ProductID
JOIN Categories c ON p.CategoryID = c.CategoryID
group by p.ProductName, c.CategoryID, p.UnitPrice, p.UnitsInStock;
GO

/*select * from Products
select * from [Order Details]*/



-- Q15 For ALL Condiments, display the Category Name, the Product Name, and the
-- Company Name of the supplier.
DROP PROC IF EXISTS Question15;
GO
CREATE PROCEDURE Question15
AS
select
c.CategoryName,
p.ProductName,
s.CompanyName 
from Products p
JOIN Suppliers s ON s.SupplierID = p.SupplierID
JOIN Categories c ON c.CategoryID = p.CategoryID
where c.CategoryName = 'Condiments';
GO

-- Q16
DROP PROC IF EXISTS Question16;
GO

-- Q17 Write a query to get Product list (product name, units on order, and units in 
-- stock) where quantity of stock is less than the quantity on order.
DROP PROC IF EXISTS Question17;
GO
CREATE PROCEDURE Question17
AS
select 
p.ProductName,
p.UnitsOnOrder,
p.UnitsInStock 
from Products p
where p.UnitsInStock > p.UnitsOnOrder;
GO


/*select * from [Order Details]
select * from Products*/

-- Q18 Display the First Name and Last Name (concatenated) and City of all 
-- Employees who live in cities that start with the letter �S� or �T�.

DROP PROC IF EXISTS Question18;
GO

DROP PROC IF EXISTS Question19;
GO