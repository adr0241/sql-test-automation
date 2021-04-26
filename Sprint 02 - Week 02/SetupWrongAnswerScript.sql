CREATE SCHEMA WrongAnswer;
GO

CREATE TABLE WrongAnswer.store (
	store_id INT PRIMARY KEY,
	store_name VARCHAR(50),
	phone VARCHAR(25),
	email VARCHAR(50),
	street VARCHAR(50),
	city VARCHAR(50),
);

CREATE TABLE WrongAnswer.customer (
	customer_id INT PRIMARY KEY,
	first_name VARCHAR(50),
	last_name VARCHAR(50),
	phone VARCHAR(25),
	email VARCHAR(50),
	street VARCHAR(50),
	city VARCHAR(50)
);

CREATE TABLE WrongAnswer.bike_order (
	order_id INT PRIMARY KEY,
	customer_id INT,
	store_id INT,
	order_date DATE,
	FOREIGN KEY (customer_id) REFERENCES WrongAnswer.customer(customer_id),
	FOREIGN KEY (store_id) REFERENCES WrongAnswer.store(store_id),
);

INSERT INTO WrongAnswer.store(store_id, store_name, phone, email, street, city)
VALUES (100, 'Bike Shop Sydenham', '(03)3456789', 'sydenham@bikeshop.co.nz', '289 Colombo Street', 'Christchurch');
INSERT INTO WrongAnswer.store(store_id, store_name, phone, email, street, city)
VALUES (101, 'Bike Shop Rolleston', '(03)7658907', 'rolleston@bikeshop.co.nz', '7 Tennyson Street', 'Rolleston');
INSERT INTO WrongAnswer.store(store_id, store_name, phone, email, street, city)
VALUES (102, 'Bike Shop Hornby', '(03)3123456', 'hornby@bikeshop.co.nz', '244 Main South Road', 'Christchurch');
INSERT INTO WrongAnswer.store(store_id, store_name, phone, email, street, city)
VALUES (103, 'Bike Shop Rangiora', '(03)3247653', 'rangiroa@bikeshop.co.nz', '11 High Street', 'Rangiora');

INSERT INTO WrongAnswer.customer(customer_id, first_name, last_name, phone, email, street, city)
VALUES (1000, 'John', 'Smith', '(021)1234567', 'johnsmith@gmail.com', '123 Selwyn Street', 'Christchurch');
INSERT INTO WrongAnswer.customer(customer_id, first_name, last_name, phone, email, street, city)
VALUES (1001, 'Tom', 'Wayne', '(021)9876543', 'tomwayne@outlook.com', '987 Cashmere Road', 'Christchurch');
INSERT INTO WrongAnswer.customer(customer_id, first_name, last_name, phone, email, street, city)
VALUES (1002, 'Jess', 'Monks', '(021)6547890', 'jessm@yahoo.com', '24 High Street', 'Rangiora');

INSERT INTO WrongAnswer.bike_order(order_id, customer_id, store_id, order_date)
VALUES (5678, 1000, 100, '2021-04-12');
INSERT INTO WrongAnswer.bike_order(order_id, customer_id, store_id, order_date)
VALUES (5679, 1000, 102, '2021-04-12');
INSERT INTO WrongAnswer.bike_order(order_id, customer_id, store_id, order_date)
VALUES (5681, 1001, 101, '2021-04-13');
INSERT INTO WrongAnswer.bike_order(order_id, customer_id, store_id, order_date)
VALUES (5682, 1002, 103, '2021-04-13');

SELECT
	WrongAnswer.bike_order.order_id,
	WrongAnswer.bike_order.order_date,
	CONCAT(WrongAnswer.customer.first_name, ' ', WrongAnswer.customer.last_name) AS customer_name,
	WrongAnswer.store.store_name
FROM WrongAnswer.bike_order
INNER JOIN WrongAnswer.customer
	ON WrongAnswer.bike_order.customer_id=WrongAnswer.customer.customer_id
INNER JOIN WrongAnswer.store
	ON WrongAnswer.bike_order.store_id=WrongAnswer.store.store_id