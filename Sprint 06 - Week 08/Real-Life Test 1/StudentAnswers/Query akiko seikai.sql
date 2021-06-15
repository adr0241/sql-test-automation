use [NORTHWND];
GO


--2. Give the name, address, city, and region of employees.
DROP PROC IF EXISTS Question2;
GO
CREATE PROCEDURE Question2
AS
select [FirstName], [LastName], [Address], [City], [Region]
from [dbo].[Employees];
GO



--3. Give the name, address, city, and region of employees living in USA.
DROP PROC IF EXISTS Question3;
GO
CREATE PROCEDURE Question3
AS
select [FirstName], [LastName], [Address], [City], [Region], [Country]
from [dbo].[Employees]
where [Country] = 'USA';
GO



--4. Give the name, address, city, and region of employees that have placed orders to be delivered in Belgium.
DROP PROC IF EXISTS Question4;
GO
CREATE PROCEDURE Question4
AS 
select [FirstName], [LastName], [Address], [City], [Region], [ShipCountry]
from [dbo].[Employees]
inner join [dbo].[Orders]
on [dbo].[Employees].EmployeeID = [dbo].[Orders].EmployeeID
where [ShipCountry] = 'Belgium';
GO


--5. Display the First Name, Last Name, City and Hire Date of Employees whose Last Name starts with 'S' and First Name starts with 'M'.
DROP PROC IF EXISTS Question5;
GO
CREATE PROCEDURE Question5
AS
select  [FirstName], [LastName], [City], [HireDate]
from [dbo].[Employees]
where [LastName] like 'S%'
and [FirstName] like 'M%';
GO



--6. Give the employee name and the customer name for orders that are sent by the company �Speedy Express� to customers who live in Bruxelles.
DROP PROC IF EXISTS Question6;
GO
CREATE PROCEDURE Question6
AS
select  [FirstName], [LastName], [dbo].[Customers].[CompanyName], [dbo].[Shippers].[CompanyName]
from [dbo].[Employees], [dbo].[Orders], [dbo].[Shippers], [dbo].[Customers]
where [dbo].[Employees].EmployeeID = [dbo].[Orders].EmployeeID
and [dbo].[Orders].[ShipVia] = [dbo].[Shippers].ShipperID
and [dbo].[Orders].CustomerID = [dbo].[Customers].CustomerID
and [dbo].[Shippers].[CompanyName] = 'Speedy Express'
and [dbo].[Customers].[City] = 'Bruxelles';
GO




--7. Give the title and name of employees who have sold at least one of the 
--products �Gravad Lax� or �Mishi Kobe Niku�. Names should not repeat if they 
--have sold both or one item twice.
DROP PROC IF EXISTS Question7;
GO
CREATE PROCEDURE Question7
AS
select distinct [Title], [FirstName], [LastName]
from [dbo].[Employees]
inner join [dbo].[Orders]
on [dbo].[Employees].EmployeeID = [dbo].[Orders].EmployeeID
inner join [dbo].[Order Details]
on [dbo].[Orders].OrderID = [dbo].[Order Details].OrderID
inner join [dbo].[Products]
on [dbo].[Order Details].ProductID = [dbo].[Products].ProductID
where [ProductName] = 'Gravad Lax'
or [ProductName] = 'Mishi Kobe Niku';
GO



--8. Give the name of employees and the city where they live for employees who have sold to customers in the same city.
DROP PROC IF EXISTS Question8;
GO
CREATE PROCEDURE Question8
AS
select [dbo].[Employees].[FirstName], [dbo].[Employees].[LastName], [dbo].[Employees].[City]
from [dbo].[Employees]
inner join [dbo].[Orders]
on [dbo].[Employees].EmployeeID = [dbo].[Orders].EmployeeID
inner join [dbo].[Customers]
on [dbo].[Orders].CustomerID = [dbo].[Customers].CustomerID
group by [FirstName], [LastName], [dbo].[Employees].[City], [dbo].[Customers].City
having [dbo].[Customers].City = [dbo].[Employees].City
order by [FirstName];
GO


/*--varify the answer for Q8
select [dbo].[Employees].[FirstName], [dbo].[Employees].[LastName], [dbo].[Employees].[City], [dbo].[Customers].[City]
from [dbo].[Employees]
inner join [dbo].[Orders]
on [dbo].[Employees].EmployeeID = [dbo].[Orders].EmployeeID
inner join [dbo].[Customers]
on [dbo].[Orders].CustomerID = [dbo].[Customers].CustomerID
and [dbo].[Employees].[FirstName] = 'Janet'
and [dbo].[Employees].[LastName] = 'Leverling'
group by [FirstName], [LastName], [dbo].[Employees].[City], [dbo].[Customers].City
order by [FirstName];*/



--9. Write a query to get the name, address, city, and region of employees older than 60 years.
DROP PROC IF EXISTS Question9;
GO
CREATE PROCEDURE Question9
AS
select [FirstName], [LastName], [Address], [City], [Region], year([BirthDate]) as 'BIRTHDATE', DATEDIFF(YY, [BirthDate], getdate()) as 'Age'
from [dbo].[Employees]
where 60 < DATEDIFF(YY, [BirthDate], getdate())
order by  Age;
GO


--10. Give the name of all employees who sold �Chai�.
DROP PROC IF EXISTS Question10;
GO
CREATE PROCEDURE Question10
AS
select distinct [FirstName], [LastName], [ProductName]
from [dbo].[Employees]
inner join [dbo].[Orders]
on [dbo].[Employees].EmployeeID = [dbo].[Orders].EmployeeID
inner join [dbo].[Order Details]
on [dbo].[Orders].OrderID = [dbo].[Order Details].OrderID
inner join [dbo].[Products]
on [dbo].[Order Details].ProductID = [dbo].[Products].ProductID
where [ProductName] = 'Chai';
GO



--11. Give the identifier and the name of the companies that provide more than 3 products.
DROP PROC IF EXISTS Question11;
GO
CREATE PROCEDURE Question11
AS
select [dbo].[Suppliers].[SupplierID], [dbo].[Suppliers].[CompanyName], count([ProductID]) as 'No. of Products'
from [dbo].[Suppliers]
inner join [dbo].[Products]
on [dbo].[Suppliers].[SupplierID] = [dbo].[Products].[SupplierID]
group by [dbo].[Suppliers].[SupplierID], [dbo].[Suppliers].[CompanyName]
having count([ProductID]) > 3;
GO



--12. Write a query that lists the number of customers in each country. 
--Only include countries with more than 5 customers and order them by descending order of Number of Companies.
DROP PROC IF EXISTS Question12;
GO
CREATE PROCEDURE Question12
AS
select count([CustomerID]) as 'Customer Num', [Country]
from [dbo].[Customers]
group by [Country]
having count([CustomerID]) >5
order by count([CustomerID]) desc;
GO


--13. Give the name of customers who have MADE MORE THAN 10 purchases OF any product. 
DROP PROC IF EXISTS Question13;
GO
CREATE PROCEDURE Question13
AS
select [CompanyName], count([OrderID]) as 'OF PURCHASES'
from [dbo].[Orders] 
inner join [dbo].[Customers]
on [dbo].[Orders].CustomerID = [dbo].[Customers].CustomerID
group by [CompanyName]
having count([OrderID]) > 10;
GO



--14. Give the ProductName, CategoryID, UnitPrice, UnitsInStock and Total Value of all the products.
DROP PROC IF EXISTS Question14;
GO
CREATE PROCEDURE Question14
AS
select [ProductName], [CategoryID], [UnitPrice], [UnitsInStock], sum([UnitPrice]* [UnitsInStock]) as 'Total Value'
from [dbo].[Products]
group by  [ProductName], [CategoryID], [UnitPrice], [UnitsInStock], [UnitsOnOrder] 
order by [CategoryID];
GO



--15. For ALL Condiments, display the Category Name, the Product Name, and theCompany Name of the supplier.
DROP PROC IF EXISTS Question15;
GO
CREATE PROCEDURE Question15
AS
select [CategoryName], [ProductName], [dbo].[Suppliers].[CompanyName]
from [dbo].[Categories]
inner join [dbo].[Products]
on [dbo].[Categories].CategoryID = [dbo].[Products].CategoryID
inner join [dbo].[Suppliers]
on [dbo].[Products].SupplierID = [dbo].[Suppliers].SupplierID
where [CategoryName] = 'Condiments';
GO


--16. Make a complete list of customers along with the number of orders they have placed. (My query yielded 89 records.)
DROP PROC IF EXISTS Question16;
GO
CREATE PROCEDURE Question16
AS
select [dbo].[Customers].[CompanyName],  count([OrderID]) as '# of Orders Placed'
from [dbo].[Customers]
inner join [dbo].[Orders]
on [dbo].[Customers].[CustomerID] = [dbo].[Orders].[CustomerID]
group by [dbo].[Customers].[CompanyName];
GO


--17. Write a query to get Product list (product name, units on order, and units in stock) where quantity of stock is less than the quantity on order.
DROP PROC IF EXISTS Question17;
GO
CREATE PROCEDURE Question17
AS
select [ProductName], [UnitsOnOrder], [UnitsInStock]
from [dbo].[Products]
where [UnitsInStock] < [UnitsOnOrder];
GO



--18. Give the average price of products by EACH category.
DROP PROC IF EXISTS Question18;
GO
CREATE PROCEDURE Question18
AS
select [CategoryName], avg([UnitPrice]) as 'AVERAGE PRICE'
from [dbo].[Categories]
inner join [dbo].[Products]
on [dbo].[Categories].CategoryID = [dbo].[Products].CategoryID
group by [CategoryName];
GO



--19. Display the First Name and Last Name (concatenated) and City of all Employees who live in cities that start with the letter �S� or �T�.
DROP PROC IF EXISTS Question19;
GO
CREATE PROCEDURE Question19
AS
select CONCAT([FirstName],' ', [LastName]) as 'EmployeeName', [City]
from [dbo].[Employees]
where [City] like 'S%'
or [City] like 'T%';
GO