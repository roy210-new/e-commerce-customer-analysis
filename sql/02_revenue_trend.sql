SELECT 
	YEAR,
	MONTH,
	SUM(total_amount_usd) AS total_revenue
FROM orders
GROUP BY "year", "month" 
ORDER BY "year", "month"; 