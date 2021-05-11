USE SchoolDB;
GO

-- QUESTION 1: List classes with Peter Pumpkin as Staff
DROP PROC IF EXISTS Question1;
GO
CREATE PROCEDURE Question1
AS
	SELECT ClassCode, ClassName, StaffNo
	FROM Class
GO

-- QUESTION 2: List all students in the school
DROP PROC IF EXISTS Question2;
GO
CREATE PROCEDURE Question2
AS
	SELECT StudentNo, StudentFirstName, StudentLastName, StudentAddress
	FROM Student;
GO

-- QUESTION 3: List the students of DB500A Database class
DROP PROC IF EXISTS Question3;
GO
CREATE PROCEDURE Question3
AS
	SELECT StudentNo, ClassCode
	FROM Enrolment
GO

-- QUESTION 4: List all staff members full names and in alphabetical order
DROP PROC IF EXISTS Question4;
GO
CREATE PROCEDURE Question4
AS
	SELECT StaffFirstName, StaffLastName
	FROM Staff
	ORDER BY StaffFirstName;
GO

-- QUESTION 5: Count the # of students passed and merit
DROP PROC IF EXISTS Question5;
GO
CREATE PROCEDURE Question5
AS
	SELECT StudentNo, Mark
	FROM Enrolment
	ORDER BY Mark;
GO
