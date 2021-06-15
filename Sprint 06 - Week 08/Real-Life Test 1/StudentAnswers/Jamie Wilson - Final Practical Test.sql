use NORTHWND;
GO



/* 1. Restore and select the SQLTest.bak database. */


/* 2. Give the name, address, city, and region of employees. */
DROP PROC IF EXISTS Question2;
GO
CREATE PROCEDURE Question2
AS
SELECT EMPLOYEES.FirstName + ' ' + EMPLOYEES.LastName AS [Employee Name], EMPLOYEES.Address, EMPLOYEES.City, EMPLOYEES.Region FROM EMPLOYEES;
GO

/* 3. Give the name, address, city, and region of employees living in USA. */
DROP PROC IF EXISTS Question3;
GO
CREATE PROCEDURE Question3
AS
SELECT EMPLOYEES.FirstName + ' ' + EMPLOYEES.LastName AS [Employee Name], EMPLOYEES.Address,
EMPLOYEES.City, EMPLOYEES.Region, EMPLOYEES.Country FROM EMPLOYEES
WHERE EMPLOYEES.Country = 'USA';
GO

/* 4. Give the name, address, city, and region of employees that have placed orders to be delivered in Belgium. */
DROP PROC IF EXISTS Question4;
GO
CREATE PROCEDURE Question4
AS
SELECT EMPLOYEES.FirstName + ' ' + EMPLOYEES.LastName AS [Employee Name], EMPLOYEES.Address,
EMPLOYEES.City, EMPLOYEES.Region, EMPLOYEES.Country, ORDERS.ShipCountry FROM EMPLOYEES
INNER JOIN ORDERS ON EMPLOYEES.EmployeeID = ORDERS.EmployeeID
WHERE ORDERS.ShipCountry = 'Belgium'
GROUP BY EMPLOYEES.FirstName, EMPLOYEES.LastName, EMPLOYEES.Address, EMPLOYEES.City, EMPLOYEES.Region,
EMPLOYEES.Country, ORDERS.ShipCountry;
GO

/* 5. Display the First Name, Last Name, City and Hire Date of Employees
whose Last Name starts with 'S' and First Name starts with 'M'. */
DROP PROC IF EXISTS Question5;
GO
CREATE PROCEDURE Question5
AS
SELECT EMPLOYEES.FirstName, EMPLOYEES.LastName, EMPLOYEES.City, EMPLOYEES.HireDate FROM EMPLOYEES
WHERE EMPLOYEES.FirstName LIKE 'M%' AND EMPLOYEES.LastName LIKE 'S%';
GO

/* 6. Give the employee name and the customer name for orders that are sent by the company �Speedy Express� to customers who live in Bruxelles. */
DROP PROC IF EXISTS Question6;
GO
CREATE PROCEDURE Question6
AS
SELECT SHIPPERS.ShipperID, SHIPPERS.CompanyName FROM SHIPPERS
INNER JOIN ORDERS ON SHIPPERS.ShipperID = ORDERS.ShipVia
INNER JOIN CUSTOMERS ON ORDERS.CustomerID = CUSTOMERS.CustomerID
INNER JOIN EMPLOYEES ON ORDERS.EmployeeID = EMPLOYEES.EmployeeID
WHERE SHIPPERS.CompanyName = 'Speedy Express'
GROUP BY SHIPPERS.ShipperID, SHIPPERS.CompanyName;
GO




/* 7. Give the title and name of employees who have sold at least one of the products �Gravad Lax� or �Mishi Kobe Niku�. Names should not repeat if they have sold both or one item twice. */
DROP PROC IF EXISTS Question7;
GO
/* 8. Give the name of employees and the city where they live for employees who have sold to customers in the same city. */
DROP PROC IF EXISTS Question8;
GO

/* 9. Write a query to get the name, address, city, and region of employees older than 60 years. */
DROP PROC IF EXISTS Question9;
GO
CREATE PROCEDURE Question9
AS
SELECT * FROM EMPLOYEES
WHERE EMPLOYEES.BirthDate < '1961-06-02';
GO


/* 10. Give the name of all employees who sold �Chai�. */
DROP PROC IF EXISTS Question10;
GO
CREATE PROCEDURE Question10
AS
SELECT EMPLOYEES.FirstName, EMPLOYEES.LastName, PRODUCTS.ProductName FROM PRODUCTS
INNER JOIN [Order Details] ON PRODUCTS.ProductID = [Order Details].ProductID
INNER JOIN ORDERS ON [Order Details].OrderID = ORDERS.OrderID
INNER JOIN EMPLOYEES ON ORDERS.EmployeeID = EMPLOYEES.EmployeeID
WHERE PRODUCTS.ProductName = 'Chai'
GROUP BY PRODUCTS.ProductName, EMPLOYEES.FirstName, EMPLOYEES.LastName;
GO


/* 11. Give the identifier and the name of the companies that provide more than 3 products. */
DROP PROC IF EXISTS Question11;
GO

/* 12. Write a query that lists the number of customers in each country. Only include countries with more than
5 customers and order them by descending order of Number of Companies. */
DROP PROC IF EXISTS Question12;
GO
CREATE PROCEDURE Question12
AS
SELECT COUNT(CUSTOMERS.CompanyName) AS [Number of Customers], CUSTOMERS.Country FROM CUSTOMERS
GROUP BY CUSTOMERS.Country
HAVING COUNT(CUSTOMERS.COUNTRY) > 5
ORDER BY CUSTOMERS.Country DESC;
GO


/* 13. Give the name of customers who have MADE MORE THAN 10 purchases OF any product. */
DROP PROC IF EXISTS Question13;
GO
CREATE PROCEDURE Question13
AS
SELECT CUSTOMERS.CompanyName, COUNT([Order Details].ProductID) AS [# OF PURCHASES] FROM CUSTOMERS
INNER JOIN ORDERS ON CUSTOMERS.CustomerID = ORDERS.CustomerID
INNER JOIN [Order Details] ON ORDERS.OrderID = [Order Details].OrderID
INNER JOIN PRODUCTS ON [Order Details].ProductID = PRODUCTS.ProductID
GROUP BY CUSTOMERS.CompanyName
HAVING COUNT([Order Details].ProductID) > '10';
GO

/* 14. Give the ProductName, CategoryID, UnitPrice, UnitsInStock and Total Value of all the products. */
DROP PROC IF EXISTS Question14;
GO
CREATE PROCEDURE Question14
AS
SELECT PRODUCTS.ProductName, PRODUCTS.CategoryID, PRODUCTS.UnitPrice, PRODUCTS.UnitsInStock,
(PRODUCTS.UnitPrice * Products.UnitsInStock) AS [Total Value] FROM PRODUCTS;
GO

/* 15. For ALL Condiments, display the Category Name, the Product Name, and the Company Name of the supplier. */
DROP PROC IF EXISTS Question15;
GO
CREATE PROCEDURE Question15
AS
SELECT CATEGORIES.CategoryName, PRODUCTS.ProductName, SUPPLIERS.CompanyName FROM CATEGORIES
INNER JOIN PRODUCTS ON CATEGORIES.CategoryID = PRODUCTS.CategoryID
INNER JOIN SUPPLIERS ON PRODUCTS.SupplierID = SUPPLIERS.SupplierID 
WHERE CATEGORIES.CategoryName = 'Condiments';
GO

/* 16. Make a complete list of customers along with the number of orders they have placed. (My query yielded 89 records.) */
DROP PROC IF EXISTS Question16;
GO
CREATE PROCEDURE Question16
AS
SELECT CUSTOMERS.CompanyName, COUNT(ORDERS.CustomerID) AS [# of Orders Placed] FROM CUSTOMERS
INNER JOIN ORDERS ON CUSTOMERS.CustomerID = ORDERS.CustomerID
GROUP BY CUSTOMERS.CompanyName;
GO

/* 17. Write a query to get Product list (product name, units on order, and units in stock)
where quantity of stock is less than the quantity on order. */
DROP PROC IF EXISTS Question17;
GO
CREATE PROCEDURE Question17
AS
SELECT PRODUCTS.ProductName, PRODUCTS.UnitsInStock, PRODUCTS.UnitsOnOrder FROM PRODUCTS
WHERE PRODUCTS.UnitsInStock < PRODUCTS.UnitsOnOrder;
GO
 
/* 18. Give the average price of products by EACH category. */
DROP PROC IF EXISTS Question18;
GO
CREATE PROCEDURE Question18
AS
SELECT CATEGORIES.CategoryName, AVG(PRODUCTS.UnitPrice) AS [AVERAGE PRICE] FROM PRODUCTS
INNER JOIN CATEGORIES ON PRODUCTS.CategoryID = CATEGORIES.CategoryID
GROUP BY CATEGORIES.CategoryName ;
GO

/* 19. Display the First Name and Last Name (concatenated)
and City of all Employees who live in cities that start with the letter �S� or �T�. */
DROP PROC IF EXISTS Question19;
GO
CREATE PROCEDURE Question19
AS
SELECT EMPLOYEES.FirstName + ' ' + EMPLOYEES.LastName AS [EmployeeName], EMPLOYEES.City FROM EMPLOYEES
WHERE EMPLOYEES.City LIKE 'S%' OR EMPLOYEES.City LIKE 'T%';
GO

/*SELECT * FROM CATEGORIES;
SELECT * FROM CUSTOMERS;
SELECT * FROM EMPLOYEES;
SELECT * FROM EMPLOYEETERRITORIES;
SELECT * FROM [Order Details]
SELECT * FROM ORDERS;
SELECT * FROM PRODUCTS;
SELECT * FROM REGION;
SELECT * FROM SHIPPERS;
SELECT * FROM SUPPLIERS;
SELECT * FROM TERRITORIES;*/
