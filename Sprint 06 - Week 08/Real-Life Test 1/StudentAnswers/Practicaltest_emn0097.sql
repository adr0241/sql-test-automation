use NORTHWND;
GO

--1. Restore and select the SQLTest.bak database.

-- 2. Give the name, address, city, and region of employees.
DROP PROC IF EXISTS Question2;
GO
CREATE PROCEDURE Question2
AS
SELECT FirstName, LastName,Address City, Region
FROM Employees;
GO

 
---3. Give the name, address, city, and region of employees living in USA.
DROP PROC IF EXISTS Question3;
GO
CREATE PROCEDURE Question3
AS
SELECT FirstName, LastName, Address City, Region, Country
FROM Employees
WHERE Country = 'USA';
GO


--- come back 
-- 4. Give the name, address, city, and region of employees that have placed orders 

DROP PROC IF EXISTS Question4;
GO






-- 5. Display the First Name, Last Name, City and Hire Date of Employees whose 

-- Last Name starts with 'S' and First Name starts with 'M'.
DROP PROC IF EXISTS Question5;
GO
CREATE PROCEDURE Question5
AS
SELECT FirstName, LastName,city, HireDate
FROM Employees 
where LastName like 'S%' AND FirstName LIKE 'M%';
GO


-- NNNAAA
---6. Give the employee name and the customer name for orders that are sent by 
--the company �Speedy Express� to customers who live in C.
DROP PROC IF EXISTS Question6;
GO
CREATE PROCEDURE Question6
AS
SELECT FirstName, LastName, C.CompanyName, S.CompanyName
FROM Employees e
INNER JOIN ORDERS o
on e.EmployeeID = o.EmployeeID
inner join Customers c
on o.CustomerID = c.CustomerID
inner join Shippers s
on o.ShipName = s.CompanyName
WHERE S.CompanyName = 'Speedy Express'  AND C.CITY = 'Bruxelles';
GO







-- 7. Give the title and name of employees who have sold at least one of the 
-- products �Gravad Lax� or �Mishi Kobe Niku�. Names should not repeat if they 
--have sold both or one item twice.
DROP PROC IF EXISTS Question7;
GO
CREATE PROCEDURE Question7
AS
Select title, firstName, lastName
from Employees e
inner join Orders o
on e.EmployeeID = o.EmployeeID
inner join [Order Details] od
on o.OrderID = od.OrderID
inner join products p
on od.ProductID = p.ProductID
where p.ProductName = 'Gravad Lax'  or p.ProductName = 'Mishi Kobe Niku'
Group by e.FirstName, e.LastName, Title;
GO


-- !! REVIEW
--8. Give the name of employees and the city where they live for employees who 
--have sold to customers in the same city.
DROP PROC IF EXISTS Question8;
GO
CREATE PROCEDURE Question8
AS
Select firstName, lastName, c.City
from Employees e
inner join Orders o
on e.EmployeeID = o.EmployeeID
inner join Customers c
on o.CustomerID = c.CustomerID
where e.City = c.City
group by firstName, lastName, c.City;
GO


--9. Write a query to get the name, address, city, and region of employees older 
--than 60 years.
DROP PROC IF EXISTS Question9;
GO



--10. Give the name of all employees who sold �Chai�.
DROP PROC IF EXISTS Question10;
GO
CREATE PROCEDURE Question10
AS
Select firstName, lastName, p.ProductName
from Employees e
inner join Orders o
on e.EmployeeID = o.EmployeeID
inner join [Order Details] od
on o.OrderID = od.OrderID
inner join products p
on od.ProductID = p.ProductID
where p.ProductName = 'chai' 
Group by e.FirstName, e.LastName, p.ProductName;
GO




--11. Give the identifier and the name of the companies that provide more than 3 products.
DROP PROC IF EXISTS Question11;
GO
-- 12  Write a query that lists the number of customers in each country. Only include 
--countries with more than 5 customers and order them by descending order of 
-- Number of Companies.

DROP PROC IF EXISTS Question12;
GO
CREATE PROCEDURE Question12
AS
Select count (customerID) as ' customer Num', country
From Customers
group by Country
having count (customerID) > 5
order by count (customerID) desc;
GO


--13. Give the name of customers who have MADE MORE THAN 10 purchases OF any product. 
DROP PROC IF EXISTS Question13;
GO
CREATE PROCEDURE Question13
AS
Select c.CompanyName, COUNT(DISTINCT od.OrderID) as ' # of purchase' 
from customers c
inner join Orders o
on c.customerID = o.CustomerID
inner join [Order Details] od
on o.OrderID = od.OrderID
inner join products p
on od.ProductID = p.ProductID
Group by c.CompanyName
having COUNT(DISTINCT od.OrderID) > 10;
GO


--14. Give the ProductName, CategoryID, UnitPrice, UnitsInStock and Total Value of all the products.
DROP PROC IF EXISTS Question14;
GO
CREATE PROCEDURE Question14
AS
SELECT ProductName, CategoryID, UnitPrice,  UnitsInStock, UnitPrice * UnitsInStock As 'Total Value'  
FROM Products;
GO




-- 15. For ALL Condiments, display the Category Name, the Product Name, and the Company Name of the supplier.
DROP PROC IF EXISTS Question15;
GO
CREATE PROCEDURE Question15
AS
Select c.CategoryName, ProductName, s.companyName
 From Categories c
 inner join Products p
 on c.CategoryID = p. CategoryID
 inner join Suppliers s
 on p.SupplierID = s.SupplierID
Where  c.CategoryName = 'Condiments'  ;
GO


-- 16. Make a complete list of customers along with the number of orders they have placed. (My query yielded 89 records.)
DROP PROC IF EXISTS Question16;
GO
CREATE PROCEDURE Question16
AS
Select c.CompanyName, count(orderID)
from Customers c
inner join Orders o
on c.CustomerID = o.CustomerID
Group by c.CompanyName;
GO

/*
17. Write a query to get Product list (product name, units on order, and units in 
stock) where quantity of stock is less than the quantity on order.


18. Give the average price of products by EACH category.



19. Display the First Name and Last Name (concatenated) and City of all 
Employees who live in cities that start with the letter �S� or �T�.
(Marks 2)*/

DROP PROC IF EXISTS Question17;
GO
DROP PROC IF EXISTS Question18;
GO
DROP PROC IF EXISTS Question19;
GO