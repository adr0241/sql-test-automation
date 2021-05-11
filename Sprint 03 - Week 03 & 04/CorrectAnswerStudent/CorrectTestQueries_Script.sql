USE SchoolDB;
GO

-- QUESTION 1: List classes with Peter Pumpkin as Staff
DROP PROC IF EXISTS Question1;
GO
CREATE PROCEDURE Question1
AS
	SELECT ClassCode, ClassName, StaffNo
	FROM Class
	WHERE StaffNo = 'S12';
GO

-- QUESTION 2: List all students in the school
DROP PROC IF EXISTS Question2;
GO
CREATE PROCEDURE Question2
AS
	SELECT * FROM Student;
GO

-- QUESTION 3: List the students of DB500A Database class
DROP PROC IF EXISTS Question3;
GO
CREATE PROCEDURE Question3
AS
	SELECT StudentNo, ClassCode
	FROM Enrolment
	WHERE ClassCode = 'DB500A'
GO

-- QUESTION 4: List all staff members full names and in alphabetical order
DROP PROC IF EXISTS Question4;
GO
CREATE PROCEDURE Question4
AS
	SELECT CONCAT(StaffFirstName, ' ', StaffLastName) AS StaffName
	FROM Staff
	ORDER BY StaffName ASC;
GO

-- QUESTION 5: Count the # of students passed and merit
DROP PROC IF EXISTS Question5;
GO
CREATE PROCEDURE Question5
AS
	SELECT COUNT(StudentNo) AS '# of Students', Mark
	FROM Enrolment
	GROUP BY Mark;
GO
