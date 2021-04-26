CREATE TABLE store (
	store_id INT PRIMARY KEY,
	store_name VARCHAR(50),
	phone VARCHAR(25),
	email VARCHAR(50),
	street VARCHAR(50),
	city VARCHAR(50),
);

CREATE TABLE customer (
	customer_id INT PRIMARY KEY,
	first_name VARCHAR(50),
	last_name VARCHAR(50),
	phone VARCHAR(25),
	email VARCHAR(50),
	street VARCHAR(50),
	city VARCHAR(50)
);

CREATE TABLE bike_order (
	order_id INT PRIMARY KEY,
	customer_id INT,
	store_id INT,
	order_date DATE,
	FOREIGN KEY (customer_id) REFERENCES customer(customer_id),
	FOREIGN KEY (store_id) REFERENCES store(store_id),
);