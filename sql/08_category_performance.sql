SELECT 
	category,
	count(order_id) AS total_order,
	sum(total_amount_usd) AS total_revenue,
	round(avg(customer_rating)::decimal,2) AS avg_cust_rating,
	round(sum(returned)::decimal/count(order_id)*100,2) AS order_return_rate_percentage
FROM orders
GROUP BY category
ORDER BY total_revenue DESC;