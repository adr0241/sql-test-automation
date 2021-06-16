USE master;
USE Clientorders;
GO

EXEC tSQLt.NewTestClass 'testSQLPracticalTest';
GO

CREATE PROCEDURE testSQLPracticalTest.[TEST QUESTION 02]
AS
BEGIN

	CREATE TABLE Actual (
		firstname VARCHAR(100),
		lastname VARCHAR(100),
		city VARCHAR(100)
	);

	CREATE TABLE Expected (
		firstname VARCHAR(100),
		lastname VARCHAR(100),
		city VARCHAR(100)
	);

	INSERT INTO Actual
	EXEC Question2;

	INSERT INTO Expected
	EXEC Question2_ModelAnswer

	EXEC tSQLt.AssertEqualsTable 'Expected', 'Actual', 'Incorrect Answer!';

END;
GO

CREATE PROCEDURE testSQLPracticalTest.[TEST QUESTION 03]
AS
BEGIN

	CREATE TABLE Actual (
		firstname VARCHAR(100),
		lastname VARCHAR(100)
	);

	CREATE TABLE Expected (
		firstname VARCHAR(100),
		lastname VARCHAR(100)
	);

	INSERT INTO Actual
	EXEC Question3;

	INSERT INTO Expected
	EXEC Question3_ModelAnswer

	EXEC tSQLt.AssertEqualsTable 'Expected', 'Actual', 'Incorrect Answer!';

END;
GO

CREATE PROCEDURE testSQLPracticalTest.[TEST QUESTION 04]
AS
BEGIN

	CREATE TABLE Actual (
		firstname VARCHAR(100),
		lastname VARCHAR(100),
		balance DECIMAL(10,2)
	);

	CREATE TABLE Expected (
		firstname VARCHAR(100),
		lastname VARCHAR(100),
		balance DECIMAL(10,2)
	);

	INSERT INTO Actual
	EXEC Question4;

	INSERT INTO Expected
	EXEC Question4_ModelAnswer

	EXEC tSQLt.AssertEqualsTable 'Expected', 'Actual', 'Incorrect Answer!';

END;
GO

CREATE PROCEDURE testSQLPracticalTest.[TEST QUESTION 05]
AS
BEGIN

	CREATE TABLE Actual (
		firstname VARCHAR(100),
		lastname VARCHAR(100),
		city VARCHAR(100)
	);

	CREATE TABLE Expected (
		firstname VARCHAR(100),
		lastname VARCHAR(100),
		city VARCHAR(100)
	);

	INSERT INTO Actual
	EXEC Question5;

	INSERT INTO Expected
	EXEC Question5_ModelAnswer

	EXEC tSQLt.AssertEqualsTable 'Expected', 'Actual', 'Incorrect Answer!';

END;
GO

CREATE PROCEDURE testSQLPracticalTest.[TEST QUESTION 06]
AS
BEGIN

	CREATE TABLE Actual (
		firstname VARCHAR(100),
		lastname VARCHAR(100),
		balance DECIMAL(10,2),
		city VARCHAR(100)
	);

	CREATE TABLE Expected (
		firstname VARCHAR(100),
		lastname VARCHAR(100),
		balance DECIMAL(10,2),
		city VARCHAR(100)
	);

	INSERT INTO Actual
	EXEC Question6;

	INSERT INTO Expected
	EXEC Question6_ModelAnswer

	EXEC tSQLt.AssertEqualsTable 'Expected', 'Actual', 'Incorrect Answer!';

END;
GO

CREATE PROCEDURE testSQLPracticalTest.[TEST QUESTION 07]
AS
BEGIN

	CREATE TABLE Actual (
		custref INT,
		creditlimit INT,
		balance DECIMAL(10,2),
		NewBalance DECIMAL(10,2)
	);

	CREATE TABLE Expected (
		custref INT,
		creditlimit INT,
		balance DECIMAL(10,2),
		NewBalance DECIMAL(10,2)
	);

	INSERT INTO Actual
	EXEC Question7;

	INSERT INTO Expected
	EXEC Question7_ModelAnswer

	EXEC tSQLt.AssertEqualsTable 'Expected', 'Actual', 'Incorrect Answer!';

END;
GO

CREATE PROCEDURE testSQLPracticalTest.[TEST QUESTION 08]
AS
BEGIN

	CREATE TABLE Actual (
		orderref INT,
		partref INT,
		quantity INT,
		quotedPrice DECIMAL(10,2),
		LineTotal DECIMAL(10,2)
	);

	CREATE TABLE Expected (
		orderref INT,
		partref INT,
		quantity INT,
		quotedPrice DECIMAL(10,2),
		LineTotal DECIMAL(10,2)
	);

	INSERT INTO Actual
	EXEC Question8;

	INSERT INTO Expected
	EXEC Question8_ModelAnswer

	EXEC tSQLt.AssertEqualsTable 'Expected', 'Actual', 'Incorrect Answer!';

END;
GO

CREATE PROCEDURE testSQLPracticalTest.[TEST QUESTION 09]
AS
BEGIN

	CREATE TABLE Actual (
		orderref INT,
		orderdate DATE
	);

	CREATE TABLE Expected (
		orderref INT,
		orderdate DATE
	);

	INSERT INTO Actual
	EXEC Question9;

	INSERT INTO Expected
	EXEC Question9_ModelAnswer

	EXEC tSQLt.AssertEqualsTable 'Expected', 'Actual', 'Incorrect Answer!';

END;
GO

CREATE PROCEDURE testSQLPracticalTest.[TEST QUESTION 10]
AS
BEGIN

	CREATE TABLE Actual (
		city VARCHAR(100),
		"Number in each city" INT
	);

	CREATE TABLE Expected (
		city VARCHAR(100),
		"Number in each city" INT
	);

	INSERT INTO Actual
	EXEC Question10;

	INSERT INTO Expected
	EXEC Question10_ModelAnswer

	EXEC tSQLt.AssertEqualsTable 'Expected', 'Actual', 'Incorrect Answer!';

END;
GO

CREATE PROCEDURE testSQLPracticalTest.[TEST QUESTION 11]
AS
BEGIN

	CREATE TABLE Actual (
		repref INT,
		"Total balance" DECIMAL(10,2)
	);

	CREATE TABLE Expected (
		repref INT,
		"Total balance" DECIMAL(10,2)
	);

	INSERT INTO Actual
	EXEC Question11;

	INSERT INTO Expected
	EXEC Question11_ModelAnswer

	EXEC tSQLt.AssertEqualsTable 'Expected', 'Actual', 'Incorrect Answer!';

END;
GO

CREATE PROCEDURE testSQLPracticalTest.[TEST QUESTION 12]
AS
BEGIN

	CREATE TABLE Actual (
		city VARCHAR(100),
		"Maximum balance" DECIMAL(10,2)
	);

	CREATE TABLE Expected (
		city VARCHAR(100),
		"Maximum balance" DECIMAL(10,2)
	);

	INSERT INTO Actual
	EXEC Question12;

	INSERT INTO Expected
	EXEC Question12_ModelAnswer

	EXEC tSQLt.AssertEqualsTable 'Expected', 'Actual', 'Incorrect Answer!';

END;
GO

CREATE PROCEDURE testSQLPracticalTest.[TEST QUESTION 13]
AS
BEGIN

	CREATE TABLE Actual (
		"Client name" VARCHAR(100),
		"Rep name" VARCHAR(100)
	);

	CREATE TABLE Expected (
		"Client name" VARCHAR(100),
		"Rep name" VARCHAR(100)
	);

	INSERT INTO Actual
	EXEC Question13;

	INSERT INTO Expected
	EXEC Question13_ModelAnswer

	EXEC tSQLt.AssertEqualsTable 'Expected', 'Actual', 'Incorrect Answer!';

END;
GO

CREATE PROCEDURE testSQLPracticalTest.[TEST QUESTION 14]
AS
BEGIN

	CREATE TABLE Actual (
		orderref INT,
		firstname VARCHAR(100),
		lastname VARCHAR(100),
		orderdate DATE,
	);

	CREATE TABLE Expected (
		orderref INT,
		firstname VARCHAR(100),
		lastname VARCHAR(100),
		orderdate DATE,
	);

	INSERT INTO Actual
	EXEC Question14;

	INSERT INTO Expected
	EXEC Question14_ModelAnswer

	EXEC tSQLt.AssertEqualsTable 'Expected', 'Actual', 'Incorrect Answer!';

END;
GO

CREATE PROCEDURE testSQLPracticalTest.[TEST QUESTION 15]
AS
BEGIN

	CREATE TABLE Actual (
		orderref INT,
		description VARCHAR(100),
		onhand INT
	);

	CREATE TABLE Expected (
		orderref INT,
		description VARCHAR(100),
		onhand INT
	);

	INSERT INTO Actual
	EXEC Question15;

	INSERT INTO Expected
	EXEC Question15_ModelAnswer

	EXEC tSQLt.AssertEqualsTable 'Expected', 'Actual', 'Incorrect Answer!';

END;
GO

CREATE PROCEDURE testSQLPracticalTest.[TEST QUESTION 16]
AS
BEGIN

	CREATE TABLE Actual (
		orderref INT,
		description VARCHAR(100),
		quotedPrice DECIMAL(10,2),
		quantity INT
	);

	CREATE TABLE Expected (
		orderref INT,
		description VARCHAR(100),
		quotedPrice DECIMAL(10,2),
		quantity INT
	);

	INSERT INTO Actual
	EXEC Question16;

	INSERT INTO Expected
	EXEC Question16_ModelAnswer

	EXEC tSQLt.AssertEqualsTable 'Expected', 'Actual', 'Incorrect Answer!';

END;
GO

CREATE PROCEDURE testSQLPracticalTest.[TEST QUESTION 17]
AS
BEGIN

	CREATE TABLE Actual (
		orderref INT,
		description VARCHAR(100),
		quotedPrice DECIMAL(10,2),
		quantity INT
	);

	CREATE TABLE Expected (
		orderref INT,
		description VARCHAR(100),
		quotedPrice DECIMAL(10,2),
		quantity INT
	);

	INSERT INTO Actual
	EXEC Question17;

	INSERT INTO Expected
	EXEC Question17_ModelAnswer

	EXEC tSQLt.AssertEqualsTable 'Expected', 'Actual', 'Incorrect Answer!';

END;
GO

CREATE PROCEDURE testSQLPracticalTest.[TEST QUESTION 18]
AS
BEGIN

	CREATE TABLE Actual (
		orderref INT,
		orderdate DATE,
		firstname VARCHAR(100),
		lastname VARCHAR(100),
		description VARCHAR(100),
		unitprice DECIMAL(10,2)
	);

	CREATE TABLE Expected (
		orderref INT,
		orderdate DATE,
		firstname VARCHAR(100),
		lastname VARCHAR(100),
		description VARCHAR(100),
		unitprice DECIMAL(10,2)
	);

	INSERT INTO Actual
	EXEC Question18;

	INSERT INTO Expected
	EXEC Question18_ModelAnswer

	EXEC tSQLt.AssertEqualsTable 'Expected', 'Actual', 'Incorrect Answer!';

END;
GO

CREATE PROCEDURE testSQLPracticalTest.[TEST QUESTION 19]
AS
BEGIN

	CREATE TABLE Actual (
		orderref INT,
		orderdate DATE,
		firstname VARCHAR(100),
		lastname VARCHAR(100),
		description VARCHAR(100),
		unitprice DECIMAL(10,2)
	);

	CREATE TABLE Expected (
		orderref INT,
		orderdate DATE,
		firstname VARCHAR(100),
		lastname VARCHAR(100),
		description VARCHAR(100),
		unitprice DECIMAL(10,2)
	);

	INSERT INTO Actual
	EXEC Question19;

	INSERT INTO Expected
	EXEC Question19_ModelAnswer

	EXEC tSQLt.AssertEqualsTable 'Expected', 'Actual', 'Incorrect Answer!';

END;
GO

CREATE PROCEDURE testSQLPracticalTest.[TEST QUESTION 20]
AS
BEGIN

	CREATE TABLE Actual (
		orderref INT,
		orderdate DATE,
		firstname VARCHAR(100),
		lastname VARCHAR(100),
		repfirstname VARCHAR(100),
		replastname VARCHAR(100),
		description VARCHAR(100)
	);

	CREATE TABLE Expected (
		orderref INT,
		orderdate DATE,
		firstname VARCHAR(100),
		lastname VARCHAR(100),
		repfirstname VARCHAR(100),
		replastname VARCHAR(100),
		description VARCHAR(100)
	);

	INSERT INTO Actual
	EXEC Question20;

	INSERT INTO Expected
	EXEC Question20_ModelAnswer

	EXEC tSQLt.AssertEqualsTable 'Expected', 'Actual', 'Incorrect Answer!';

END;
GO

CREATE PROCEDURE testSQLPracticalTest.[TEST QUESTION 21]
AS
BEGIN

	CREATE TABLE Actual (
		"Rep Name" VARCHAR(100),
		"Total balance" DECIMAL(10,2)
	);

	CREATE TABLE Expected (
		"Rep Name" VARCHAR(100),
		"Total balance" DECIMAL(10,2)
	);

	INSERT INTO Actual
	EXEC Question21;

	INSERT INTO Expected
	EXEC Question21_ModelAnswer

	EXEC tSQLt.AssertEqualsTable 'Expected', 'Actual', 'Incorrect Answer!';

END;
GO

CREATE PROCEDURE testSQLPracticalTest.[TEST QUESTION 22]
AS
BEGIN

	CREATE TABLE Actual (
		orderref INT,
		"Total Linetotal" DECIMAL(10,2)
	);

	CREATE TABLE Expected (
		orderref INT,
		"Total Linetotal" DECIMAL(10,2)
	);

	INSERT INTO Actual
	EXEC Question22;

	INSERT INTO Expected
	EXEC Question22_ModelAnswer

	EXEC tSQLt.AssertEqualsTable 'Expected', 'Actual', 'Incorrect Answer!';

END;
GO


EXEC tSQLt.Run 'testSQLPracticalTest';