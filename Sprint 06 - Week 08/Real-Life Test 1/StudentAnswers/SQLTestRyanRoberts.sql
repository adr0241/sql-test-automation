use northwnd;
GO

/*Q2*/
DROP PROC IF EXISTS Question2;
GO
CREATE PROCEDURE Question2
AS
Select FirstName, LastName, Address, City, Region from Employees;
GO



/*Q3*/
DROP PROC IF EXISTS Question3;
GO
CREATE PROCEDURE Question3
AS
Select FirstName,LastName, Address, City, Region, Country from Employees
where Country = 'USA';
GO


/*Q4*/
DROP PROC IF EXISTS Question4;
GO
CREATE PROCEDURE Question4
AS
Select FirstName,LastName, Address, City, Region, Shipcountry from Employees
inner join Orders ON Employees.EmployeeID = Orders.EmployeeID
where ShipCountry = 'Belgium';
GO


/*Q5*/
DROP PROC IF EXISTS Question5;
GO
CREATE PROCEDURE Question5
AS
Select FirstName,LastName, City, HireDate from Employees
where FirstName LIKE '%M%' and LastName LIKE '%S%';
GO


DROP PROC IF EXISTS Question6;
GO

/*Q7*/
DROP PROC IF EXISTS Question7;
GO
CREATE PROCEDURE Question7
AS
select  distinct title, firstname, lastname from Employees 
inner join orders on Employees.EmployeeID = Orders.EmployeeID
inner join Customers on Customers.CustomerID = Orders.CustomerID
inner join [Order Details] on orders.OrderID = [Order Details].OrderID
inner join Products on [Order Details].ProductID = Products.ProductID
where ProductName ='Gravad Lax' or ProductName= 'Mishi Kobe Niku';
GO


DROP PROC IF EXISTS Question8;
GO
DROP PROC IF EXISTS Question9;
GO

/*Q10*/
DROP PROC IF EXISTS Question10;
GO
CREATE PROCEDURE Question10
AS
select distinct firstname, lastname, ProductName from Employees
inner join orders on Employees.EmployeeID = Orders.EmployeeID
inner join [Order Details] on orders.OrderID = [Order Details].OrderID
inner join Products on Products.ProductID = [Order Details].ProductID
where ProductName = 'Chai';
GO




/*Q11*/
DROP PROC IF EXISTS Question11;
GO
CREATE PROCEDURE Question11
AS
select suppliers.SupplierID, companyname, Count(ProductName) as 'Number of Products' from Suppliers
inner join Products on products.SupplierID = Suppliers.SupplierID
Group by suppliers.SupplierID, companyname
having Count(ProductName) > 3;
GO


/*Q12*/
DROP PROC IF EXISTS Question12;
GO
CREATE PROCEDURE Question12
AS
select Country, count(country) as 'Customer Num' from customers
group by country
having Count(Country) > 5
order by count(CompanyName) desc;
GO



/*Q13*/
DROP PROC IF EXISTS Question13;
GO
CREATE PROCEDURE Question13
AS
select Companyname, Count(Orders.CustomerID) as '# of purchases' from Customers
Inner join Orders on Customers.CustomerID = Orders.CustomerID
group by Companyname
having Count(Orders.CustomerID) > 10;
GO



/*Q14*/
DROP PROC IF EXISTS Question14;
GO
CREATE PROCEDURE Question14
AS
select productname, categories.CategoryID, unitsinstock, sum(unitprice * UnitsInStock) as 'Total Value' from Categories 
inner join Products on Products.CategoryID = Categories.CategoryID
group by productname, categories.CategoryID, unitsinstock
order by Categories.CategoryID;
GO



/*Q15*/
DROP PROC IF EXISTS Question15;
GO
CREATE PROCEDURE Question15
AS
Select CategoryName, Productname, CompanyName from products
Inner join Categories on Products.CategoryID = Categories.CategoryID
Inner join Suppliers on Products.SupplierID = Suppliers.SupplierID
where Categories.CategoryID = 2;
GO


/*Q16*/
DROP PROC IF EXISTS Question16;
GO
CREATE PROCEDURE Question16
AS
select Companyname, Count(OrderID) as '# of purchases' from Customers
Inner join Orders on Orders.CustomerID = Customers.CustomerID
group by Companyname;
GO


/*Q17*/
DROP PROC IF EXISTS Question17;
GO
CREATE PROCEDURE Question17
AS
select productname, UnitsOnOrder, unitsinstock from Products
where UnitsInStock < UnitsOnOrder;
GO


/*Q18*/
DROP PROC IF EXISTS Question18;
GO
CREATE PROCEDURE Question18
AS
select CategoryName, AVG(UnitPrice) as 'AVERAGE PRICE' from Categories
Inner Join Products on Products.CategoryID = Categories.CategoryID
group by CategoryName;
GO


/*Q19*/
DROP PROC IF EXISTS Question19;
GO
CREATE PROCEDURE Question19
AS
select CONCAT(firstname,' ',lastname) as 'Employee Name', city from Employees
where City like '%S%S' or City like '%T%';
GO







