# Intermediate SQL - Sales Analysis

## Overview
Analysis of Customer behaviour, retention, and lifetime value for an e-commerce 
company to improve customer retention and maximize revenue. 

## Business Question 
1. **Customer Segmentation:** Who are our most valuable customer? 
2. **Cohort Analysis:** How do different customer groups generate revenue? 
3. **Retention Analysis:** Which Customer. haven't purchased recently? 

## Analysis Approach 

### 1. Customer Segmentation Analysis
- Categorized customers based on total lifetime value (ltv)
- Assigned customers to High, Mid ,and Low Value Segments 
- Calculated key metrics: total revenue 

✅ Query: [1_customer_segmenation.sql](/1_customer_segmentation.sql)

**📊 Visualization:** 

![Cohort Analysis](/images/1_customer_segmentation.png)

📊Key Findings

- HIGH VALUE customers dominate LTV

   - They contribute 65.6% of the total LTV, making them the most profitable segment.

- Mid-VALUE customers contribute a substantial portion

    - Represent 32.3% of total LTV, indicating solid performance but room for growth.

- LOW-VALUE customers contribute minimally

   - Only 2.1% of the total LTV, suggesting low return on investment from this group.

**💡 Business Insights**

- High-Value (66% revenue): Offer premium membership program to 12,372 VIP Customers, as losing one customer significantly impacts revenue
- Mid-Value (32% revenue): Create upgrade paths through personalized promotions, with potential $66.6M -> $135.4M
- Low-Value Segment (25% of customers ) account for 2% of revenue ($4.3M)



### 2. Cohort Analysis
- Tracked revenue and customer counts per cohorts
- Cohorts were grouped by year of first purchase 
- Analyzed customer retention at a cohort level 

✅ Query: [2_cohort_anlaysis.sql](/2_cohort_analysis.sql)





```sql
SELECT
	cohort_year,
	COUNT(DISTINCT customerkey) AS total_customers,
	SUM (total_net_revenue) AS total_revenue,
	SUM(total_net_revenue)/ COUNT(DISTINCT customerkey) AS customer_revenue
FROM
	cohort_analysis 
WHERE orderdate = first_purchase_date  
GROUP BY
	cohort_year;

```

**📊 Visualization:** 

![Cohort Analysis](/images/2_cohort_analysis.png)

**📊Key Findings**

- Revenue Per Customer shows an alarming decreasing trend over time 
   - 2022-2024 cohorts are consistently performing worse than earlier cohorts
   - Note: Although net revenue is increasing, this is likely due to a large customer base, which is not reflective of customer value

**💡 Business Insights**

- Value extracted from customers is decreasing over time and needs further investigation 
- In 2023, we saw a drop in number of customers acquired, which is concerning. 
- With both lowering LTV and decreasing customer acquisition, the company is facing a potential revenue decline. 

### 3. Customer Retention 
- Identified customers at risk of churning 
- Analyzed last purchase patterns. 
- Calculated customer-specific metrics 

Query: [3_retention_anlaysis.sql](/3_retention_analysis.sql)



**📊 Visualization:** 

![Cohort Analysis](/images/3_retention_analysis.png)

**📊Key Findings**

- The majority of customer cohorts show a churn rate of 90–92%, meaning only 8–10% remain active.
- A cohort with 9,010 total customers still sees churn rates of 90–91%.
- Smaller cohorts (e.g., 2,825 or 3,031 customers) show similar active percentages (around 8–9%) to large ones.

**💡 Business Insights**

- Customer retention is a major issue, and there's no significant cohort improvement over time. It's critical to implement long-term retention strategies like loyalty programs or personalized follow-ups.
- Scaling customer acquisition does not solve the churn problem. You’re spending to acquire users who leave quickly. Prioritize lifecycle marketing and onboarding experience to improve engagement early.
- Retention is not dependent on cohort size. The issue is likely systemic—linked to product experience, value perception, or communication strategy.


** Strategic Recommendation 

 ✅ 1. Launch a Tiered Loyalty Program for High- and Mid-Value Customers
Fact: High- and Mid-Value customers contribute over 97% of total revenue (66% + 32%)
  - Recommendation: Implement a VIP rewards program for High-Value customers (12,372 users) and a progressive loyalty tier for Mid-Value customers to encourage them to upgrade. Offer exclusive perks like early access to sales, personalized offers, and free shipping. This strengthens retention and maximizes LTV.

✅ 2. Improve Onboarding and First 90-Day Engagement
Fact: 90–92% of customers churn shortly after first purchase across all cohorts
  - Recommendation: Redesign the customer onboarding journey and implement automated engagement flows (e.g., follow-up emails, how-to guides, reorder reminders). Focus especially on the first 90 days, which are critical for building habits and brand attachment.

✅ 3. Diagnose and Fix Declining Customer Value
Fact: Revenue per customer is dropping across newer cohorts (2022–2024), despite more customers
 - Recommendation: Conduct customer feedback surveys and usability testing to uncover friction points in the product, website, or service. Optimize pricing strategy, product bundles, or value communication to increase customer satisfaction and perceived value.


## Technical Details 

- **Database** PostgreSQL 
- **Analysis Tools** PostgreSQL 
- **Visulaization** ChatGPT 


