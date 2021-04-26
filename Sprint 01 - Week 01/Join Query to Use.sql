SELECT
	bike_order.order_id,
	bike_order.order_date,
	CONCAT(customer.first_name, ' ', customer.last_name) AS customer_name,
	store.store_name
FROM bike_order
JOIN customer
	ON bike_order.customer_id=customer.customer_id
JOIN store
	ON bike_order.store_id=store.store_id