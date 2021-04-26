EXEC tSQLt.NewTestClass 'testStudentAnswer';
GO

CREATE PROCEDURE testStudentAnswer.[test BikeOrder table exists]
AS
BEGIN

	EXEC tSQLt.AssertObjectExists 'BikeOrder'

END
GO

CREATE PROCEDURE testStudentAnswer.[test BikeOrder table with new data insert]
AS
BEGIN

	IF OBJECT_ID('actual') IS NOT NULL DROP TABLE Actual;
	IF OBJECT_ID('expected') IS NOT NULL DROP TABLE Expected;

	EXEC tSQLt.FakeTable 'BikeOrder';
	EXEC tSQLt.FakeTable 'BikeOrder';

	INSERT INTO BikeOrder(orderID, customerID, storeID, orderDate)
	VALUES (5683, 1001, 100, '2021-04-14');
	INSERT INTO BikeOrder(orderID, customerID, storeID, orderDate)
	VALUES (5684, 1001, 100, '2021-04-14');

	SELECT orderID, customerID, storeID, orderDate
	INTO Actual
	FROM BikeOrder;

	CREATE TABLE Expected (
		orderID INT PRIMARY KEY,
		customerID INT,
		storeID INT,
		orderDate DATE,
		FOREIGN KEY (customerID) REFERENCES Customer(customerID),
		FOREIGN KEY (storeID) REFERENCES Store(storeID),
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
		BikeOrder.orderID,
		BikeOrder.orderDate,
		CONCAT(Customer.firstName, ' ', Customer.lastName) AS customerName,
		Store.storeName
	FROM BikeOrder
	INNER JOIN Customer
		ON BikeOrder.customerID=Customer.customerID
	INNER JOIN store
		ON BikeOrder.storeID=Store.storeID


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
 
+----------------------+
|Test Execution Summary|
+----------------------+
 
|No|Test Case Name                                                  |Dur(ms)|Result |
+--+----------------------------------------------------------------+-------+-------+
|1 |[testStudentAnswer].[test BikeOrder table exists]               |     63|Success|
|2 |[testStudentAnswer].[test BikeOrder table with Inner-Join query]|     34|Success|
|3 |[testStudentAnswer].[test BikeOrder table with new data insert] |    524|Success|
----------------------------------------------------------------------------------------
Test Case Summary: 3 test case(s) executed, 3 succeeded, 0 skipped, 0 failed, 0 errored.
----------------------------------------------------------------------------------------
*/