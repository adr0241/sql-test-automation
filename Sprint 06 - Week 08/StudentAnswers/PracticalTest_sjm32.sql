-- Sarah Mullenger BCDE103 Final Test Sem1 2021 Submission
USE [NORTHWND];
GO

--2. Give the name, address, city, and region of employees.
DROP PROC IF EXISTS Question2;
GO
CREATE PROCEDURE Question2
AS
select FirstName, LastName, Address, City, Region
from Employees;
GO

--3. Give the name, address, city, and region of employees living in USA.
DROP PROC IF EXISTS Question3;
GO
CREATE PROCEDURE Question3
AS
select FirstName, LastName, Address, City, Region, Country
from Employees
where Country = 'USA';
GO
 
--4. Give the name, address, city, and region of employees that have placed orders to be delivered in Belgium. 

DROP PROC IF EXISTS Question4;
GO
CREATE PROCEDURE Question4
AS
select FirstName, LastName, Address, City, Region, ShipCountry
from Employees
INNER JOIN Orders
on Employees.EmployeeID = Orders.EmployeeID
where ShipCountry = 'Belgium';
GO



-- 5. Display the First Name, Last Name, City and Hire Date of Employees whose Last Name starts with 'S' and First Name starts with 'M'.
DROP PROC IF EXISTS Question5;
GO
CREATE PROCEDURE Question5
AS
select FirstName, LastName, HireDate
from Employees
where LastName LIKE 'S%'
and FirstName LIKE 'M%';
GO



-- 6. Give the employee name and the customer name for orders that are sent by the company �Speedy Express� to customers who live in Bruxelles.
DROP PROC IF EXISTS Question6;
GO
CREATE PROCEDURE Question6
AS
select FirstName, LastName, c.CompanyName, s.CompanyName
from Orders o
inner join Customers c
on o.CustomerID = c.CustomerID
inner join Employees e
on o.EmployeeID = e.EmployeeID
inner join Shippers s 
on  s.ShipperID = o.ShipVia
where c.City = 'Bruxelles'
and s.companyname = 'Speedy Express';
GO


/*
7. Give the title and name of employees who have sold at least one of the 
products �Gravad Lax� or �Mishi Kobe Niku�. Names should not repeat if they 
have sold both or one item twice.
*/


DROP PROC IF EXISTS Question7;
GO
CREATE PROCEDURE Question7
AS
select Title, FirstName, LastName
from employees e
inner join Orders o
on e.EmployeeID = o.EmployeeID
inner join  [dbo].[Order Details] od
on o.OrderID = od.OrderID
inner join  Products p
on  od.ProductID = p.ProductID
where ProductName = 'Gravad Lax'
or  ProductName = 'Mishi Kobe Niku'
GROUP BY Title, FirstName, LastName;
GO



-- 8. Give the name of employees and the city where they live for employees who have sold to customers in the same city.
DROP PROC IF EXISTS Question8;
GO
CREATE PROCEDURE Question8
AS
select FirstName, LastName, e.City
from employees e
inner join Orders o
on e.EmployeeID = o.EmployeeID
inner join  Customers c
on o.CustomerID = c.CustomerID
where e.City = c.City
GROUP BY FirstName, LastName, e.City;
GO

-- 6 rows in results, Janet Leverling is missing
-- Double checking - Janet lives in Kirkland, and cannot find a customer who also lives in Kirkland
/*
select FirstName, LastName, e.City, CompanyName, c.City
from employees e
inner join Orders o
on e.EmployeeID = o.EmployeeID
inner join  Customers c
on o.CustomerID = c.CustomerID
where FirstName = 'Janet'
and c.City = 'Kirkland'
*/





--9. Write a query to get the name, address, city, and region of employees older than 60 years.
DROP PROC IF EXISTS Question9;
GO
CREATE PROCEDURE Question9
AS
select FirstName, LastName, Address, City, Region, DATEPART(year, BirthDate) as BIRTHDATE,  DATEDIFF(year,BirthDate, GETDATE()) as Age
from employees e
where  DATEDIFF(year,BirthDate, GETDATE()) > 60
ORDER BY Age;
GO



--10. Give the name of all employees who sold �Chai�.
DROP PROC IF EXISTS Question10;
GO
CREATE PROCEDURE Question10
AS
select FirstName, LastName, ProductName
from employees e
inner join Orders o
on e.EmployeeID = o.EmployeeID
inner join  [dbo].[Order Details] od
on o.OrderID = od.OrderID
inner join  Products p
on  od.ProductID = p.ProductID
where ProductName = 'Chai'
GROUP BY FirstName, LastName, ProductName;
GO




--11. Give the identifier and the name of the companies that provide more than 3 products.
DROP PROC IF EXISTS Question11;
GO
CREATE PROCEDURE Question11
AS
select s.SupplierID, CompanyName, COUNT(ProductID) as 'No. of Products'
from Suppliers s
inner join  Products p
on  s.SupplierID = p.SupplierID
GROUP BY s.SupplierID, CompanyName
having COUNT(ProductID) > 3;
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






/*
12. Write a query that lists the number of customers in each country. Only include 
countries with more than 5 customers and order them by descending order of 
Number of Companies.
(Marks 3)Education and Applied Research Division Department of Computing
BCDE103-2021-Practical Test.docx 1/06/2021Page 3
� Ara Institute of Canterbury
13. Give the name of customers who have MADE MORE THAN 10 purchases OF 
any product. (Marks 3)
14. Give the ProductName, CategoryID, UnitPrice, UnitsInStock and Total Value of 
all the products. (Marks 4)
15. For ALL Condiments, display the Category Name, the Product Name, and the
Company Name of the supplier.
(Marks 4)
16. Make a complete list of customers along with the number of orders they have 
placed. (My query yielded 89 records.)
(Marks 3)
17. Write a query to get Product list (product name, units on order, and units in 
stock) where quantity of stock is less than the quantity on order.
(Marks 4)
18. Give the average price of products by EACH category.
(Marks 2)
19. Display the First Name and Last Name (concatenated) and City of all 
Employees who live in cities that start with the letter �S� or �T�.
(Marks 2
*/