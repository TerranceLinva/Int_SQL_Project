WITH Customer_ltv AS (
	SELECT
		customerkey,
		cleaned_name,
		sum(total_net_revenue) AS total_ltv
	FROM
		cohort_analysis
	GROUP BY
		customerkey,
		cleaned_name
),
customer_segment AS (
	SELECT
		PERCENTILE_CONT(0.25) WITHIN GROUP (
		ORDER BY
			total_ltv
		) AS lTV_25TH_PERCENTILE,
		PERCENTILE_CONT(0.75) WITHIN GROUP (
		ORDER BY
			total_ltv
		) AS lTV_75TH_PERCENTILE
	FROM
		Customer_ltv ustomer_ltv
),
segment_values AS (
	SELECT  
		c.*,
		CASE 
			 WHEN c.total_ltv < cs.ltv_25th_percentile THEN '1- LOW-VALUE'
			WHEN c.total_ltv < cs.ltv_75th_percentile THEN '2- Mid-VALUE'
			ELSE '3 - HIGH VALUE'
		END AS customer_segment
	FROM
		Customer_ltv c,
		     customer_segment cs
)
   SELECT
	customer_segment ,
	sum(total_ltv) AS total_ltv,
	COUNT(customerkey) AS customer_count,
	SUM (total_ltv) / COUNT(customerkey) AS avg_ltv
FROM
	segment_values
GROUP BY
	customer_segment