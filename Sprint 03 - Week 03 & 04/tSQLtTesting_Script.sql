-- This example shows perfect answers by a student in a test

USE master;
USE SchoolDB;
GO

EXEC tSQLt.NewTestClass 'testSchoolDBQueries';
GO

CREATE PROCEDURE testSchoolDBQueries.[TEST QUESTION 1 - List classes with Peter Pumpkin as Staff]
AS
BEGIN

	-- STUDENT ANSWER --
	CREATE TABLE Actual (
		ClassCode VARCHAR(6),
		ClassName VARCHAR(25),
		StaffNo VARCHAR(3),
	);

	INSERT INTO Actual
	EXEC Question1;
	-- STUDENT ANSWER --

	-- EXPECTED CORRECT ANSWER --
	CREATE TABLE Expected (
		ClassCode VARCHAR(6),
		ClassName VARCHAR(25),
		StaffNo VARCHAR(3),
	);

	INSERT INTO Expected VALUES ('DB500A','Database','S12');
	INSERT INTO Expected VALUES ('SP590A','Spreadsheets','S12');
	-- EXPECTED CORRECT ANSWER --

	EXEC tSQLt.AssertEqualsTable 'Expected', 'Actual', 'Incorrect Answer!';

END;
GO

CREATE PROCEDURE testSchoolDBQueries.[TEST QUESTION 2 - List all students in the school]
AS
BEGIN
	
	-- STUDENT ANSWER --
	CREATE TABLE Actual (
		StudentNo INT PRIMARY KEY,
		StudentFirstName VARCHAR(25),
		StudentLastName VARCHAR(35),
		StudentAddress VARCHAR(40),
	);

	INSERT INTO Actual
	EXEC Question2;
	-- STUDENT ANSWER --

	-- EXPECTED CORRECT ANSWER --
	CREATE TABLE Expected (
		StudentNo INT PRIMARY KEY,
		StudentFirstName VARCHAR(25),
		StudentLastName VARCHAR(35),
		StudentAddress VARCHAR(40),
	);

	INSERT INTO Expected VALUES (101,'John','Williams','2 Whites Rd');
	INSERT INTO Expected VALUES (102,'Joe','Turner','15 Red St');
	INSERT INTO Expected VALUES (104,'Mary','Peters','15 Red St');
	INSERT INTO Expected VALUES (105,'Helen','Daniels','199 Yellow Lane');
	INSERT INTO Expected VALUES (106,'Sue','Todd','15 Red St');
	-- EXPECTED CORRECT ANSWER --

	EXEC tSQLt.AssertEqualsTable 'Expected', 'Actual', 'Incorrect Answer!';

END;
GO

CREATE PROCEDURE testSchoolDBQueries.[TEST QUESTION 3 - List the students of DB500A Database class]
AS
BEGIN
	
	-- STUDENT ANSWER --
	CREATE TABLE Actual (
		StudentNo INT,
		ClassCode VARCHAR(6),
	);

	INSERT INTO Actual
	EXEC Question3;
	-- STUDENT ANSWER --

	-- EXPECTED CORRECT ANSWER --
	CREATE TABLE Expected (
		StudentNo INT,
		ClassCode VARCHAR(6),
	);

	INSERT INTO Expected VALUES (101,'DB500A');
	INSERT INTO Expected VALUES (102,'DB500A');
	-- EXPECTED CORRECT ANSWER --

	EXEC tSQLt.AssertEqualsTable 'Expected', 'Actual', 'Incorrect Answer!';
	EXEC tSQLt.Fail 'Invalid random value returned: ';

END;
GO

CREATE PROCEDURE testSchoolDBQueries.[TEST QUESTION 4 - List all staff members full names and in alphabetical order]
AS
BEGIN
	
	-- STUDENT ANSWER --
	CREATE TABLE Actual (
		StaffName VARCHAR(50)
	);

	INSERT INTO Actual
	EXEC Question4;
	-- STUDENT ANSWER --

	-- EXPECTED CORRECT ANSWER --
	CREATE TABLE Expected (
		StaffName VARCHAR(50)
	);

	INSERT INTO Expected VALUES ('Chris Carrot');
	INSERT INTO Expected VALUES ('Peter Pumpkin');
	-- EXPECTED CORRECT ANSWER --

	EXEC tSQLt.AssertEqualsTable 'Expected', 'Actual', 'Incorrect Answer!';

END;
GO

CREATE PROCEDURE testSchoolDBQueries.[TEST QUESTION 5 - Count the # of students passed and merit]
AS
BEGIN
	
	-- STUDENT ANSWER --
	CREATE TABLE Actual (
		"# of Students" INT,
		Mark VARCHAR(10)
	);

	INSERT INTO Actual
	EXEC Question5;
	-- STUDENT ANSWER --

	-- EXPECTED CORRECT ANSWER --
	CREATE TABLE Expected (
		"# of Students" INT,
		Mark VARCHAR(10)
	);

	INSERT INTO Expected VALUES (2, 'Merit');
	INSERT INTO Expected VALUES (6, 'Pass');
	-- EXPECTED CORRECT ANSWER --
	
	EXEC tSQLt.AssertEqualsTable 'Expected', 'Actual', 'Incorrect Answer!';

END;
GO


EXEC tSQLt.RunAll