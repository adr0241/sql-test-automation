USE NORTHWND;
GO

-- 1.Restore and select the SQLTest.bak database.
-- DONE and ERD SAVED WILL BE ATTACHED
-- 2. Give the name, address, city, and region of employees.
DROP PROC IF EXISTS Question2;
GO
CREATE PROCEDURE Question2
AS
SELECT FirstName, LastName, Address, City, region FROM Employees;
GO

-- 3. Give the name, address, city, and region of employees living in USA.
DROP PROC IF EXISTS Question3;
GO
CREATE PROCEDURE Question3
AS
SELECT FirstName, LastName, Address, City, region FROM Employees WHERE Country = 'USA';
GO

-- 4. Give the name, address, city, and region of employees that have placed orders
--to be delivered in Belgium.
DROP PROC IF EXISTS Question4;
GO
CREATE PROCEDURE Question4
AS
SELECT FirstName, LastName, Address, City, Region, ShipCountry FROM Employees 
INNER JOIN Orders ON Employees.EmployeeID = Orders.EmployeeID WHERE ShipCountry = 'Belgium';
GO

-- 5. Display the First Name, Last Name, City and Hire Date of Employees whose
-- Last Name starts with 'S' and First Name starts with 'M'.
DROP PROC IF EXISTS Question5;
GO
CREATE PROCEDURE Question5
AS
SELECT FirstName, LastName, City, HireDate FROM Employees WHERE LastName LIKE '[S]%' and FirstName LIKE '[M]%';
GO

-- 6. Give the employee name and the customer name for orders that are sent by
-- the company �Speedy Express� to customers who live in Bruxelles.
DROP PROC IF EXISTS Question6;
GO
CREATE PROCEDURE Question6
AS
SELECT DISTINCT FirstName, LastName, Customers.ContactName, Shippers.CompanyName FROM Employees 
INNER JOIN Orders ON Orders.EmployeeID = Employees.EmployeeID INNER JOIN Customers ON Customers.CustomerID = Orders.CustomerID
INNER JOIN [Order Details] ON Orders.OrderID = [Order Details].OrderID INNER JOIN Shippers ON Shippers.ShipperID = Orders.ShipVia
WHERE Shippers.CompanyName = 'Speedy Express' and Customers.City = 'Bruxelles';
GO

-- 7. Give the title and name of employees who have sold at least one of the
-- products �Gravad Lax� or �Mishi Kobe Niku�. Names should not repeat if they
-- have sold both or one item twice.
DROP PROC IF EXISTS Question7;
GO
CREATE PROCEDURE Question7
AS
SELECT DISTINCT Title, FirstName, LastName FROM Employees 
INNER JOIN Orders ON Employees.EmployeeID = Orders.EmployeeID INNER JOIN [Order Details] ON Orders.OrderID = [Order Details].OrderID
INNER JOIN Products ON [Order Details].ProductID = Products.ProductID WHERE Products.ProductName = 'Gravad Lax' OR Products.ProductName = 'Mishi Kobe Niku';
GO

-- 8. Give the name of employees and the city where they live for employees who
-- have sold to customers in the same city.
-- COME BACK TO
DROP PROC IF EXISTS Question8;
GO
CREATE PROCEDURE Question8
AS
SELECT DISTINCT FirstName,LastName,Customers.City FROM Employees INNER JOIN Orders ON Employees.EmployeeID = Orders.EmployeeID INNER JOIN Customers ON Orders.CustomerID = Customers.CustomerID
WHERE Employees.City = Customers.City;
GO

-- 9. Write a query to get the name, address, city, and region of employees older
-- than 60 years.
DROP PROC IF EXISTS Question9;
GO
CREATE PROCEDURE Question9
AS
SELECT FirstName, LastName, Address, City, Region, YEAR(BirthDate) AS BIRTHDATE, DATEDIFF(year, BirthDate, GETDATE()) AS Age FROM Employees 
WHERE DATEDIFF(year, BirthDate, GETDATE()) > 60 ORDER BY BirthDate DESC;
GO

-- 10. Give the name of all employees who sold �Chai�.
DROP PROC IF EXISTS Question10;
GO
CREATE PROCEDURE Question10
AS
SELECT DISTINCT FirstName, LastName, ProductName FROM Employees 
INNER JOIN Orders ON Employees.EmployeeID = Orders.EmployeeID INNER JOIN [Order Details] ON Orders.OrderID = [Order Details].OrderID 
INNER JOIN Products  ON Products.ProductID = Products.ProductID WHERE ProductName = 'Chai' ORDER BY FirstName ASC;
GO

-- 11. Give the identifier and the name of the companies that provide more than 3
-- products.
DROP PROC IF EXISTS Question11;
GO
CREATE PROCEDURE Question11
AS
SELECT Suppliers.SupplierID, CompanyName, COUNT(ProductID) AS No_of_Products FROM Suppliers INNER JOIN Products ON Suppliers.SupplierID = Products.SupplierID
GROUP BY Suppliers.SupplierID, CompanyName HAVING COUNT(ProductID) > 3;
GO

-- 12. Write a query that lists the number of customers in each country. Only include
-- countries with more than 5 customers and order them by descending order of
-- Number of Companies.
DROP PROC IF EXISTS Question12;
GO
CREATE PROCEDURE Question12
AS
SELECT COUNT(Country) AS Customer_Num, Country FROM Customers GROUP BY Country HAVING COUNT(Country) > 5 ORDER BY COUNT(Country) DESC;
GO

-- 13. Give the name of customers who have MADE MORE THAN 10 purchases OF
-- any product. 
DROP PROC IF EXISTS Question13;
GO
CREATE PROCEDURE Question13
AS
SELECT CompanyName, COUNT(OrderID) AS #_OF_PURCHASES FROM Customers 
INNER JOIN Orders ON Customers.CustomerID = Orders.CustomerID GROUP BY CompanyName HAVING COUNT(OrderID) > 10;
GO

-- 14. Give the ProductName, CategoryID, UnitPrice, UnitsInStock and Total Value of
-- all the products. 
DROP PROC IF EXISTS Question14;
GO
CREATE PROCEDURE Question14
AS
SELECT ProductName, CategoryID, UnitPrice, UnitsInStock, UnitPrice * UnitsInStock AS TOTAL_VAlUE FROM Products;
GO

-- 15. For ALL Condiments, display the Category Name, the Product Name, and the
-- Company Name of the supplier.
DROP PROC IF EXISTS Question15;
GO
CREATE PROCEDURE Question15
AS
SELECT CategoryName, ProductName, CompanyName FROM Products 
INNER JOIN Suppliers ON Products.SupplierID = Suppliers.SupplierID INNER JOIN Categories ON Products.CategoryID = Categories.CategoryID
WHERE CategoryName = 'Condiments';
GO

-- 16. Make a complete list of customers along with the number of orders they have
-- placed. (My query yielded 89 records.)
DROP PROC IF EXISTS Question16;
GO
CREATE PROCEDURE Question16
AS
SELECT CompanyName, COUNT(OrderID) AS #_Of_Orders_Placed FROM Customers INNER JOIN Orders ON Customers.CustomerID = Orders.CustomerID GROUP BY CompanyName;
GO

-- 17. Write a query to get Product list (product name, units on order, and units in
-- stock) where quantity of stock is less than the quantity on order.
DROP PROC IF EXISTS Question17;
GO
CREATE PROCEDURE Question17
AS
SELECT ProductName, UnitsOnOrder, UnitsInStock FROM Products WHERE UnitsInStock < UnitsOnOrder;
GO

-- 18. Give the average price of products by EACH category.
DROP PROC IF EXISTS Question18;
GO
CREATE PROCEDURE Question18
AS
SELECT CategoryName, AVG(UnitPrice) AS AVERAGE_PRICE FROM Categories INNER JOIN Products ON Products.CategoryID = Categories.CategoryID GROUP BY CategoryName;
GO

-- 19. Display the First Name and Last Name (concatenated) and City of all
-- Employees who live in cities that start with the letter �S� or �T�.
DROP PROC IF EXISTS Question19;
GO
CREATE PROCEDURE Question19
AS
SELECT FirstName + ' ' + LastName AS EmployeeName, City FROM Employees WHERE City LIKE '[S]%' OR City LIKE '[T]%';
GO
