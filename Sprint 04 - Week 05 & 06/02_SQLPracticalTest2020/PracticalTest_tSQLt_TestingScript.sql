USE master;
USE NORTHWND;
GO

EXEC tSQLt.NewTestClass 'testPracticalSQLQueries';
GO

CREATE PROCEDURE testPracticalSQLQueries.[TEST QUESTION 01]
AS
BEGIN

	-- STUDENT ANSWER --
	CREATE TABLE Actual (
		SupplierID INT,
		CompanyName VARCHAR(50)
	);

	INSERT INTO Actual
	EXEC Question1;
	-- STUDENT ANSWER --

	-- EXPECTED CORRECT ANSWER --

	CREATE TABLE Expected (
		SupplierID INT,
		CompanyName VARCHAR(50)
	);

	INSERT INTO Expected
	EXEC Question1_ModelAnswer
	-- EXPECTED CORRECT ANSWER --

	EXEC tSQLt.AssertEqualsTable 'Expected', 'Actual', 'Incorrect Answer!';

END;
GO

CREATE PROCEDURE testPracticalSQLQueries.[TEST QUESTION 02]
AS
BEGIN

	-- STUDENT ANSWER --
	CREATE TABLE Actual (
		SupplierID INT,
		CompanyName VARCHAR(50)
	);

	INSERT INTO Actual
	EXEC Question2;
	-- STUDENT ANSWER --

	-- EXPECTED CORRECT ANSWER --

	CREATE TABLE Expected (
		SupplierID INT,
		CompanyName VARCHAR(50)
	);

	INSERT INTO Expected
	EXEC Question2_ModelAnswer
	-- EXPECTED CORRECT ANSWER --

	EXEC tSQLt.AssertEqualsTable 'Expected', 'Actual', 'Incorrect Answer!';

END;
GO

CREATE PROCEDURE testPracticalSQLQueries.[TEST QUESTION 03]
AS
BEGIN

	-- STUDENT ANSWER --
	CREATE TABLE Actual (
		Country VARCHAR(25),
		numberOfCustomers INT
	);

	INSERT INTO Actual
	EXEC Question3;
	-- STUDENT ANSWER --

	-- EXPECTED CORRECT ANSWER --

	CREATE TABLE Expected (
		Country VARCHAR(25),
		numberOfCustomers INT
	);

	INSERT INTO Expected
	EXEC Question3_ModelAnswer
	-- EXPECTED CORRECT ANSWER --

	EXEC tSQLt.AssertEqualsTable 'Expected', 'Actual', 'Incorrect Answer!';

END;
GO

CREATE PROCEDURE testPracticalSQLQueries.[TEST QUESTION 04]
AS
BEGIN

	-- STUDENT ANSWER --
	CREATE TABLE Actual (
		ProductID INT,
		ProductName VARCHAR(100)
	);

	INSERT INTO Actual
	EXEC Question4;
	-- STUDENT ANSWER --

	-- EXPECTED CORRECT ANSWER --

	CREATE TABLE Expected (
		ProductID INT,
		ProductName VARCHAR(100)
	);

	INSERT INTO Expected
	EXEC Question4_ModelAnswer
	-- EXPECTED CORRECT ANSWER --

	EXEC tSQLt.AssertEqualsTable 'Expected', 'Actual', 'Incorrect Answer!';

END;
GO

CREATE PROCEDURE testPracticalSQLQueries.[TEST QUESTION 05]
AS
BEGIN

	-- STUDENT ANSWER --
	CREATE TABLE Actual (
		SupplierID INT,
		CompanyName VARCHAR(100)
	);

	INSERT INTO Actual
	EXEC Question5;
	-- STUDENT ANSWER --

	-- EXPECTED CORRECT ANSWER --

	CREATE TABLE Expected (
		SupplierID INT,
		CompanyName VARCHAR(100)
	);

	INSERT INTO Expected
	EXEC Question5_ModelAnswer
	-- EXPECTED CORRECT ANSWER --

	EXEC tSQLt.AssertEqualsTable 'Expected', 'Actual', 'Incorrect Answer!';

END;
GO

CREATE PROCEDURE testPracticalSQLQueries.[TEST QUESTION 06]
AS
BEGIN

	-- STUDENT ANSWER --
	CREATE TABLE Actual (
		FullName VARCHAR(50),
		City VARCHAR(25)
	);

	INSERT INTO Actual
	EXEC Question6;
	-- STUDENT ANSWER --

	-- EXPECTED CORRECT ANSWER --

	CREATE TABLE Expected (
		FullName VARCHAR(50),
		City VARCHAR(25)
	);

	INSERT INTO Expected
	EXEC Question6_ModelAnswer
	-- EXPECTED CORRECT ANSWER --

	EXEC tSQLt.AssertEqualsTable 'Expected', 'Actual', 'Incorrect Answer!';

END;
GO

CREATE PROCEDURE testPracticalSQLQueries.[TEST QUESTION 07]
AS
BEGIN

	-- STUDENT ANSWER --
	CREATE TABLE Actual (
		CategoryName VARCHAR(25),
		ProductName VARCHAR(100),
		CompanyName VARCHAR(100)
	);

	INSERT INTO Actual
	EXEC Question7;
	-- STUDENT ANSWER --

	-- EXPECTED CORRECT ANSWER --

	CREATE TABLE Expected (
		CategoryName VARCHAR(25),
		ProductName VARCHAR(100),
		CompanyName VARCHAR(100)
	);

	INSERT INTO Expected
	EXEC Question7_ModelAnswer
	-- EXPECTED CORRECT ANSWER --

	EXEC tSQLt.AssertEqualsTable 'Expected', 'Actual', 'Incorrect Answer!';

END;
GO

CREATE PROCEDURE testPracticalSQLQueries.[TEST QUESTION 08]
AS
BEGIN

	-- STUDENT ANSWER --
	CREATE TABLE Actual (
		numberOfProductsStartingWithB INT
	);

	INSERT INTO Actual
	EXEC Question8;
	-- STUDENT ANSWER --

	-- EXPECTED CORRECT ANSWER --

	CREATE TABLE Expected (
		numberOfProductsStartingWithB INT
	);

	INSERT INTO Expected
	EXEC Question8_ModelAnswer
	-- EXPECTED CORRECT ANSWER --

	EXEC tSQLt.AssertEqualsTable 'Expected', 'Actual', 'Incorrect Answer!';

END;
GO

CREATE PROCEDURE testPracticalSQLQueries.[TEST QUESTION 09]
AS
BEGIN

	-- STUDENT ANSWER --
	CREATE TABLE Actual (
		ProductName VARCHAR(100),
		UnitPrice MONEY,
		UnitsInStock INT
	);

	INSERT INTO Actual
	EXEC Question9;
	-- STUDENT ANSWER --

	-- EXPECTED CORRECT ANSWER --

	CREATE TABLE Expected (
		ProductName VARCHAR(100),
		UnitPrice MONEY,
		UnitsInStock INT
	);

	INSERT INTO Expected
	EXEC Question9_ModelAnswer
	-- EXPECTED CORRECT ANSWER --

	EXEC tSQLt.AssertEqualsTable 'Expected', 'Actual', 'Incorrect Answer!';

END;
GO

CREATE PROCEDURE testPracticalSQLQueries.[TEST QUESTION 10]
AS
BEGIN

	-- STUDENT ANSWER --
	CREATE TABLE Actual (
		ProductID INT,
		ProductName VARCHAR(100),
		UnitPrice DECIMAL(4,2),
		UnitsOnStock INT
	);

	INSERT INTO Actual
	EXEC Question10;
	-- STUDENT ANSWER --

	-- EXPECTED CORRECT ANSWER --

	CREATE TABLE Expected (
		ProductID INT,
		ProductName VARCHAR(100),
		UnitPrice DECIMAL(4,2),
		UnitsOnStock INT
	);

	INSERT INTO Expected
	EXEC Question10_ModelAnswer
	-- EXPECTED CORRECT ANSWER --

	EXEC tSQLt.AssertEqualsTable 'Expected', 'Actual', 'Incorrect Answer!';

END;
GO

CREATE PROCEDURE testPracticalSQLQueries.[TEST QUESTION 11]
AS
BEGIN

	-- STUDENT ANSWER --
	CREATE TABLE Actual (
		UnitsOnStock INT,
		ProductName VARCHAR(100)
	);

	INSERT INTO Actual
	EXEC Question11;
	-- STUDENT ANSWER --

	-- EXPECTED CORRECT ANSWER --

	CREATE TABLE Expected (
		UnitsOnStock INT,
		ProductName VARCHAR(100)
	);

	INSERT INTO Expected
	EXEC Question11_ModelAnswer
	-- EXPECTED CORRECT ANSWER --

	EXEC tSQLt.AssertEqualsTable 'Expected', 'Actual', 'Incorrect Answer!';

END;
GO

CREATE PROCEDURE testPracticalSQLQueries.[TEST QUESTION 12]
AS
BEGIN

	-- STUDENT ANSWER --
	CREATE TABLE Actual (
		Freight MONEY,
		OrderID INT,
		OrderDate DATE,
		ShippedDate DATE,
		CustomerID VARCHAR(10),
		ShipCountry VARCHAR(25)
	);

	INSERT INTO Actual
	EXEC Question12;
	-- STUDENT ANSWER --

	-- EXPECTED CORRECT ANSWER --

	CREATE TABLE Expected (
		Freight MONEY,
		OrderID INT,
		OrderDate DATE,
		ShippedDate DATE,
		CustomerID VARCHAR(10),
		ShipCountry VARCHAR(25)
	);

	INSERT INTO Expected
	EXEC Question12_ModelAnswer
	-- EXPECTED CORRECT ANSWER --

	EXEC tSQLt.AssertEqualsTable 'Expected', 'Actual', 'Incorrect Answer!';

END;
GO

CREATE PROCEDURE testPracticalSQLQueries.[TEST QUESTION 13]
AS
BEGIN

	-- STUDENT ANSWER --
	CREATE TABLE Actual (
		Country VARCHAR(25),
		numberOfCustomers INT
	);

	INSERT INTO Actual
	EXEC Question13;
	-- STUDENT ANSWER --

	-- EXPECTED CORRECT ANSWER --

	CREATE TABLE Expected (
		Country VARCHAR(25),
		numberOfCustomers INT
	);

	INSERT INTO Expected
	EXEC Question13_ModelAnswer
	-- EXPECTED CORRECT ANSWER --

	EXEC tSQLt.AssertEqualsTable 'Expected', 'Actual', 'Incorrect Answer!';

END;
GO

CREATE PROCEDURE testPracticalSQLQueries.[TEST QUESTION 14]
AS
BEGIN

	-- STUDENT ANSWER --
	CREATE TABLE Actual (
		CompanyName VARCHAR(25),
		ContactName VARCHAR(50),
		ContactTitle VARCHAR(50),
		City VARCHAR(25),
		Country VARCHAR(25)
	);

	INSERT INTO Actual
	EXEC Question14;
	-- STUDENT ANSWER --

	-- EXPECTED CORRECT ANSWER --

	CREATE TABLE Expected (
		CompanyName VARCHAR(25),
		ContactName VARCHAR(50),
		ContactTitle VARCHAR(50),
		City VARCHAR(25),
		Country VARCHAR(25)
	);

	INSERT INTO Expected
	EXEC Question14_ModelAnswer
	-- EXPECTED CORRECT ANSWER --

	EXEC tSQLt.AssertEqualsTable 'Expected', 'Actual', 'Incorrect Answer!';

END;
GO

CREATE PROCEDURE testPracticalSQLQueries.[TEST QUESTION 15]
AS
BEGIN

	-- STUDENT ANSWER --
	CREATE TABLE Actual (
		FullName VARCHAR(50),
		City VARCHAR(25)
	);

	INSERT INTO Actual
	EXEC Question15;
	-- STUDENT ANSWER --

	-- EXPECTED CORRECT ANSWER --

	CREATE TABLE Expected (
		FullName VARCHAR(50),
		City VARCHAR(25)
	);

	INSERT INTO Expected
	EXEC Question15_ModelAnswer
	-- EXPECTED CORRECT ANSWER --

	EXEC tSQLt.AssertEqualsTable 'Expected', 'Actual', 'Incorrect Answer!';

END;
GO

CREATE PROCEDURE testPracticalSQLQueries.[TEST QUESTION 16]
AS
BEGIN

	-- STUDENT ANSWER --
	CREATE TABLE Actual (
		EmployeeID INT,
		FirstName VARCHAR(25),
		LastName VARCHAR(25),
		TerritoryDescription VARCHAR(50)
	);

	INSERT INTO Actual
	EXEC Question16;
	-- STUDENT ANSWER --

	-- EXPECTED CORRECT ANSWER --

	CREATE TABLE Expected (
		EmployeeID INT,
		FirstName VARCHAR(25),
		LastName VARCHAR(25),
		TerritoryDescription VARCHAR(50)
	);

	INSERT INTO Expected
	EXEC Question16_ModelAnswer
	-- EXPECTED CORRECT ANSWER --

	EXEC tSQLt.AssertEqualsTable 'Expected', 'Actual', 'Incorrect Answer!';

END;
GO

CREATE PROCEDURE testPracticalSQLQueries.[TEST QUESTION 17]
AS
BEGIN

	-- STUDENT ANSWER --
	CREATE TABLE Actual (
		CustomerID VARCHAR(25),
		CompanyName VARCHAR(100)
	);

	INSERT INTO Actual
	EXEC Question17;
	-- STUDENT ANSWER --

	-- EXPECTED CORRECT ANSWER --

	CREATE TABLE Expected (
		CustomerID VARCHAR(25),
		CompanyName VARCHAR(100)
	);

	INSERT INTO Expected
	EXEC Question17_ModelAnswer
	-- EXPECTED CORRECT ANSWER --

	EXEC tSQLt.AssertEqualsTable 'Expected', 'Actual', 'Incorrect Answer!';

END;
GO

CREATE PROCEDURE testPracticalSQLQueries.[TEST QUESTION 18]
AS
BEGIN

	-- STUDENT ANSWER --
	CREATE TABLE Actual (
		employeesName VARCHAR(50),
		customersName VARCHAR(50)
	);

	INSERT INTO Actual
	EXEC Question18;
	-- STUDENT ANSWER --

	-- EXPECTED CORRECT ANSWER --

	CREATE TABLE Expected (
		employeesName VARCHAR(50),
		customersName VARCHAR(50)
	);

	INSERT INTO Expected
	EXEC Question18_ModelAnswer
	-- EXPECTED CORRECT ANSWER --

	EXEC tSQLt.AssertEqualsTable 'Expected', 'Actual', 'Incorrect Answer!';

END;
GO

CREATE PROCEDURE testPracticalSQLQueries.[TEST QUESTION 19]
AS
BEGIN

	-- STUDENT ANSWER --
	CREATE TABLE Actual (
		FullName VARCHAR(50),
		Title VARCHAR(100)
	);

	INSERT INTO Actual
	EXEC Question19;
	-- STUDENT ANSWER --

	-- EXPECTED CORRECT ANSWER --

	CREATE TABLE Expected (
		FullName VARCHAR(50),
		Title VARCHAR(100)
	);

	INSERT INTO Expected
	EXEC Question19_ModelAnswer
	-- EXPECTED CORRECT ANSWER --

	EXEC tSQLt.AssertEqualsTable 'Expected', 'Actual', 'Incorrect Answer!';

END;
GO

EXEC tSQLt.Run 'testPracticalSQLQueries';