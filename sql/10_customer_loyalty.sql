SELECT 
	o.category,
	c.membership_tier,
	count(DISTINCT o.customer_id) AS unique_customer,
	sum(o.total_amount_usd) AS revenue_contribution,
	avg(c.total_spend_usd) AS customers_lifetime_value
FROM orders o
JOIN customers c
	ON o.customer_id = c.customer_id 
GROUP BY c.membership_tier, o.category, o.order_date 
ORDER BY revenue_contribution DESC;
	
	