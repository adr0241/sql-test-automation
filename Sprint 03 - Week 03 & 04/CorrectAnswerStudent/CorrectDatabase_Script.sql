DROP DATABASE IF EXISTS SchoolDB;
GO
CREATE DATABASE SchoolDB;
GO
USE SchoolDB;
GO

DROP TABLE IF EXISTS Student;
GO
CREATE TABLE Student (
	StudentNo INT PRIMARY KEY,
	StudentFirstName VARCHAR(25),
	StudentLastName VARCHAR(35),
	StudentAddress VARCHAR(40),
);

DROP TABLE IF EXISTS Staff;
GO
CREATE TABLE Staff (
	StaffNo VARCHAR(3) PRIMARY KEY,
	StaffFirstName VARCHAR(25),
	StaffLastName VARCHAR(25),
	StaffPostNo VARCHAR(4),
	StaffPhoneNo VARCHAR(4)
);

DROP TABLE IF EXISTS Class;
GO
CREATE TABLE Class (
	ClassCode VARCHAR(6) PRIMARY KEY,
	ClassName VARCHAR(25),
	StaffNo VARCHAR(3),
	FOREIGN KEY (StaffNo) REFERENCES Staff(StaffNo)
);

DROP TABLE IF EXISTS Enrolment;
GO
CREATE TABLE Enrolment (
	ClassCode VARCHAR(6),
	StudentNo INT,
	Mark VARCHAR(10),
	FOREIGN KEY (ClassCode) REFERENCES Class(ClassCode),
	FOREIGN KEY (StudentNo) REFERENCES Student(StudentNo)
);

INSERT INTO Staff VALUES ('S12','Peter','Pumpkin','N104','8228');
INSERT INTO Staff VALUES ('S13','Chris','Carrot','N108','8119');

INSERT INTO Student VALUES (101,'John','Williams','2 Whites Rd');
INSERT INTO Student VALUES (102,'Joe','Turner','15 Red St');
INSERT INTO Student VALUES (104,'Mary','Peters','15 Red St');
INSERT INTO Student VALUES (105,'Helen','Daniels','199 Yellow Lane');
INSERT INTO Student VALUES (106,'Sue','Todd','15 Red St');

INSERT INTO Class VALUES('DB500A','Database','S12');
INSERT INTO Class VALUES('DB500B','Database','S13');
INSERT INTO Class VALUES('SP590A','Spreadsheets','S12');

INSERT INTO Enrolment VALUES ('DB500A',101,'Pass');
INSERT INTO Enrolment VALUES ('DB500A',102,'Pass');
INSERT INTO Enrolment VALUES ('DB500B',104,'Pass');
INSERT INTO Enrolment VALUES ('DB500B',105,'Merit');
INSERT INTO Enrolment VALUES ('DB500B',106,'Pass');
INSERT INTO Enrolment VALUES ('SP590A',101,'Pass');
INSERT INTO Enrolment VALUES ('SP590A',104,'Pass');
INSERT INTO Enrolment VALUES ('SP590A',105,'Merit');