SELECT 
	customer_id,
	sum(total_amount_usd) AS total_spend
FROM orders
GROUP BY customer_id
ORDER BY total_spend DESC
LIMIT 10;