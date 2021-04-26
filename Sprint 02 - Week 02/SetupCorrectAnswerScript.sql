CREATE SCHEMA CorrectAnswer;
GO

CREATE TABLE CorrectAnswer.Store (
	storeID INT PRIMARY KEY,
	storeName VARCHAR(50),
	phone VARCHAR(25),
	email VARCHAR(50),
	street VARCHAR(50),
	city VARCHAR(50),
);

CREATE TABLE CorrectAnswer.Customer (
	customerID INT PRIMARY KEY,
	firstName VARCHAR(50),
	lastName VARCHAR(50),
	phone VARCHAR(25),
	email VARCHAR(50),
	street VARCHAR(50),
	city VARCHAR(50)
);

CREATE TABLE CorrectAnswer.BikeOrder (
	orderID INT PRIMARY KEY,
	customerID INT,
	storeID INT,
	orderDate DATE,
	FOREIGN KEY (customerID) REFERENCES CorrectAnswer.Customer(customerID),
	FOREIGN KEY (storeID) REFERENCES CorrectAnswer.Store(storeID),
);

INSERT INTO CorrectAnswer.Store(storeID, storeName, phone, email, street, city)
VALUES (100, 'Bike Shop Sydenham', '(03)3456789', 'sydenham@bikeshop.co.nz', '289 Colombo Street', 'Christchurch');
INSERT INTO CorrectAnswer.Store(storeID, storeName, phone, email, street, city)
VALUES (101, 'Bike Shop Rolleston', '(03)7658907', 'rolleston@bikeshop.co.nz', '7 Tennyson Street', 'Rolleston');
INSERT INTO CorrectAnswer.Store(storeID, storeName, phone, email, street, city)
VALUES (102, 'Bike Shop Hornby', '(03)3123456', 'hornby@bikeshop.co.nz', '244 Main South Road', 'Christchurch');
INSERT INTO CorrectAnswer.Store(storeID, storeName, phone, email, street, city)
VALUES (103, 'Bike Shop Rangiora', '(03)3247653', 'rangiroa@bikeshop.co.nz', '11 High Street', 'Rangiora');

INSERT INTO CorrectAnswer.Customer(customerID, firstName, lastName, phone, email, street, city)
VALUES (1000, 'John', 'Smith', '(021)1234567', 'johnsmith@gmail.com', '123 Selwyn Street', 'Christchurch');
INSERT INTO CorrectAnswer.Customer(customerID, firstName, lastName, phone, email, street, city)
VALUES (1001, 'Tom', 'Wayne', '(021)9876543', 'tomwayne@outlook.com', '987 Cashmere Road', 'Christchurch');
INSERT INTO CorrectAnswer.Customer(customerID, firstName, lastName, phone, email, street, city)
VALUES (1002, 'Jess', 'Monks', '(021)6547890', 'jessm@yahoo.com', '24 High Street', 'Rangiora');

INSERT INTO CorrectAnswer.BikeOrder(orderID, customerID, storeID, orderDate)
VALUES (5678, 1000, 100, '2021-04-12');
INSERT INTO CorrectAnswer.BikeOrder(orderID, customerID, storeID, orderDate)
VALUES (5679, 1000, 102, '2021-04-12');
INSERT INTO CorrectAnswer.BikeOrder(orderID, customerID, storeID, orderDate)
VALUES (5681, 1001, 101, '2021-04-13');
INSERT INTO CorrectAnswer.BikeOrder(orderID, customerID, storeID, orderDate)
VALUES (5682, 1002, 103, '2021-04-13');

SELECT
	CorrectAnswer.BikeOrder.orderID,
	CorrectAnswer.BikeOrder.orderDate,
	CONCAT(CorrectAnswer.Customer.firstName, ' ', CorrectAnswer.Customer.lastName) AS customerName,
	CorrectAnswer.Store.storeName
FROM CorrectAnswer.BikeOrder
INNER JOIN CorrectAnswer.Customer
	ON CorrectAnswer.BikeOrder.customerID=CorrectAnswer.Customer.customerID
INNER JOIN CorrectAnswer.Store
	ON CorrectAnswer.BikeOrder.storeID=CorrectAnswer.Store.storeID