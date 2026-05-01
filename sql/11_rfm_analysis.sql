WITH customer_rfm AS (
	SELECT 
		customer_id,
		-- recency
		current_date - max(order_date :: date) AS recency_days,
		-- frequency
		count(DISTINCT order_id) AS frequency,
		-- monetary
		round(sum(total_amount_usd), 2) AS monetary_values
	FROM orders
	WHERE order_status = 'Delivered'
	GROUP BY customer_id
),

rfm_scores AS (
	SELECT 
		customer_id,
		recency_days,
		frequency,
		monetary_values,
		-- recency score, lower the recency, higher the score
		ntile(5) OVER (ORDER BY recency_days DESC ) AS recency_score,
		-- frequency score, higher frequency, higher score
		ntile(5) OVER (ORDER BY frequency ASC ) AS frequency_score,
		-- monetary score, higher monetary, higher score
		ntile(5) OVER (ORDER BY monetary_values) AS monetary_score
	FROM customer_rfm
),

rfm_segment_table AS (
	SELECT 
		customer_id,
		recency_days,
		frequency,
		monetary_values,
		recency_score,
		frequency_score,
		monetary_score,
		concat ( recency_score, frequency_score, monetary_score) AS rfm_score,
		
		CASE
			WHEN recency_score >= 4 AND frequency_score >=4 AND monetary_score >= 4
				THEN 'Champions'
				
			WHEN recency_score >= 3 AND frequency_score >=4
				THEN 'Loyal Customers'
				
			WHEN recency_score >= 4 AND frequency_score BETWEEN 2 AND 3
				THEN 'Potential Loyalists'
				
			WHEN recency_score <=2 AND frequency_score >=4
				THEN 'At Risk'
				
			WHEN recency_score <=2 AND frequency_score <=2
				THEN 'Lost Customers'
				
			WHEN frequency_score <=2 AND monetary_score >=4
				THEN 'Big Spenders'
			
			ELSE 'Regular Customers'
		END AS rfm_segment
	FROM rfm_scores
)

SELECT 
	c.customer_id,
	c.country,
	c.age,
	c.gender,
	c.membership_tier,
	c.preferred_category,
	c.acquisition_channel,
	c.churned,
	
	r.recency_days,
	r.frequency,
	r.monetary_values,
	r.recency_score,
	r.frequency_score,
	r.monetary_score,
	r.rfm_score,
	r.rfm_segment
	
FROM rfm_segment_table r
LEFT JOIN customers c
	ON r.customer_id = c.customer_id 
ORDER BY r.monetary_values DESC;
	
		
