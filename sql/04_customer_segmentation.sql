SELECT 
	customer_id,
	sum(total_amount_usd) AS total_spend,
	count(order_id) AS total_order
FROM orders
GROUP BY customer_id;

SELECT 
	customer_segment,
	count(*) AS num_customers,
	sum(total_spend) AS total_revenue,
	round(
		sum(total_spend)*100/ sum(sum(total_spend)) OVER(),
		2
	) AS revenue_share_pct
FROM (
	SELECT	
		customer_id,
		sum(total_amount_usd) AS total_spend,
		CASE
			WHEN sum(total_amount_usd) >= 500 THEN 'High Value'
			WHEN sum(total_amount_usd) <= 200 THEN 'Low Value'
			ELSE 'Medium Value'
		END AS customer_segment
	FROM orders
	GROUP BY customer_id
) AS customer_summary
GROUP BY customer_segment
ORDER BY total_revenue DESC;	

	