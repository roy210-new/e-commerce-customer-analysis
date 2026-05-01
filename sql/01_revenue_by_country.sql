SELECT
	c.country,
	SUM(o.total_amount_usd) AS total_revenue
FROM orders o 
JOIN customers c 
	ON o.customer_id = c.customer_id 
GROUP BY c.country 
ORDER BY total_revenue DESC;
