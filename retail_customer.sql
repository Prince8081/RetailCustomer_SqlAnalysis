create database retail_data;
use retail_data ;
select * from retail_customer;


-- Level 1: Basic (Filtering & Aggregations) --

-- 1. Revenue by Country --

SELECT 
    country, ROUND(SUM(TotalAmount), 2) AS Total_Revenue
FROM
    retail_customer
GROUP BY 1
ORDER BY 2 DESC;

-- 2. List all unique products sold in 'India'. --

SELECT DISTINCT
    Product
FROM
    retail_customer
WHERE
    country = 'India';
    
-- 3. how many transactions were recorded for the 'Watch' product category.--

SELECT 
    COUNT(InvoiceNo) AS Total_Transaction
FROM
    retail_customer
WHERE
    Product = 'Watch';
    
-- 4. all records where the UnitPrice is greater than 1,500. --

SELECT 
    *
FROM
    retail_customer
WHERE
    UnitPrice > '1500';
    

-- Level 2: Intermediate (Grouping & Dates) --

-- 1. top 5 Customers based on their total spending --

SELECT 
    CustomerId,
    COUNT(InvoiceNo) AS Total_Transaction,
    ROUND(SUM(TotalAmount), 2) AS Total_Spend
FROM
    retail_customer
GROUP BY 1
ORDER BY 3 DESC
LIMIT 5;

-- 2. Monthly Sales Trend (2023) --

SELECT 
    DATE_FORMAT(InvoiceDate, '%m') AS Month,
    ROUND(SUM(TotalAmount), 2) AS MonthlyRevenue
FROM
    retail_customer
WHERE
    InvoiceDate >= '2023-01-01'
        AND InvoiceDate <= '2023-12-31'
GROUP BY Month
ORDER BY Month;

-- 3. Average Days Between Purchases -- 

SELECT 
    customerid,
    MIN(InvoiceDate) AS firstPurchase,
    MAX(InvoiceDate) AS LastPurchase,
    DATEDIFF(MAX(InvoiceDate), MIN(InvoiceDate)) AS DaysBetween
FROM
    retail_customer
GROUP BY 1;

-- Level 3: Advanced (Window Functions & CTEs)-- 

-- Best-Selling Product per Country --

WITH ProductRanking AS (
    SELECT 
        Country, 
        Product, 
        SUM(Quantity) as TotalQty,
        RANK() OVER(PARTITION BY Country ORDER BY SUM(Quantity) DESC) as SalesRank
    FROM retail_customer
    GROUP BY Country, Product
)
SELECT 
    Country, 
    Product, 
    TotalQty
FROM ProductRanking
WHERE SalesRank = 1;

-- Market Share Percentage --

SELECT 
    country,
    ROUND(SUM(TotalAmount), 2) AS Revenue,
    ROUND((SUM(TotalAmount) / (SELECT 
                    SUM(TotalAmount)
                FROM
                    retail_customer)) * 100,
            2) AS Market_Share
FROM
    retail_customer
GROUP BY 1 
order by 3 desc ;
 
 
 -- Customer Segmentation (Tiering) on their total spending.--
 
 SELECT 
    CustomerId,
    ROUND(SUM(TotalAmount), 2) AS Total_Spend,
    CASE
        WHEN SUM(TotalAmount) > 20000 THEN 'Platinum'
        WHEN SUM(TotalAmount) BETWEEN 10000 AND 20000 THEN 'Gold'
        ELSE 'Silver'
    END AS CustomerTier
FROM
    retail_customer
GROUP BY 1;


 
