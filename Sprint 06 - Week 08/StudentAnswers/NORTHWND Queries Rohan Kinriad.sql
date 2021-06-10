--Q1
USE NORTHWND;
GO

--Q2
DROP PROC IF EXISTS Question2;
GO
CREATE PROCEDURE Question2
AS
SELECT FirstName, Lastname, Address, City, Region FROM Employees; 
GO

--Q3
DROP PROC IF EXISTS Question3;
GO
CREATE PROCEDURE Question3
AS
SELECT FirstName, Lastname, Address, City, Region FROM Employees 
WHERE Country = 'USA';
GO

--Q4
DROP PROC IF EXISTS Question4;
GO
CREATE PROCEDURE Question4
AS
SELECT FirstName, Lastname, Address, City, Region, ShipCountry FROM Employees 
INNER JOIN Orders ON Orders.EmployeeID = Employees.EmployeeID
WHERE ShipCountry = 'Belgium';
GO

--Q5
DROP PROC IF EXISTS Question5;
GO
CREATE PROCEDURE Question5
AS
SELECT FirstName, Lastname, Address, City, HireDate FROM Employees 
WHERE Lastname LIKE 'S%' AND Firstname LIKE 'M%';
GO

--Q6
DROP PROC IF EXISTS Question6;
GO
CREATE PROCEDURE Question6
AS
SELECT FirstName, Lastname, Shippers.CompanyName, Customers.CompanyName FROM Employees 
INNER JOIN Orders ON Orders.EmployeeID = Employees.EmployeeID
INNER JOIN Shippers ON Orders.ShipVia = Shippers.ShipperID
INNER JOIN Customers ON Orders.CustomerID = Customers.CustomerID
WHERE Shippers.CompanyName = 'Speedy Express' AND Customers.City = 'Bruxelles';
GO


--Q7
DROP PROC IF EXISTS Question7;
GO
CREATE PROCEDURE Question7
AS
SELECT DISTINCT Title, FirstName, Lastname FROM Employees
INNER JOIN Orders ON Orders.EmployeeID = Employees.EmployeeID
INNER JOIN [Order Details] ON [Order Details].OrderID = Orders.OrderID
INNER JOIN Products ON [Order Details].ProductID = Products.ProductID
WHERE Quantity >= 1 AND ProductName = 'Gravad Lax' OR ProductName = 'Mishi Kobe Niku';
GO

--Q8
DROP PROC IF EXISTS Question8;
GO
CREATE PROCEDURE Question8
AS
SELECT Firstname, LastName, Employees.City, Customers.City  FROM Employees
INNER JOIN Orders ON Orders.EmployeeID = Employees.EmployeeID
INNER JOIN Customers ON Orders.CustomerID = Customers.CustomerID
WHERE Customers.City = Employees.City;
GO

--Verification
/*SELECT Firstname, LastName, Employees.City, Customers.City  FROM Employees
INNER JOIN Orders ON Orders.EmployeeID = Employees.EmployeeID
INNER JOIN Customers ON Orders.CustomerID = Customers.CustomerID
WHERE Customers.City = 'Kirkland' AND Employees.City = 'Kirkland';

SELECT * FROM Customers WHERE City = 'Kirkland'
SELECT * FROM Orders WHERE CustomerID = 'TRAIH'
SELECT Firstname, LastName, Employees.City  FROM Employees
WHERE EmployeeID in (4,9,6)*/


--Q9
DROP PROC IF EXISTS Question9;
GO
CREATE PROCEDURE Question9
AS
SELECT FirstName, Lastname, Address, City, DATEDIFF(year, BirthDate, GETDATE()) AS [Age], Region
 FROM Employees 
WHERE DATEDIFF(year, BirthDate, GETDATE()) >= 60
ORDER BY [age]; 
GO

--Q10
DROP PROC IF EXISTS Question10;
GO
CREATE PROCEDURE Question10
AS
SELECT DISTINCT FirstName, Lastname  FROM Employees 
INNER JOIN Orders ON Orders.EmployeeID = Employees.EmployeeID
INNER JOIN [Order Details] ON [Order Details].OrderID = Orders.OrderID
INNER JOIN Products ON [Order Details].ProductID = Products.ProductID
WHERE ProductName = 'Chai';
GO

--SELECT * FROM Products WHERE ProductName = 'Chai'


--Q11
DROP PROC IF EXISTS Question11;
GO
CREATE PROCEDURE Question11
AS
SELECT Suppliers.SupplierID, CompanyName, COUNT(ProductID) FROM Suppliers 
INNER JOIN Products ON Suppliers.SupplierID = Products.SupplierID
GROUP BY Suppliers.SupplierID, CompanyName
HAVING COUNT(ProductID) > 3;
GO

--Q12
DROP PROC IF EXISTS Question12;
GO
CREATE PROCEDURE Question12
AS
SELECT COUNT(CustomerID) AS [Customer Num], Country FROM Customers
GROUP BY Country
HAVING COUNT(CustomerID) > 5
ORDER BY COUNT(CustomerID) DESC;
GO

--Q13
DROP PROC IF EXISTS Question13;
GO
CREATE PROCEDURE Question13
AS
SELECT CompanyName, COUNT(OrderID) AS [# OF PURCHASES] FROM Customers
INNER JOIN Orders ON Orders.CustomerID = Customers.CustomerID
GROUP BY CompanyName
HAVING COUNT(OrderID) > 10;
GO

--Q14
DROP PROC IF EXISTS Question14;
GO
CREATE PROCEDURE Question14
AS
SELECT ProductName, CategoryID, UnitPrice, UnitsInStock, (UnitPrice * UnitsInStock) AS [Total Value]
FROM Products
GO

--Q15
DROP PROC IF EXISTS Question15;
GO
CREATE PROCEDURE Question15
AS
SELECT CategoryName, ProductName, CompanyName FROM Products
INNER JOIN Suppliers ON Suppliers.SupplierID = Products.SupplierID
INNER JOIN Categories ON Categories.CategoryID = Products.CategoryID
WHERE Categories.CategoryID = 2;
GO

--Q16
DROP PROC IF EXISTS Question16;
GO
CREATE PROCEDURE Question16
AS
SELECT CompanyName, COUNT(OrderID) AS [#of Orders Placed] FROM Customers
INNER JOIN Orders ON Orders.CustomerID = Customers.CustomerID
GROUP BY CompanyName;
GO

--Q17
DROP PROC IF EXISTS Question17;
GO
CREATE PROCEDURE Question17
AS
SELECT Productname, UnitsOnOrder, UnitsInStock FROM Products
WHERE UnitsInStock < UnitsOnOrder;
GO

--Q18
DROP PROC IF EXISTS Question18;
GO
CREATE PROCEDURE Question18
AS
SELECT CategoryName, AVG(UnitPrice) AS [AVERAGE PRICE] FROM Products
INNER JOIN Categories ON Categories.CategoryID = Products.CategoryID
GROUP BY CategoryName
GO

--Q19
DROP PROC IF EXISTS Question19;
GO
CREATE PROCEDURE Question19
AS
SELECT CONCAT(FirstName, ' ',LastName) AS [EmployeeName], City FROM Employees
WHERE City LIKE 'S%' or City LIKE 'T%'
GO




/*SELECT * FROM Products WHERE Productname = 'Gravad Lax'
SELECT * FROM Orders
SELECT * FROM Shippers*/

