-- Sales analysis queries (SQL Server). Database: SalesDB, table: sales_data (1,000 rows)
USE SalesDB;

-- 1. Checksum: rows and total recorded sales (expected 1000 and 5019265.23)
SELECT COUNT(*) AS total_rows, SUM(Sales_Amount) AS total_sales FROM sales_data;

-- 2. Sales by region
SELECT Region, SUM(Sales_Amount) AS total_sales
FROM sales_data GROUP BY Region ORDER BY total_sales DESC;

-- 3. Sales by sales rep
SELECT Sales_Rep, SUM(Sales_Amount) AS total_sales
FROM sales_data GROUP BY Sales_Rep ORDER BY total_sales DESC;

-- 4. North + Furniture (like SUMIFS in Excel; expected 394983.35)
SELECT SUM(Sales_Amount) AS total_sales
FROM sales_data WHERE Region = 'North' AND Product_Category = 'Furniture';

-- 5. Returning customers paying cash (like COUNTIFS in Excel; expected 153)
SELECT COUNT(*) AS total_count
FROM sales_data WHERE Customer_Type = 'Returning' AND Payment_Method = 'Cash';

-- 6. Sales by region and category
SELECT Region, Product_Category, SUM(Sales_Amount) AS total_sales
FROM sales_data GROUP BY Region, Product_Category ORDER BY Region, total_sales DESC;

-- 7. Top category in each region (CTE + ROW_NUMBER)
WITH ranked AS (
    SELECT Region, Product_Category, SUM(Sales_Amount) AS total_sales,
           ROW_NUMBER() OVER (PARTITION BY Region ORDER BY SUM(Sales_Amount) DESC) AS rn
    FROM sales_data GROUP BY Region, Product_Category
)
SELECT Region, Product_Category, total_sales FROM ranked WHERE rn = 1;

-- 8. Price-based gross profit by category (indicative only: Sales_Amount is not
--    derived from price x quantity in this dataset)
SELECT Product_Category, SUM((Unit_Price - Unit_Cost) * Quantity_Sold) AS price_based_profit
FROM sales_data GROUP BY Product_Category ORDER BY price_based_profit DESC;
