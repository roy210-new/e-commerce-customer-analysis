SELECT 
	churned,
	count(DISTINCT customer_id) AS num_customers,
	round(avg(total_spend_usd), 2) AS avg_spend,
	round(avg(total_orders),2) AS avg_orders,
	round(avg(days_since_last_purchase),2) AS avg_days_since_last_purchase,
	round(avg(avg_review_score),2) AS avg_cust_review_score,
	round(avg(returns_made),2) AS avg_cust_return_made
FROM customers
GROUP BY churned
ORDER BY churned;