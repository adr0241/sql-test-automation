DROP TABLE IF EXISTS customer;
CREATE TABLE customer (
	customer_id INT PRIMARY KEY,
	first_name VARCHAR(50),
	last_name VARCHAR(50),
	phone VARCHAR(25),
	email VARCHAR(50),
	street VARCHAR(50),
	city VARCHAR(50)
);

EXEC tSQLt.NewTestClass 'testCompareTables'
GO

CREATE PROCEDURE testCompareTables.[test for wrong order between two tables]
AS
BEGIN
	IF OBJECT_ID('actual') IS NOT NULL DROP TABLE actual;
	IF OBJECT_ID('expected') IS NOT NULL DROP TABLE expected;

--  FAKE TABLE
	EXEC tSQLt.FakeTable 'customer';
	EXEC tSQLt.FakeTable 'customer';

	-- Student Answer

	INSERT INTO customer(customer_id, first_name, last_name, phone, email, street, city)
	VALUES (1000, 'John', 'Smith', '(021)1234567', 'johnsmith@gmail.com', '123 Selwyn Street', 'Christchurch');
	INSERT INTO customer(customer_id, first_name, last_name, phone, email, street, city)
	VALUES (1002, 'Jess', 'Monks', '(021)6547890', 'jessm@yahoo.com', '24 High Street', 'Rangiora');
	INSERT INTO customer(customer_id, first_name, last_name, phone, email, street, city)
	VALUES (1001, 'Tom', 'Wayne', '(021)9876543', 'tomwayne@outlook.com', '987 Cashmere Road', 'Christchurch');

	-- Model Answer

	INSERT INTO customer(customer_id, first_name, last_name, phone, email, street, city)
	VALUES (1000, 'John', 'Smith', '(021)1234567', 'johnsmith@gmail.com', '123 Selwyn Street', 'Christchurch');
	INSERT INTO customer(customer_id, first_name, last_name, phone, email, street, city)
	VALUES (1001, 'Tom', 'Wayne', '(021)9876543', 'tomwayne@outlook.com', '987 Cashmere Road', 'Christchurch');
	INSERT INTO customer(customer_id, first_name, last_name, phone, email, street, city)
	VALUES (1002, 'Jess', 'Monks', '(021)6547890', 'jessm@yahoo.com', '24 High Street', 'Rangiora');

--  EXECUATION
	SELECT customer_id, first_name, last_name, phone, email, street, city
	INTO actual
	FROM customer;

--  ASSERTION
	CREATE TABLE expected (
		customer_id INT PRIMARY KEY,
		first_name VARCHAR(50),
		last_name VARCHAR(50),
		phone VARCHAR(25),
		email VARCHAR(50),
		street VARCHAR(50),
		city VARCHAR(50)
	);

	INSERT INTO expected(customer_id, first_name, last_name, phone, email, street, city)
	VALUES (1000, 'John', 'Smith', '(021)1234567', 'johnsmith@gmail.com', '123 Selwyn Street', 'Christchurch');
	INSERT INTO expected(customer_id, first_name, last_name, phone, email, street, city)
	VALUES (1001, 'Tom', 'Wayne', '(021)9876543', 'tomwayne@outlook.com', '987 Cashmere Road', 'Christchurch');
	INSERT INTO expected(customer_id, first_name, last_name, phone, email, street, city)
	VALUES (1002, 'Jess', 'Monks', '(021)6547890', 'jessm@yahoo.com', '24 High Street', 'Rangiora');

	EXEC tSQLt.AssertEqualsTable 'expected', 'actual';

END;
GO

CREATE PROCEDURE testCompareTables.[test for removed fields between two tables]
AS
BEGIN
	IF OBJECT_ID('actual') IS NOT NULL DROP TABLE actual;
	IF OBJECT_ID('expected') IS NOT NULL DROP TABLE expected;

--  FAKE TABLE
	EXEC tSQLt.FakeTable 'customer';
	EXEC tSQLt.FakeTable 'customer';

	-- Student Answer

	INSERT INTO customer(customer_id, first_name, last_name, phone, email, street, city)
	VALUES (1000, 'John', 'Smith', '(021)1234567', 'johnsmith@gmail.com', '123 Selwyn Street', 'Christchurch');
	INSERT INTO customer(customer_id, first_name, last_name, phone, email, street, city)
	VALUES (1002, 'Jess', 'Monks', '(021)6547890', 'jessm@yahoo.com', '24 High Street', 'Rangiora');

	-- Model Answer

	INSERT INTO customer(customer_id, first_name, last_name, phone, email, street, city)
	VALUES (1000, 'John', 'Smith', '(021)1234567', 'johnsmith@gmail.com', '123 Selwyn Street', 'Christchurch');
	INSERT INTO customer(customer_id, first_name, last_name, phone, email, street, city)
	VALUES (1001, 'Tom', 'Wayne', '(021)9876543', 'tomwayne@outlook.com', '987 Cashmere Road', 'Christchurch');
	INSERT INTO customer(customer_id, first_name, last_name, phone, email, street, city)
	VALUES (1002, 'Jess', 'Monks', '(021)6547890', 'jessm@yahoo.com', '24 High Street', 'Rangiora');

--  EXECUATION
	SELECT customer_id, first_name, last_name, phone, email, street, city
	INTO actual
	FROM customer;

--  ASSERTION
	CREATE TABLE expected (
		customer_id INT PRIMARY KEY,
		first_name VARCHAR(50),
		last_name VARCHAR(50),
		phone VARCHAR(25),
		email VARCHAR(50),
		street VARCHAR(50),
		city VARCHAR(50)
	);

	INSERT INTO expected(customer_id, first_name, last_name, phone, email, street, city)
	VALUES (1000, 'John', 'Smith', '(021)1234567', 'johnsmith@gmail.com', '123 Selwyn Street', 'Christchurch');
	INSERT INTO expected(customer_id, first_name, last_name, phone, email, street, city)
	VALUES (1001, 'Tom', 'Wayne', '(021)9876543', 'tomwayne@outlook.com', '987 Cashmere Road', 'Christchurch');
	INSERT INTO expected(customer_id, first_name, last_name, phone, email, street, city)
	VALUES (1002, 'Jess', 'Monks', '(021)6547890', 'jessm@yahoo.com', '24 High Street', 'Rangiora');

	EXEC tSQLt.AssertEqualsTable 'expected', 'actual';

END;
GO

CREATE PROCEDURE testCompareTables.[test for spelling mistakes between two tables]
AS
BEGIN
	IF OBJECT_ID('actual') IS NOT NULL DROP TABLE actual;
	IF OBJECT_ID('expected') IS NOT NULL DROP TABLE expected;

--  FAKE TABLE
	EXEC tSQLt.FakeTable 'customer';
	EXEC tSQLt.FakeTable 'customer';

	-- Student Answer

	INSERT INTO customer(customer_id, first_name, last_name, phone, email, street, city)
	VALUES (1000, 'John', 'Sherlock', '(021)1234567', 'johnsmith@gmail.com', '123 Selwyn Street', 'Christchurch');
	INSERT INTO customer(customer_id, first_name, last_name, phone, email, street, city)
	VALUES (1002, 'Jess', 'Monks', '(021)6547890', 'jessm@yahoo.com', '10 High Street', 'Rangiora');
	INSERT INTO customer(customer_id, first_name, last_name, phone, email, street, city)
	VALUES (1001, 'Tommy', 'Wayne', '(021)9876543', 'tomwayne@outlook.com', '987 Cashmere Road', 'Christchurch');

	-- Model Answer

	INSERT INTO customer(customer_id, first_name, last_name, phone, email, street, city)
	VALUES (1000, 'John', 'Smith', '(021)1234567', 'johnsmith@gmail.com', '123 Selwyn Street', 'Christchurch');
	INSERT INTO customer(customer_id, first_name, last_name, phone, email, street, city)
	VALUES (1001, 'Tom', 'Wayne', '(021)9876543', 'tomwayne@outlook.com', '987 Cashmere Road', 'Christchurch');
	INSERT INTO customer(customer_id, first_name, last_name, phone, email, street, city)
	VALUES (1002, 'Jess', 'Monks', '(021)6547890', 'jessm@yahoo.com', '24 High Street', 'Rangiora');

--  EXECUATION
	SELECT customer_id, first_name, last_name, phone, email, street, city
	INTO actual
	FROM customer;

--  ASSERTION
	CREATE TABLE expected (
		customer_id INT PRIMARY KEY,
		first_name VARCHAR(50),
		last_name VARCHAR(50),
		phone VARCHAR(25),
		email VARCHAR(50),
		street VARCHAR(50),
		city VARCHAR(50)
	);

	INSERT INTO expected(customer_id, first_name, last_name, phone, email, street, city)
	VALUES (1000, 'John', 'Smith', '(021)1234567', 'johnsmith@gmail.com', '123 Selwyn Street', 'Christchurch');
	INSERT INTO expected(customer_id, first_name, last_name, phone, email, street, city)
	VALUES (1001, 'Tom', 'Wayne', '(021)9876543', 'tomwayne@outlook.com', '987 Cashmere Road', 'Christchurch');
	INSERT INTO expected(customer_id, first_name, last_name, phone, email, street, city)
	VALUES (1002, 'Jess', 'Monks', '(021)6547890', 'jessm@yahoo.com', '24 High Street', 'Rangiora');

	EXEC tSQLt.AssertEqualsTable 'expected', 'actual';

END;
GO

--	RUN ALL TESTS
EXEC tSQLt.RunAll