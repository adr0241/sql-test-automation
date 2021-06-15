USE master;
USE NORTHWND;
GO

EXEC tSQLt.NewTestClass 'testDE103PracticalTest';
GO

CREATE PROCEDURE testDE103PracticalTest.[TEST QUESTION 02]
AS
BEGIN

	CREATE TABLE Actual (
		FirstName VARCHAR(50),
		LastName VARCHAR(50),
		Address VARCHAR(100),
		City VARCHAR(50),
		Region VARCHAR(5)
	);

	INSERT INTO Actual
	EXEC Question2;

	CREATE TABLE Expected (
		FirstName VARCHAR(50),
		LastName VARCHAR(50),
		Address VARCHAR(100),
		City VARCHAR(50),
		Region VARCHAR(5)
	);

	INSERT INTO Expected
	EXEC Question2_ModelAnswer

	EXEC tSQLt.AssertEqualsTable 'Expected', 'Actual', 'Incorrect Answer!';

END;
GO

CREATE PROCEDURE testDE103PracticalTest.[TEST QUESTION 03]
AS
BEGIN

	CREATE TABLE Actual (
		FirstName VARCHAR(50),
		LastName VARCHAR(50),
		Address VARCHAR(100),
		City VARCHAR(50),
		Region VARCHAR(5),
		Country VARCHAR(5)
	);

	INSERT INTO Actual
	EXEC Question3;

	CREATE TABLE Expected (
		FirstName VARCHAR(50),
		LastName VARCHAR(50),
		Address VARCHAR(100),
		City VARCHAR(50),
		Region VARCHAR(5),
		Country VARCHAR(5)
	);

	INSERT INTO Expected
	EXEC Question3_ModelAnswer

	EXEC tSQLt.AssertEqualsTable 'Expected', 'Actual', 'Incorrect Answer!';

END;
GO

CREATE PROCEDURE testDE103PracticalTest.[TEST QUESTION 04]
AS
BEGIN

	CREATE TABLE Actual (
		FirstName VARCHAR(50),
		LastName VARCHAR(50),
		Address VARCHAR(100),
		City VARCHAR(50),
		Region VARCHAR(5),
		ShipCountry VARCHAR(50)
	);

	INSERT INTO Actual
	EXEC Question4;

	CREATE TABLE Expected (
		FirstName VARCHAR(50),
		LastName VARCHAR(50),
		Address VARCHAR(100),
		City VARCHAR(50),
		Region VARCHAR(5),
		ShipCountry VARCHAR(50)
	);

	INSERT INTO Expected
	EXEC Question4_ModelAnswer

	EXEC tSQLt.AssertEqualsTable 'Expected', 'Actual', 'Incorrect Answer!';

END;
GO

CREATE PROCEDURE testDE103PracticalTest.[TEST QUESTION 05]
AS
BEGIN

	CREATE TABLE Actual (
		FirstName VARCHAR(50),
		LastName VARCHAR(50),
		City VARCHAR(50),
		HireDate DATE
	);

	INSERT INTO Actual
	EXEC Question5;

	CREATE TABLE Expected (
		FirstName VARCHAR(50),
		LastName VARCHAR(50),
		City VARCHAR(50),
		HireDate DATE
	);

	INSERT INTO Expected
	EXEC Question5_ModelAnswer

	EXEC tSQLt.AssertEqualsTable 'Expected', 'Actual', 'Incorrect Answer!';

END;
GO

CREATE PROCEDURE testDE103PracticalTest.[TEST QUESTION 06]
AS
BEGIN

	CREATE TABLE Actual (
		FirstName VARCHAR(50),
		LastName VARCHAR(50),
		CompanyName VARCHAR(50),
		CompanyName2 VARCHAR(50)
	);

	INSERT INTO Actual
	EXEC Question6;

	CREATE TABLE Expected (
		FirstName VARCHAR(50),
		LastName VARCHAR(50),
		CompanyName VARCHAR(50),
		CompanyName2 VARCHAR(50)
	);

	INSERT INTO Expected
	EXEC Question6_ModelAnswer

	EXEC tSQLt.AssertEqualsTable 'Expected', 'Actual', 'Incorrect Answer!';

END;
GO

CREATE PROCEDURE testDE103PracticalTest.[TEST QUESTION 07]
AS
BEGIN

	CREATE TABLE Actual (
		Title VARCHAR(100),
		FirstName VARCHAR(50),
		LastName VARCHAR(50)
	);

	INSERT INTO Actual
	EXEC Question7;

	CREATE TABLE Expected (
		Title VARCHAR(100),
		FirstName VARCHAR(50),
		LastName VARCHAR(50)
	);

	INSERT INTO Expected
	EXEC Question7_ModelAnswer

	EXEC tSQLt.AssertEqualsTable 'Expected', 'Actual', 'Incorrect Answer!';

END;
GO

CREATE PROCEDURE testDE103PracticalTest.[TEST QUESTION 08]
AS
BEGIN

	CREATE TABLE Actual (
		FirstName VARCHAR(50),
		LastName VARCHAR(50),
		City VARCHAR(50)
	);

	INSERT INTO Actual
	EXEC Question8;

	CREATE TABLE Expected (
		FirstName VARCHAR(50),
		LastName VARCHAR(50),
		City VARCHAR(50)
	);

	INSERT INTO Expected
	EXEC Question8_ModelAnswer

	EXEC tSQLt.AssertEqualsTable 'Expected', 'Actual', 'Incorrect Answer!';

END;
GO

CREATE PROCEDURE testDE103PracticalTest.[TEST QUESTION 09]
AS
BEGIN

	CREATE TABLE Actual (
		FirstName VARCHAR(50),
		LastName VARCHAR(50),
		Address VARCHAR(100),
		City VARCHAR(50),
		Region VARCHAR(5),
		BIRTHDATE INT,
		Age INT
	);

	INSERT INTO Actual
	EXEC Question9;

	CREATE TABLE Expected (
		FirstName VARCHAR(50),
		LastName VARCHAR(50),
		Address VARCHAR(100),
		City VARCHAR(50),
		Region VARCHAR(5),
		BIRTHDATE INT,
		Age INT
	);

	INSERT INTO Expected
	EXEC Question9_ModelAnswer

	EXEC tSQLt.AssertEqualsTable 'Expected', 'Actual', 'Incorrect Answer!';

END;
GO

CREATE PROCEDURE testDE103PracticalTest.[TEST QUESTION 10]
AS
BEGIN

	CREATE TABLE Actual (
		FirstName VARCHAR(50),
		LastName VARCHAR(50),
		ProductName VARCHAR(100)
	);

	INSERT INTO Actual
	EXEC Question10;

	CREATE TABLE Expected (
		FirstName VARCHAR(50),
		LastName VARCHAR(50),
		ProductName VARCHAR(100)
	);

	INSERT INTO Expected
	EXEC Question10_ModelAnswer

	EXEC tSQLt.AssertEqualsTable 'Expected', 'Actual', 'Incorrect Answer!';

END;
GO

CREATE PROCEDURE testDE103PracticalTest.[TEST QUESTION 11]
AS
BEGIN

	CREATE TABLE Actual (
		SupplierID INT,
		CompanyName VARCHAR(100),
		NumberofProducts INT
	);

	INSERT INTO Actual
	EXEC Question11;

	CREATE TABLE Expected (
		SupplierID INT,
		CompanyName VARCHAR(100),
		NumberofProducts INT
	);

	INSERT INTO Expected
	EXEC Question11_ModelAnswer

	EXEC tSQLt.AssertEqualsTable 'Expected', 'Actual', 'Incorrect Answer!';

END;
GO

CREATE PROCEDURE testDE103PracticalTest.[TEST QUESTION 12]
AS
BEGIN

	CREATE TABLE Actual (
		CustomerNum INT,
		Country VARCHAR(50)
	);

	INSERT INTO Actual
	EXEC Question12;

	CREATE TABLE Expected (
		CustomerNum INT,
		Country VARCHAR(50)
	);

	INSERT INTO Expected
	EXEC Question12_ModelAnswer

	EXEC tSQLt.AssertEqualsTable 'Expected', 'Actual', 'Incorrect Answer!';

END;
GO

CREATE PROCEDURE testDE103PracticalTest.[TEST QUESTION 13]
AS
BEGIN

	CREATE TABLE Actual (
		CompanyName VARCHAR(100),
		NumberOfPurchases INT
	);

	INSERT INTO Actual
	EXEC Question13;

	CREATE TABLE Expected (
		CompanyName VARCHAR(100),
		NumberOfPurchases INT
	);

	INSERT INTO Expected
	EXEC Question13_ModelAnswer

	EXEC tSQLt.AssertEqualsTable 'Expected', 'Actual', 'Incorrect Answer!';

END;
GO

CREATE PROCEDURE testDE103PracticalTest.[TEST QUESTION 14]
AS
BEGIN

	CREATE TABLE Actual (
		ProductName VARCHAR(100),
		CategoryID INT,
		UnitPrice MONEY,
		UnitsInStock INT,
		TotalValue MONEY
	);

	INSERT INTO Actual
	EXEC Question14;

	CREATE TABLE Expected (
		ProductName VARCHAR(100),
		CategoryID INT,
		UnitPrice MONEY,
		UnitsInStock INT,
		TotalValue MONEY
	);

	INSERT INTO Expected
	EXEC Question14_ModelAnswer

	EXEC tSQLt.AssertEqualsTable 'Expected', 'Actual', 'Incorrect Answer!';

END;
GO

CREATE PROCEDURE testDE103PracticalTest.[TEST QUESTION 15]
AS
BEGIN

	CREATE TABLE Actual (
		CategoryName VARCHAR(100),
		ProductName VARCHAR(100),
		CompanyName VARCHAR(100)
	);

	INSERT INTO Actual
	EXEC Question15;

	CREATE TABLE Expected (
		CategoryName VARCHAR(100),
		ProductName VARCHAR(100),
		CompanyName VARCHAR(100)
	);

	INSERT INTO Expected
	EXEC Question15_ModelAnswer

	EXEC tSQLt.AssertEqualsTable 'Expected', 'Actual', 'Incorrect Answer!';

END;
GO

CREATE PROCEDURE testDE103PracticalTest.[TEST QUESTION 16]
AS
BEGIN

	CREATE TABLE Actual (
		CompanyName VARCHAR(100),
		NumberOfOrders INT
	);

	INSERT INTO Actual
	EXEC Question16;

	CREATE TABLE Expected (
		CompanyName VARCHAR(100),
		NumberOfOrders INT
	);

	INSERT INTO Expected
	EXEC Question16_ModelAnswer

	EXEC tSQLt.AssertEqualsTable 'Expected', 'Actual', 'Incorrect Answer!';

END;
GO

CREATE PROCEDURE testDE103PracticalTest.[TEST QUESTION 17]
AS
BEGIN

	CREATE TABLE Actual (
		ProductName VARCHAR(100),
		UnitsOnOrder INT,
		UnitsInStock INT
	);

	INSERT INTO Actual
	EXEC Question17;

	CREATE TABLE Expected (
		ProductName VARCHAR(100),
		UnitsOnOrder INT,
		UnitsInStock INT
	);

	INSERT INTO Expected
	EXEC Question17_ModelAnswer

	EXEC tSQLt.AssertEqualsTable 'Expected', 'Actual', 'Incorrect Answer!';

END;
GO

CREATE PROCEDURE testDE103PracticalTest.[TEST QUESTION 18]
AS
BEGIN

	CREATE TABLE Actual (
		CategoryName VARCHAR(100),
		AveragePrice MONEY
	);

	INSERT INTO Actual
	EXEC Question18;

	CREATE TABLE Expected (
		CategoryName VARCHAR(100),
		AveragePrice MONEY
	);

	INSERT INTO Expected
	EXEC Question18_ModelAnswer

	EXEC tSQLt.AssertEqualsTable 'Expected', 'Actual', 'Incorrect Answer!';

END;
GO

CREATE PROCEDURE testDE103PracticalTest.[TEST QUESTION 19]
AS
BEGIN

	CREATE TABLE Actual (
		EmployeeName VARCHAR(100),
		City VARCHAR(50)
	);

	INSERT INTO Actual
	EXEC Question19;

	CREATE TABLE Expected (
		EmployeeName VARCHAR(100),
		City VARCHAR(50)
	);

	INSERT INTO Expected
	EXEC Question19_ModelAnswer


	EXEC tSQLt.AssertEqualsTable 'Expected', 'Actual', 'Incorrect Answer!';

END;
GO

EXEC tSQLt.Run 'testDE103PracticalTest';