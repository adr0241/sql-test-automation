USE NORTHWND;
GO

-- Q2
DROP PROC IF EXISTS Question2;
GO
CREATE PROCEDURE Question2
AS
SELECT firstName, lastName, address, city, region
FROM Employees;
GO

-- Q3
DROP PROC IF EXISTS Question3;
GO
CREATE PROCEDURE Question3
AS
SELECT firstName, lastName, address, city, region, Country
FROM employees
WHERE country = 'USA';
GO

-- Q4
DROP PROC IF EXISTS Question4;
GO
CREATE PROCEDURE Question4
AS
SELECT firstName, lastName, address, city, region, shipCountry
FROM employees INNER JOIN orders ON employees.employeeID = orders.employeeID
WHERE shipCountry = 'Belgium';
GO

-- Q5
DROP PROC IF EXISTS Question5;
GO
CREATE PROCEDURE Question5
AS
SELECT firstName, lastName, city, hireDate
FROM employees
WHERE lastName like 'S%' and firstName like 'M%';
GO

-- Q6
DROP PROC IF EXISTS Question6;
GO
CREATE PROCEDURE Question6
AS
SELECT employees.firstName, employees.lastName, customers.companyName, shippers.companyName
FROM employees 
INNER JOIN orders ON employees.employeeID = orders.employeeID 
INNER JOIN shippers ON orders.shipVia = Shippers.shipperID
INNER JOIN customers ON orders.customerID = customers.customerID
WHERE customers.companyName = 'Maison Dewey' AND shippers.companyName = 'Speedy Express';
GO

-- Q7
DROP PROC IF EXISTS Question7;
GO
CREATE PROCEDURE Question7
AS
SELECT DISTINCT employees.title, employees.firstName, employees.LastName
FROM employees 
INNER JOIN orders on employees.EmployeeID = orders.EmployeeID
INNER JOIN [Order Details] ON orders.OrderID = [Order Details].orderID
INNER JOIN products ON [Order Details].ProductID = products.ProductID
WHERE products.ProductName = 'Gravad Lax' OR products.ProductName = 'Mishi Kobe Niku';
GO

-- Q8 (None of Janet Leverling's customers live in Kirkland, answer says 1 should)
DROP PROC IF EXISTS Question8;
GO
CREATE PROCEDURE Question8
AS
SELECT DISTINCT Employees.FirstName, employees.LastName, Employees.City, customers.City
FROM employees
INNER JOIN Orders ON employees.EmployeeID = orders.EmployeeID
INNER JOIN customers ON orders.CustomerID = customers.CustomerID
WHERE employees.city = customers.city;
GO

/*-- Verification for Question 8
SELECT Employees.FirstName, employees.LastName, Employees.City, customers.City
FROM employees
INNER JOIN Orders ON employees.EmployeeID = orders.EmployeeID
INNER JOIN customers ON orders.CustomerID = customers.CustomerID
WHERE employees.FirstName = 'Janet' and Employees.LastName = 'Leverling' and customers.City = 'Kirkland'
-- More verification for Question 8, list of all of Janet Leverling's customers, none live in Kirkland
SELECT Employees.FirstName, employees.LastName, Employees.City, customers.City
FROM employees
INNER JOIN Orders ON employees.EmployeeID = orders.EmployeeID
INNER JOIN customers ON orders.CustomerID = customers.CustomerID
WHERE employees.FirstName = 'Janet' and Employees.LastName = 'Leverling';
GO*/

-- Q9
DROP PROC IF EXISTS Question9;
GO
CREATE PROCEDURE Question9
AS
SELECT firstName, lastName, address, city, region, birthdate, datediff(YY, birthdate, getdate()) AS [Age]
FROM employees
WHERE datediff(YY, birthdate, getdate()) > 60
ORDER BY [Age];
GO

-- Q10
DROP PROC IF EXISTS Question10;
GO
CREATE PROCEDURE Question10
AS
SELECT DISTINCT employees.FirstName, employees.LastName, products.ProductName
FROM employees
INNER JOIN Orders ON employees.EmployeeID = orders.EmployeeID
INNER JOIN [Order Details] ON orders.OrderID = [Order Details].orderID
INNER JOIN products ON [Order Details].ProductID = products.ProductID
WHERE products.ProductName = 'Chai';
GO

-- Q11
DROP PROC IF EXISTS Question11;
GO
CREATE PROCEDURE Question11
AS
SELECT products.SupplierID, suppliers.CompanyName, count(products.ProductID) AS [No. of Products]
FROM products INNER JOIN suppliers ON products.SupplierID = suppliers.SupplierID
GROUP BY products.SupplierID, Suppliers.CompanyName
HAVING count(products.productID) > 3;
GO

-- Q12
DROP PROC IF EXISTS Question12;
GO
CREATE PROCEDURE Question12
AS
SELECT count(customers.CustomerID) AS [Customer Num], customers.country
FROM Customers
GROUP BY customers.Country
HAVING count(customers.customerID) > 5
ORDER BY [Customer Num] DESC;
GO

-- Q13
DROP PROC IF EXISTS Question13;
GO
CREATE PROCEDURE Question13
AS
SELECT customers.CompanyName, count(orders.OrderID) AS [# OF PURCHASES]
FROM customers INNER JOIN orders ON customers.customerID = orders.customerID
GROUP BY customers.CompanyName
HAVING count(orders.orderID) > 10;
GO

-- Q14
DROP PROC IF EXISTS Question14;
GO
CREATE PROCEDURE Question14
AS
SELECT products.productName, products.CategoryID, products.UnitPrice, products.UnitsInStock, products.UnitPrice * products.UnitsInStock AS [Total Value]
FROM products;
GO

-- Q15
DROP PROC IF EXISTS Question15;
GO
CREATE PROCEDURE Question15
AS
SELECT categories.categoryName, products.ProductName, Suppliers.CompanyName
FROM Categories 
INNER JOIN products ON Categories.CategoryID = products.CategoryID
INNER JOIN Suppliers ON products.SupplierID = suppliers.SupplierID
WHERE Categories.CategoryName = 'Condiments';
GO

-- Q16
DROP PROC IF EXISTS Question16;
GO
CREATE PROCEDURE Question16
AS
SELECT customers.CompanyName, count(orders.OrderID) AS [# of Orders Placed]
FROM customers INNER JOIN orders ON customers.CustomerID = orders.CustomerID
GROUP BY customers.CompanyName;
GO

-- Q17
DROP PROC IF EXISTS Question17;
GO
CREATE PROCEDURE Question17
AS
SELECT products.ProductName, products.UnitsOnOrder, products.UnitsInStock
FROM products
WHERE products.UnitsInStock < products.UnitsOnOrder;
GO

-- Q18
DROP PROC IF EXISTS Question18;
GO
CREATE PROCEDURE Question18
AS
SELECT Categories.CategoryName, avg(products.UnitPrice) AS [AVERAGE PRICE]
FROM Categories INNER JOIN Products ON Categories.CategoryID = Products.CategoryID
GROUP BY Categories.CategoryName;
GO

-- Q19
DROP PROC IF EXISTS Question19;
GO
CREATE PROCEDURE Question19
AS
SELECT employees.FirstName + ' ' + employees.LastName AS [EmployeeName], employees.City
FROM employees 
WHERE employees.City like 'S%' or employees.City like 'T%';
GO