EXEC tSQLt.NewTestClass 'testStudentAnswer';
GO

CREATE PROCEDURE testStudentAnswer.[test BikeOrder table exists]
AS
BEGIN

	EXEC tSQLt.AssertObjectExists 'WrongAnswer.BikeOrder'

END
GO

CREATE PROCEDURE testStudentAnswer.[test BikeOrder table with new data insert]
AS
BEGIN

	IF OBJECT_ID('actual') IS NOT NULL DROP TABLE Actual;
	IF OBJECT_ID('expected') IS NOT NULL DROP TABLE Expected;

	EXEC tSQLt.FakeTable 'WrongAnswer', 'BikeOrder';
	EXEC tSQLt.FakeTable 'WrongAnswer', 'BikeOrder';

	INSERT INTO WrongAnswer.BikeOrder(orderID, customerID, storeID, orderDate)
	VALUES (5683, 1001, 100, '2021-04-14');
	INSERT INTO WrongAnswer.BikeOrder(orderID, customerID, storeID, orderDate)
	VALUES (5684, 1001, 100, '2021-04-14');

	SELECT orderID, customerID, storeID, orderDate
	INTO Actual
	FROM WrongAnswer.BikeOrder;

	CREATE TABLE Expected (
		orderID INT PRIMARY KEY,
		customerID INT,
		storeID INT,
		orderDate DATE,
		FOREIGN KEY (customerID) REFERENCES WrongAnswer.Customer(customerID),
		FOREIGN KEY (storeID) REFERENCES WrongAnswer.Store(storeID),
	);

	INSERT INTO Expected(orderID, customerID, storeID, orderDate)
	VALUES (5683, 1001, 100, '2021-04-14');
	INSERT INTO Expected(orderID, customerID, storeID, orderDate)
	VALUES (5684, 1001, 100, '2021-04-14');

	EXEC tSQLt.AssertEqualsTable 'Expected', 'Actual';

END;
GO

CREATE PROCEDURE testStudentAnswer.[test BikeOrder table with Inner-Join query]
AS
BEGIN

	CREATE TABLE actual (
		orderID INT,
		orderDate VARCHAR(25),
		customerName VARCHAR(255),
		storeName VARCHAR(255)
	);

	INSERT INTO actual

	SELECT
		WrongAnswer.BikeOrder.orderID,
		WrongAnswer.BikeOrder.orderDate,
		CONCAT(WrongAnswer.Customer.firstName, ' ', WrongAnswer.Customer.lastName) AS customerName,
		WrongAnswer.Store.storeName
	FROM WrongAnswer.BikeOrder
	INNER JOIN WrongAnswer.Customer
		ON WrongAnswer.BikeOrder.customerID=WrongAnswer.Customer.customerID
	INNER JOIN WrongAnswer.Store
		ON WrongAnswer.BikeOrder.storeID=WrongAnswer.Store.storeID


	CREATE TABLE expected (
		orderID INT,
		orderDate VARCHAR(25),
		customerName VARCHAR(255),
		storeName VARCHAR(255)
	);

	INSERT INTO expected(orderID, orderDate, customerName, storeName)
	VALUES (5678, '2021-04-12', 'John Smith', 'Bike Shop Sydenham');
	INSERT INTO expected(orderID, orderDate, customerName, storeName)
	VALUES (5679, '2021-04-12', 'John Smith', 'Bike Shop Hornby');
	INSERT INTO expected(orderID, orderDate, customerName, storeName)
	VALUES (5681, '2021-04-13', 'Tom Wayne', 'Bike Shop Rolleston');
	INSERT INTO expected(orderID, orderDate, customerName, storeName)
	VALUES (5682, '2021-04-13', 'Jess Monks', 'Bike Shop Rangiora');

	EXEC tSQLt.AssertEqualsTable 'expected', 'actual';

END;
GO

EXEC tSQLt.RunAll

/*
(3 rows affected)
[testStudentAnswer].[test BikeOrder table exists] failed: (Failure) 'WrongAnswer.BikeOrder' does not exist
[testStudentAnswer].[test BikeOrder table with Inner-Join query] failed: (Error) Invalid object name 'WrongAnswer.BikeOrder'.[16,1]{testStudentAnswer.test BikeOrder table with Inner-Join query,13}
[testStudentAnswer].[test BikeOrder table with new data insert] failed: (Error) FakeTable could not resolve the object name, 'WrongAnswer.BikeOrder'. (When calling tSQLt.FakeTable, avoid the use of the @SchemaName parameter, as it is deprecated.)[16,10]{tSQLt.Private_ValidateFakeTableParameters,12}
 
+----------------------+
|Test Execution Summary|
+----------------------+
 
|No|Test Case Name                                                  |Dur(ms)|Result |
+--+----------------------------------------------------------------+-------+-------+
|1 |[testStudentAnswer].[test BikeOrder table exists]               |      3|Failure|
|2 |[testStudentAnswer].[test BikeOrder table with Inner-Join query]|      4|Error  |
|3 |[testStudentAnswer].[test BikeOrder table with new data insert] |      3|Error  |
----------------------------------------------------------------------------------------
Msg 50000, Level 16, State 10, Line 96
Test Case Summary: 3 test case(s) executed, 0 succeeded, 0 skipped, 1 failed, 2 errored.
----------------------------------------------------------------------------------------
*/