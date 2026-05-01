SELECT 
	category,
	product_name,
	sum(quantity) AS units_sold,
	sum(total_amount_usd) AS total_revenue,
	avg(customer_rating) AS avg_rating
FROM orders
WHERE order_status = 'Delivered'
GROUP BY category, product_name
ORDER BY total_revenue DESC 
LIMIT 10;