use [NORTHWND];
GO

/*2Give the name, address, city, and region of employees.*/
DROP PROC IF EXISTS Question2;
GO
CREATE PROCEDURE Question2
AS
select [FirstName], [LastName], [Address], [City], [Region]
from [dbo].[Employees];
GO

/*3.Give the name, address, city, and region of employees living in USA.*/
DROP PROC IF EXISTS Question3;
GO
CREATE PROCEDURE Question3
AS
select [FirstName], [LastName], [Address], [City], [Region], [Country]
from [dbo].[Employees]
where [Country] = 'USA'; 
GO

/*4. Give the name, address, city, and region of employees that have placed orders 
to be delivered in Belgium.*/
DROP PROC IF EXISTS Question4;
GO
CREATE PROCEDURE Question4
AS
select [FirstName], [LastName], [Address], [City], [Region], [Country],[ShipCountry]
from [dbo].[Employees]inner join [dbo].[Orders]
on [dbo].[Orders].[EmployeeID]=[dbo].[Employees].[EmployeeID]
where  [ShipCountry]= 'Belgium';
GO

/*5.Display the First Name, Last Name, City and Hire Date of Employees whose 
Last Name starts with 'S' and First Name starts with 'M'.*/
DROP PROC IF EXISTS Question5;
GO
CREATE PROCEDURE Question5
AS
select [FirstName], [LastName], [City], [HireDate]
from [dbo].[Employees]
where [LastName] like 'S%'
and [FirstName] like 'M%';
GO



/*6. Give the employee name and the customer name for orders that are sent by 
the company �Speedy Express� to customers who live in Bruxelles.
*/
DROP PROC IF EXISTS Question6;
GO
CREATE PROCEDURE Question6
AS
select [FirstName], [LastName], [dbo].[Customers].[CompanyName], [Shippers].[CompanyName]
from [dbo].[Customers] inner join [dbo].[Orders]
on [dbo].[Customers].[CustomerID]=[dbo].[Orders].[CustomerID] inner join [dbo].[Employees]
on [dbo].[Employees].[EmployeeID]=[dbo].[Orders].[EmployeeID] inner join [dbo].[Shippers]
on [dbo].[Shippers].[ShipperID]=[dbo].[Orders].[ShipVia]
where [Shippers].[CompanyName]='Speedy Express'
or [dbo].[Employees].[City] = 'Bruxelles';
GO

/*select [FirstName], [LastName]
from [dbo].[Employees] where 
(select [dbo].[Customers].[CompanyName], [Shippers].[CompanyName]
from [dbo].[Customers] inner join [dbo].[Orders]
on [dbo].[Customers].[CustomerID]=[dbo].[Orders].[CustomerID] inner join [dbo].[Shippers]
on [dbo].[Shippers].[ShipperID]=[dbo].[Orders].[ShipVia]
where [Shippers].[CompanyName]='Speedy Express')*/




/*7Give the title and name of employees who have sold at least one of the 
products �Gravad Lax� or �Mishi Kobe Niku�. Names should not repeat if they 
have sold both or one item twice.*/
DROP PROC IF EXISTS Question7;
GO
CREATE PROCEDURE Question7
AS
select distinct [Title], [FirstName], [LastName]
from [dbo].[Employees] inner join [dbo].[Orders] 
on [dbo].[Employees].[EmployeeID]=[dbo].[Orders].[EmployeeID] inner join [dbo].[Order Details]
on [dbo].[Orders].[OrderID] = [dbo].[Order Details].[OrderID] inner join [dbo].[Products]
on [dbo].[Order Details].[ProductID]=[dbo].[Products].[ProductID]
where [ProductName] in ('Gravad Lax' , 'Mishi Kobe Niku');
GO


/*8. Give the name of employees and the city where they live for employees who 
have sold to customers in the same city*/
DROP PROC IF EXISTS Question8;
GO
CREATE PROCEDURE Question8
AS
select distinct [FirstName],[LastName],[dbo].[Employees].[City]
from [dbo].[Employees] inner join [dbo].[Orders]
on [dbo].[Employees].[EmployeeID]=[dbo].[Orders].[EmployeeID] inner join [dbo].[Customers]
on [dbo].[Orders].[CustomerID]=[dbo].[Customers].[CustomerID]
where [dbo].[Employees].[City]=[dbo].[Customers].[City];
GO

/*9.Write a query to get the name, address, city, and region of employees older 
than 60 years.*/
DROP PROC IF EXISTS Question9;
GO
CREATE PROCEDURE Question9
AS
Select [FirstName],[LastName],[Address],[City],[Region],[BirthDate], DATEDIFF(year,[BirthDate], '2021-06-02') as 'Age'
from [dbo].[Employees]
where DATEDIFF(year,[BirthDate], '2021-06-02')>60
order by DATEDIFF(year,[BirthDate], '2021-06-02');
GO



/*10. Give the name of all employees who sold �Chai�.*/
DROP PROC IF EXISTS Question10;
GO
CREATE PROCEDURE Question10
AS
select distinct [FirstName], [LastName], [ProductName]
from [dbo].[Employees] inner join [dbo].[Orders] 
on [dbo].[Employees].[EmployeeID]=[dbo].[Orders].[EmployeeID] inner join [dbo].[Order Details]
on [dbo].[Orders].[OrderID] = [dbo].[Order Details].[OrderID] inner join [dbo].[Products]
on [dbo].[Order Details].[ProductID]=[dbo].[Products].[ProductID]
where [ProductName] = 'Chai';
GO


/*11Give the identifier and the name of the companies that provide more than 3 
products.*/
DROP PROC IF EXISTS Question11;
GO
CREATE PROCEDURE Question11
AS
select [dbo].[Products].[SupplierID], [CompanyName], count([ProductID])
from [dbo].[Products] inner join [dbo].[Suppliers] on [dbo].[Products].[SupplierID]=[dbo].[Suppliers].[SupplierID]
group by [dbo].[Products].[SupplierID], [CompanyName]
Having count([ProductID])>3;
GO


/*12. Write a query that lists the number of customers in each country. Only include 
countries with more than 5 customers and order them by descending order of 
Number of Companies.*/
DROP PROC IF EXISTS Question12;
GO
CREATE PROCEDURE Question12
AS
select count([CustomerID]) as 'Custumer Num', [Country]
from [dbo].[Customers]
group by [Country]
having count([CustomerID])>5
order by count([CustomerID]) desc;
GO


/*13. Give the name of customers who have MADE MORE THAN 10 purchases OF 
any product.*/
DROP PROC IF EXISTS Question13;
GO
CREATE PROCEDURE Question13
AS
select [CompanyName], count([OrderID]) as '# of purchases'
from [dbo].[Orders] inner join [dbo].[Customers]
on  [dbo].[Orders].[CustomerID]=[dbo].[Customers].[CustomerID]
group by [CompanyName]
having count([OrderID])>10;
GO


/*
14. Give the ProductName, CategoryID, UnitPrice, UnitsInStock and Total Value of 
all the products.*/
DROP PROC IF EXISTS Question14;
GO
CREATE PROCEDURE Question14
AS
select [ProductName], [CategoryID], [UnitPrice], [UnitsInStock], ([UnitPrice]*[UnitsInStock]) as 'Total Value'
from [dbo].[Products];
GO



/*15. For ALL Condiments, display the Category Name, the Product Name, and the
Company Name of the supplier.*/
DROP PROC IF EXISTS Question15;
GO
CREATE PROCEDURE Question15
AS
select [CategoryName], [ProductName], [dbo].[Suppliers].[CompanyName]
from [dbo].[Categories] inner join [dbo].[Products]
on [dbo].[Products].[CategoryID]=[dbo].[Categories].[CategoryID] inner join [dbo].[Suppliers] 
on [dbo].[Suppliers].[SupplierID]=[dbo].[Products].[SupplierID]
where [CategoryName]= 'Condiments';
GO


/*16. Make a complete list of customers along with the number of orders they have 
placed. (My query yielded 89 records.)*/
DROP PROC IF EXISTS Question16;
GO
CREATE PROCEDURE Question16
AS
select [CompanyName], count([OrderID]) as '# of orders placed'
from [dbo].[Orders] inner join [dbo].[Customers]
on [dbo].[Customers].[CustomerID]=[dbo].[Orders].[CustomerID]
group by [CompanyName];
GO

/*
17. Write a query to get Product list (product name, units on order, and units in 
stock) where quantity of stock is less than the quantity on order.
*/
DROP PROC IF EXISTS Question17;
GO
CREATE PROCEDURE Question17
AS
select [ProductName], sum([UnitsOnOrder]) as 'unit in order' , sum([UnitsInStock]) as 'unit in stock'
from [dbo].[Products]
group by productname
having sum([UnitsOnOrder])>sum([UnitsInStock]);
GO


/*
18. Give the average price of products by EACH category.
*/
DROP PROC IF EXISTS Question18;
GO
CREATE PROCEDURE Question18
AS
select [CategoryName], avg([UnitPrice]) as 'Average price'
from [dbo].[Products] inner join [dbo].[Categories]
on [dbo].[Products].[CategoryID]=[dbo].[Categories].[CategoryID]
group by [CategoryName];
GO


/*19. Display the First Name and Last Name (concatenated) and City of all 
Employees who live in cities that start with the letter �S� or �T�.*/
DROP PROC IF EXISTS Question19;
GO
CREATE PROCEDURE Question19
AS
select concat([FirstName], ' ', [LastName]) as 'Employee Name', [City]
from [dbo].[Employees]
where [City] like 'S%'
or [City] like 'T%';
GO