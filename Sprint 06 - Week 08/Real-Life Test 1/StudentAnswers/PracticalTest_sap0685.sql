--Sarah Pettigrew
--BCDE103 Scripting Test

use [NORTHWND];
GO

--q2.
DROP PROC IF EXISTS Question2;
GO
CREATE PROCEDURE Question2
AS
select  [FirstName], [LastName], [City],[Region] 
from [dbo].[Employees];
GO

--q3.
DROP PROC IF EXISTS Question3;
GO
CREATE PROCEDURE Question3
AS
 select  [FirstName], [LastName], [City],[Region],[Country]  
from [dbo].[Employees]
where [Country] LIKE 'USA';
GO

--q4. 
DROP PROC IF EXISTS Question4;
GO
CREATE PROCEDURE Question4
AS
select distinct  [FirstName], [LastName], [City],[Region],[ShipCountry]   
from [dbo].[Employees], [dbo].[Orders]
where [dbo].[Employees].[EmployeeID]=[dbo].[Orders].[EmployeeID]
and [ShipCountry] LIKE 'Belgium';
GO

--q5. 
DROP PROC IF EXISTS Question5;
GO
CREATE PROCEDURE Question5
AS
select  [FirstName], [LastName], [City], [HireDate] 
from [dbo].[Employees]
where [LastName] LIKE 'S%'
and [FirstName] LIKE 'M%';
GO

--q6.
DROP PROC IF EXISTS Question6;
GO
CREATE PROCEDURE Question6
AS
select  [FirstName], [LastName], [dbo].[Customers].[CompanyName], [dbo].[Shippers].[CompanyName]   
from [dbo].[Employees], [dbo].[Orders], [dbo].[Customers], [dbo].[Shippers]
where [dbo].[Employees].[EmployeeID]=[dbo].[Orders].[EmployeeID]
and [dbo].[Orders].[CustomerID]=[dbo].[Customers].[CustomerID]
and [dbo].[Orders].[ShipVia]=[dbo].[Shippers].ShipperID
and [dbo].[Shippers].[CompanyName] LIKE 'Speedy Express'
and [dbo].[Customers].[City] LIKE 'Bruxelles';
GO

--q7.
DROP PROC IF EXISTS Question7;
GO
CREATE PROCEDURE Question7
AS
select distinct [Title], [FirstName], [LastName], [ProductName]
from Employees, Orders, [dbo].[Order Details], [dbo].[Products]
where [dbo].[Employees].[EmployeeID]=[dbo].[Orders].[EmployeeID]
and [dbo].[Orders].[OrderID]=[dbo].[Order Details].[OrderID]
and [dbo].[Order Details].[ProductID]=[dbo].[Products].[ProductID]
and [ProductName] IN ('Gravad Lax', 'Mishi Kobe Niku');
GO

--q8.
DROP PROC IF EXISTS Question8;
GO
CREATE PROCEDURE Question8
AS
select  [FirstName], [LastName], [dbo].[Employees].[City], [CompanyName], [dbo].[Customers].[City]
from [dbo].[Employees], [dbo].[Orders], [dbo].[Customers]
where [dbo].[Employees].[EmployeeID]=[dbo].[Orders].[EmployeeID]
and [dbo].[Orders].[CustomerID]=[dbo].[Customers].[CustomerID]
and [dbo].[Employees].[City] LIKE [dbo].[Customers].[City];
GO


--q9.
DROP PROC IF EXISTS Question9;
GO
CREATE PROCEDURE Question9
AS
select  [FirstName], [LastName], [Address], [City], [Region], DATEDIFF(year, [BirthDate], '2021-06-02')  as 'Age'
from [dbo].[Employees]
group by [FirstName], [LastName], [Address], [City], [Region], [BirthDate]
having DATEDIFF(year, [BirthDate], '2021-06-02') >60;
GO

--q10.
DROP PROC IF EXISTS Question10;
GO
CREATE PROCEDURE Question10
AS
select distinct [FirstName], [LastName], [ProductName]
from [dbo].[Employees], [dbo].[Orders], [dbo].[Order Details], [dbo].[Products]
where [dbo].[Employees].[EmployeeID]=[dbo].[Orders].[EmployeeID]
and [dbo].[Orders].[OrderID]=[dbo].[Order Details].[OrderID]
and [dbo].[Order Details].[ProductID]=[dbo].[Products].[ProductID]
and [ProductName] LIKE 'Chai';
GO

--q11.
DROP PROC IF EXISTS Question11;
GO
CREATE PROCEDURE Question11
AS
select [dbo].[Suppliers].[SupplierID], [CompanyName], COUNT([ProductName]) as 'number of products'
from [dbo].[Suppliers], [dbo].[Products]
where [dbo].[Suppliers].[SupplierID]=[dbo].[Products].[SupplierID]
group by [dbo].[Suppliers].[SupplierID], [CompanyName]
having COUNT([ProductName]) > 3;
GO

--q12.
DROP PROC IF EXISTS Question12;
GO
CREATE PROCEDURE Question12
AS
select COUNT([CustomerID]) as 'number of customers', [dbo].[Customers].[Country]
from [dbo].[Customers]
group by [Country]
having COUNT([CustomerID]) > 5
order by [Country] DESC;
GO

--q13.
DROP PROC IF EXISTS Question13;
GO
CREATE PROCEDURE Question13
AS
select [dbo].[Customers].[CompanyName], COUNT([dbo].[Order Details].[ProductID]*[Quantity]) as 'number of products'
from [dbo].[Customers], [dbo].[Orders], [dbo].[Order Details], [dbo].[Products]
where [dbo].[Customers].[CustomerID]=[dbo].[Orders].[CustomerID]
and [dbo].[Orders].[OrderID]=[dbo].[Order Details].[OrderID]
and [dbo].[Order Details].[ProductID]=[dbo].[Products].[ProductID]
group by [dbo].[Customers].[CompanyName]
having COUNT([dbo].[Order Details].[ProductID]*[Quantity]) > 10
order by [CompanyName];
GO

--q14. 
DROP PROC IF EXISTS Question14;
GO
CREATE PROCEDURE Question14
AS
select [ProductName], [dbo].[Products].[CategoryID], [UnitPrice], [UnitsInStock], [UnitPrice]*[UnitsInStock] as 'total value'
from [dbo].[Products]
group by [ProductName], [dbo].[Products].[CategoryID], [UnitPrice], [UnitsInStock];
GO


--q15.
DROP PROC IF EXISTS Question15;
GO
CREATE PROCEDURE Question15
AS
select [dbo].[Categories].[CategoryName], [dbo].[Products].[ProductName], [dbo].[Suppliers].[CompanyName]
from [dbo].[Categories], [dbo].[Products], [dbo].[Suppliers]
where [dbo].[Categories].[CategoryID]=[dbo].[Products].[CategoryID]
and [dbo].[Products].[SupplierID]=[dbo].[Suppliers].[SupplierID]
and [CategoryName] LIKE 'Condiments';
GO

--q16.
DROP PROC IF EXISTS Question16;
GO
CREATE PROCEDURE Question16
AS
select [dbo].[Customers].[CompanyName], COUNT([dbo].[Orders].[OrderID]) as 'number of orders placed'
from [dbo].[Customers] 
left join [dbo].[Orders]
on [dbo].[Customers].[CustomerID]=[dbo].[Orders].[CustomerID]
group by [dbo].[Customers].[CompanyName];
GO

--q17.
DROP PROC IF EXISTS Question17;
GO
CREATE PROCEDURE Question17
AS
select [dbo].[Products].[ProductName], [UnitsOnOrder], [UnitsInStock]
from [dbo].[Products]
where [UnitsInStock] < [UnitsOnOrder];
GO

--q18.
DROP PROC IF EXISTS Question18;
GO
CREATE PROCEDURE Question18
AS
select [CategoryName], avg([UnitPrice]) as 'average price'
from [dbo].[Products], [dbo].[Categories]
where [dbo].[Products].[CategoryID]=[dbo].[Categories].[CategoryID]
group by [CategoryName];
GO

--q19.
DROP PROC IF EXISTS Question19;
GO
CREATE PROCEDURE Question19
AS
select CONCAT([FirstName], '',[LastName]) as 'EmployeeName', [City]
from [dbo].[Employees]
where [City] LIKE 'S%' OR [City] LIKE 'T%';
GO