USE NORTHWND;
GO

--Q2
DROP PROC IF EXISTS Question2;
GO
CREATE PROCEDURE Question2
AS
Select FirstName,lastName,Address,City,Region From Employees;
GO

--Q3
DROP PROC IF EXISTS Question3;
GO
CREATE PROCEDURE Question3
AS
Select FirstName,lastName,Address,City,Region,Country From Employees
where Country like 'USA';
GO

--Q4
DROP PROC IF EXISTS Question4;
GO
CREATE PROCEDURE Question4
AS
Select FirstName,lastName,Address,City,Region,Country,ShipCountry From Employees
inner join Orders on Employees.EmployeeID = Orders.EmployeeID
where ShipCountry like 'Belgium';
GO


--Q5
DROP PROC IF EXISTS Question5;
GO
CREATE PROCEDURE Question5
AS
Select FirstName,lastName,City,HireDate From Employees
Where lastName like 'S%' and FirstName like 'M%';
GO

--Q6
DROP PROC IF EXISTS Question6;
GO
CREATE PROCEDURE Question6
AS
Select FirstName,LastName,Customers.CompanyName,Shippers.CompanyName From Employees
inner join Orders on Employees.EmployeeID = Orders.EmployeeID
inner join Shippers on Orders.ShipVia = ShipperID
inner join Customers on Orders.CustomerID = Customers.CustomerID
Where Shippers.CompanyName = 'Speedy Express' and Customers.City = 'Bruxelles';
GO

--Q7
DROP PROC IF EXISTS Question7;
GO
CREATE PROCEDURE Question7
AS
Select DISTINCT Title,FirstName,lastName From Employees
inner join Orders on Employees.EmployeeID = Orders.EmployeeID
inner join [Order Details] on Orders.OrderID = [Order Details].OrderID
inner join Products on Products.ProductID = [Order Details].ProductID
Where ProductName like 'Gravad Lax' or ProductName like 'Mishi Kobe Niku';
GO
--Mssing one result It should be missing one result

--Q8
DROP PROC IF EXISTS Question8;
GO
CREATE PROCEDURE Question8
AS
Select DISTINCT Employees.FirstName,Employees.LastName,Employees.City From Employees
Inner join Orders on Employees.EmployeeID = Orders.EmployeeID
Inner join Customers on Orders.CustomerID = Customers.CustomerID
Where Employees.City = Customers.City;
GO

/*Select * from Customers
Where City = 'Kirkland'

Select * from Employees
Where City = 'Kirkland'*/

--Q9
DROP PROC IF EXISTS Question9;
GO
CREATE PROCEDURE Question9
AS
Select FirstName,LastName,Address,City,Region,YEAR(BirthDate) AS 'BIRTHDATE',DATEDIFF(year,BirthDate, GETDATE()) as 'Age' from Employees
Where DATEDIFF(year,BirthDate, GETDATE())> 60
Order by Age asc;
GO

--Q10
DROP PROC IF EXISTS Question10;
GO
CREATE PROCEDURE Question10
AS
Select DISTINCT FirstName,lastName,ProductName From Employees
inner join Orders on Employees.EmployeeID = Orders.EmployeeID
inner join [Order Details] on Orders.OrderID = [Order Details].OrderID
inner join Products on Products.ProductID = [Order Details].ProductID
Where ProductName like 'Chai';
GO

--Q11
DROP PROC IF EXISTS Question11;
GO
CREATE PROCEDURE Question11
AS
Select Suppliers.SupplierID,CompanyName,COUNT(ProductName) As 'No. of Products' From Suppliers
Inner join Products on Products.SupplierID = Suppliers.SupplierID
Group by Suppliers.SupplierID,CompanyName
HAVING COUNT(ProductName) > 3;
GO

--Q12
DROP PROC IF EXISTS Question12;
GO
CREATE PROCEDURE Question12
AS
Select COUNT(CITY) as 'Customer Num',Country From Customers
Group by Country
HAVING COUNT(CITY) > 5
Order by COUNT(CITY) Desc;
GO

--Q13
DROP PROC IF EXISTS Question13;
GO
CREATE PROCEDURE Question13
AS
Select CompanyName,COUNT(Orders.OrderID) As '# OF PURCHASES' From Orders
Inner join Customers on Customers.CustomerID = Orders.CustomerID
group by CompanyName
HAVING COUNT(Orders.OrderID) > 10;
GO


--Q14
DROP PROC IF EXISTS Question14;
GO
CREATE PROCEDURE Question14
AS
Select ProductName,CategoryID,UnitPrice,UnitsInstock,SUM(UnitPrice * UnitsInstock) as 'Total Value'from Products
Group by ProductName,CategoryID,UnitPrice,UnitsInStock
Order by CategoryID asc;
GO

--Q15
DROP PROC IF EXISTS Question15;
GO
CREATE PROCEDURE Question15
AS
Select CategoryName,ProductName,CompanyName From Categories
inner join Products on Categories.CategoryID = Products.CategoryID
inner join Suppliers on Suppliers.SupplierID = Products.SupplierID
Where CategoryName like 'Condiments';
GO

--Q16
DROP PROC IF EXISTS Question16;
GO
CREATE PROCEDURE Question16
AS
Select CompanyName, COUNT(OrderID) As '# of Orders Placed' from Customers
inner join Orders on Customers.CustomerID = Orders.CustomerID
group by CompanyName;
GO


--Q17
DROP PROC IF EXISTS Question17;
GO
CREATE PROCEDURE Question17
AS
Select ProductName,UnitsOnOrder,UnitsInStock from Products
Where UnitsOnOrder > UnitsInStock;
GO

--Q18
DROP PROC IF EXISTS Question18;
GO
CREATE PROCEDURE Question18
AS
Select CategoryName,AVG(UNITPRICE) AS 'AVERAGE PRICE'From Categories
inner join Products on Categories.CategoryID = Products.CategoryID
Group by CategoryName;
GO


--Q19
DROP PROC IF EXISTS Question19;
GO
CREATE PROCEDURE Question19
AS
Select CONCAT(FirstName, ' ',LastName) as 'EmployeeName',City From Employees
where City like 'S%' or City like 'T%';
GO
