WITH first_order AS (
	SELECT 
		customer_id,
		date_trunc('month', min(order_date)) AS cohort_month
	FROM orders
	GROUP BY customer_id 
),
order_with_index AS (
	SELECT 
		f.cohort_month,
		o.customer_id,
		(
			date_part ('year', age(date_trunc('month', o.order_date), f.cohort_month))*12 +
			date_part('month', age(date_trunc('month',o.order_date), f.cohort_month))
		) AS cohort_index
	FROM first_order f
	JOIN orders o 
		ON f.customer_id = o.customer_id
),
cohort_data AS (
	SELECT 
		cohort_month,
		cohort_index,
		count(DISTINCT customer_id) AS active_customers
	FROM order_with_index
	GROUP BY cohort_month, cohort_index
)
SELECT 
	to_char(cohort_month, 'YYYY-MM') AS cohort_month,
	cohort_index,
	active_customers,
	round(
		active_customers* 100.0/
		first_value(active_customers) OVER (
			PARTITION BY cohort_month
			ORDER BY cohort_index
		),
	2) AS retention_rate
FROM cohort_data
ORDER BY cohort_month, cohort_index;
	

	