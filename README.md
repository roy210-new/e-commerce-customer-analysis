# E-Commerce Customer Behavior, Retention and Revenue Analysis (2020-2026)
## Project Overview
This project analyzes customer behavior, retention patterns, and revenue drivers in an e-commerce business from 2020 to 2026.

The objective is to transform raw transactional data into actionable insights across:
- Customer retention (Cohort Analysis)
- Revenue & product performance
- Customer segmentation (RFM Analysis)

The final deliverable is a set of interactive Power BI dashboards designed to support business decision-making.


## Business Question

This analysis aims to identify key gaps in customer retention, uncover high-value customer segments, and highlight revenue drivers to support data-driven decision-making.

- How quickly do customers churn after their first purchase, and where are the biggest retention drop-offs?

- Which customer segments (RFM-based) contribute the most to revenue, and which segments are at risk of churn?

- Which product categories drive the majority of revenue, and are they supported by strong customer retention?

- Are high-value customers concentrated in specific categories or membership tiers?

- Where should the business focus: improving early retention, reactivating at-risk customers, or expanding high-performing product segments?

## Dataset Description
This project uses an open-source dataset from Kaggle:

🔗 https://www.kaggle.com/datasets/meruvakodandasuraj/e-commerce-customer-behavior-and-sales-20202026/data

The dataset contains transactional and customer-level data for an e-commerce business from **2020 to 2026**, and is structured into two main tables:

---
### Customers Table

This table contains demographic and behavioral attributes for each customer.

**Key fields:**
- customer_id – Unique identifier for each customer
- country – Customer location
- age, gender – Demographic information
- membership_tier – Customer loyalty level (e.g., Free, Silver, Gold)
- preferred_category – Customer’s preferred product category
- acquisition_channel – Source of customer acquisition
- churned – Indicates whether the customer has churned

**Usage in analysis:**
- Customer segmentation (RFM)
- Customer profiling
- Membership tier and CLV analysis

---

### Orders Table

This table records all customer transactions.

**Key fields:**
- order_id – Unique order identifier
- customer_id – Links to Customers table
- order_date – Date of purchase
- total_amount_usd – Total order value
- order_status – Order completion status
- product_name – Product purchased
- category – Product category
- payment_method – Payment type
- device_used – Device used for purchase
- discount_amount_usd – Discount applied to the order

**Usage in analysis:**
- Cohort analysis (customer retention)
- Revenue and trend analysis
- Product and category performance
- RFM metrics (recency, frequency, monetary)

---
## Analytical Methods

This project uses SQL-based data transformation and Power BI visualization to analyze customer retention, revenue drivers, customer value, and customer segmentation.

The analysis is divided into four main methods:

1. Cohort Analysis  
2. Revenue & Product Performance Analysis  
3. Customer Lifetime Value (CLV) Analysis  
4. RFM Customer Segmentation  

---

## 1. Cohort Analysis — Customer Retention

Cohort analysis was used to evaluate how well customers return after their first purchase.

Customers were grouped based on their **first order month**, also known as the **cohort_month**. Each later purchase was assigned a **cohort_index**, which represents the number of months after the customer’s first purchase.

cohort_index = 0 → first purchase month

cohort_index = 1 → 1 month after first purchase

cohort_index = 2 → 2 months after first purchase

The retention rate was calculated as:
Retention Rate (%) = Active Customers in Month N / Customers in Cohort Month × 100

### Purpose
- Identify early churn patterns
- Understand how retention changes over time
- Compare retention performance across different customer cohorts
- Evaluate whether customers continue purchasing after their first order

### Dashboard Output 

The cohort analysis was visualized using:

- Monthly retention heatmap
- Retention trend line chart
- KPI cards for average retention performance for period first month, first three months and one year 

## 2. Revenue & Product Performance Analysis 

Revenue and product analysis was used to understand the commercial drivers behind customer behavior.

The analysis measured:

- Total revenue
- Total orders
- Revenue by product category
- Monthly revenue trend
- Top-performing product categories
- Order return rate
- Average customer rating

### Purpose
- Identify which product categories contribute the most revenue
- Understand revenue trends over time
- Evaluate whether revenue is concentrated in specific categories
- Compare product/category performance with customer behavior

### Dashboard Output 

The revenue and product analysis was visualized using:

- Revenue share by category
- Monthly revenue trend
- Revenue contribution by category and membership tier
- KPI cards for total revenue, total orders, average rating, and order return rate

## 3.Customer Lifetime Value (CLV) Analysis 

Customer Lifetime Value was used to estimate the value generated by customers across different membership tiers and product categories.

In this project, CLV was calculated using customer-level revenue contribution and customer count by segment.

CLV = Revenue Contribution / Number of Customers

### Purpose 
- Compare customer value across membership tiers
- Identify high-value customer groups
- Understand which customer groups contribute stronger long-term value
- Support loyalty and retention strategy decisions

### Dashboard Output
CLV was visualized using:

- Customer lifetime value by category
- Customer lifetime value by membership tier
- Revenue contribution by customer group


## 4.RFM Analysis — Customer Segmentation

RFM analysis was used to segment customers based on purchasing behavior.

RFM stands for:

#### Recency	
- Days since last purchase	
- How recently a customer purchased
#### Frequency
- Number of completed orders	
- How often a customer purchases
#### Monetary
- Total customer spend
- How much value a customer contributes

Each customer was scored from 1 to 5 for Recency, Frequency, and Monetary using quintile ranking.

NTILE(5) OVER (ORDER BY metric)

For Recency, lower values are better because recent customers are more active.
For Frequency and Monetary, higher values are better because they indicate stronger engagement and higher spending.

### RFM Segment Classification

Customers were grouped into business segments such as:

- Champions
- Loyal Customers
- Potential Loyalists
- At Risk
- Lost Customers
- Big Spenders
- Regular Customers

### Purpose
- Identify high-value customers
- Detect inactive or at-risk customers
- Understand customer behavior at segment level
- Support targeted marketing and reactivation strategies

### Dashboard Output

The RFM analysis was visualized using:

- Customer count by RFM segment
- Revenue contribution by RFM segment
- Customer value positioning scatter plot
- KPI cards for total customers, average recency score, average frequency score, average monetary score and average monetary value

## 5.Dashboard Storytelling Approach

The final Power BI report was designed as a three-page analytical story:

Page 1: Customer Retention Analysis
→ Are customers returning after their first purchase?

Page 2: Revenue Drivers & Customer Value Analysis
→ What categories, products, and customer groups drive business value?

Page 3: RFM Customer Segmentation
→ Which customer segments should the business prioritize?

This structure connects customer behavior, revenue performance, customer value, and customer targeting into one end-to-end analysis.

The overall analytical flow is:

Retention behavior
→ Revenue and product drivers
→ Customer value
→ Customer segmentation
→ Business recommendations










