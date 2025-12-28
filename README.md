# Retail Customer Analysis & Segmentation (SQL)

## Project Overview
This project performs a comprehensive analysis of retail customer data to uncover sales trends, product performance, and customer behavior. Using SQL, I processed a dataset of 2,500 transactions to derive actionable business insights.

## Key Insights Discovered
- **Market Dominance:** The **UAE** leads in revenue (3.19M), followed closely by the USA and UK.
- **Top Product:** **Watches** are a high-volume category with 473 unique transactions.
- **Customer Segmentation:** Successfully tiered customers into **Platinum, Gold, and Silver** based on lifetime spending, identifying high-value "Platinum" customers.
- **Seasonal Trends:** Peak sales were observed in **July 2023**, with revenue exceeding 1.23M.

## SQL Techniques Used
- **Aggregations:** `SUM`, `COUNT`, `AVG` for revenue and volume metrics.
- **Window Functions:** `RANK() OVER()` to find best-selling products per country.
- **CTEs:** For modular and readable query logic.
- **Data Transformation:** `CASE` statements for customer tiering and `DATE_FORMAT` for trend analysis.

## How to Run
1. Import the `retail_customer_segmentation.csv` into your SQL environment (MySQL/PostgreSQL).
2. Execute the queries provided in `retail_customer.sql`.
