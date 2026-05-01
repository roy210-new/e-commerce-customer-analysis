SELECT 
	to_char(order_date,'yyyy-mm') AS sales_month,
	category,
	count(order_id) AS successful_orders,
	sum(total_amount_usd) AS monthly_net_revenue
FROM orders 
WHERE order_status = 'Delivered'
GROUP BY sales_month , category
ORDER BY sales_month ASC;
	