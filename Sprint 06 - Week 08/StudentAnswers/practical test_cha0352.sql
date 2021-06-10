use NORTHWND;
GO

DROP PROC IF EXISTS Question2;
GO
CREATE PROCEDURE Question2
AS
select [LastName],[FirstName], [Region], [City] from [dbo].[Employees];
GO

/* 3.	Give the name, address, city, and region of employees living in USA. */
DROP PROC IF EXISTS Question3;
GO
CREATE PROCEDURE Question3
AS
select concat([FirstName],' ',[LastName]) as 'Full Name', [Address], [Country] from [dbo].[Employees]
where Country = 'USA';
GO

/*  Give the name, address, city, and region of employees that have placed orders
to be delivered in Belgium.  */
DROP PROC IF EXISTS Question4;
GO
CREATE PROCEDURE Question4
AS
select concat([FirstName],' ',[LastName]) as 'Full Name', [Address], [Region], [ShipCountry]
from [dbo].[Employees]
inner join [dbo].[Orders]
on [dbo].[Employees].EmployeeID = [dbo].[Orders].[EmployeeID]
where [ShipCountry] = 'Belgium';
GO

/*Display the First Name, Last Name, City and Hire Date of Employees whose
Last Name starts with 'S' and First Name starts with 'M'*/ 
DROP PROC IF EXISTS Question5;
GO
CREATE PROCEDURE Question5
AS
select concat([FirstName],' ',[LastName]) as 'Full Name',[City], [HireDate] 
from [dbo].[Employees]
where LastName LIKE 'S%' or FirstName like '%M';
GO


/* Give the employee name and the customer name for orders that are sent by
the company �Speedy Express� to customers who live in Bruxelles. */
DROP PROC IF EXISTS Question6;
GO

/*. Give the title and name of employees who have sold at least one of the
products �Gravad Lax� or �Mishi Kobe Niku�. Names should not repeat if they
have sold both or one item twice. */
DROP PROC IF EXISTS Question7;
GO

/*Give the name of employees and the city where they live for employees who
have sold to customers in the same city. */ 
DROP PROC IF EXISTS Question8;
GO


/* Give the name of all employees who sold �Chai� */
DROP PROC IF EXISTS Question10;
GO

/*  Write a query to get the name, address, city, and region of employees older
than 60 years. */ 
DROP PROC IF EXISTS Question9;
GO
CREATE PROCEDURE Question9
AS
select concat([FirstName],' ',[LastName]) as 'Full Name', Address, City, Region, year(BirthDate) as 'birthdate'
from [dbo].[Employees]
where datediff(year, [BirthDate], getdate())>60;
GO

/* 15. For ALL Condiments, display the Category Name, the Product Name, and the
Company Name of the supplier */
DROP PROC IF EXISTS Question15;
GO

/* 13. Give the name of customers who have MADE MORE THAN 10 purchases OF
any product. 
Make a complete list of customers along with the number of orders they have
placed. (My query yielded 89 records.)*/

DROP PROC IF EXISTS Question13;
GO

/* . Display the First Name and Last Name (concatenated) and City of all
Employees who live in cities that start with the letter �S� or �T�.
*/
DROP PROC IF EXISTS Question19;
GO
CREATE PROCEDURE Question19
AS
select concat([FirstName],' ',[LastName]) as 'Full Name', City
from [dbo].[Employees]
where [City] LIKE 'S%' or [City] like 'T%';
GO

/* 14. Give the ProductName, CategoryID, UnitPrice, UnitsInStock and Total Value of
all the products. */
DROP PROC IF EXISTS Question14;
GO
CREATE PROCEDURE Question14
AS
select [ProductName], [CategoryName], [UnitPrice], [UnitsInStock]
from [dbo].[Products]
inner join [dbo].[Categories]
on [dbo].[Products].[ProductID] = [dbo].[Categories].CategoryID;
GO

DROP PROC IF EXISTS Question11;
GO

DROP PROC IF EXISTS Question12;
GO

DROP PROC IF EXISTS Question16;
GO

DROP PROC IF EXISTS Question17;
GO

DROP PROC IF EXISTS Question19;
GO
