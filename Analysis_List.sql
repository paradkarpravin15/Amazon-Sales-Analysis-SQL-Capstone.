-- 1. Product Analysis
-- Goal:Understand the variety of product lines, their performance, and identify top vs. underperforming ones.

-- Key SQL Queries:
-- List of product lines:
SELECT DISTINCT product_line FROM sales_data;

-- Total sales by product line:
SELECT product_line, 
         SUM(total) AS total_sales, 
         SUM(quantity) AS total_quantity_sold,
         AVG(rating) AS avg_rating
FROM sales_data
GROUP BY product_line
ORDER BY total_sales DESC;

-- Average gross income per product line:
SELECT 
    product_line, 
    AVG(gross_income) AS avg_gross_income
FROM sales_data
GROUP BY product_line
ORDER BY avg_gross_income DESC;
-- ---

-- 2. Sales Analysis:
-- Goal: Analyze time-based trends and sales strategy effectiveness.

-- Key SQL Queries:
-- Sales by month (or day):
SELECT 
    month_name AS sale_month, 
    SUM(total) AS total_sales
FROM sales_data
GROUP BY sale_month
ORDER BY sale_month DESC;

-- Sales by hour of day:
SELECT HOUR(time) AS sale_hour, COUNT(*) AS num_sales, SUM(total) AS total_sales
FROM sales_data
GROUP BY HOUR(time)
ORDER BY sale_hour;

-- Branch-wise sales performance:
SELECT 
    branch, 
    SUM(total) AS total_revenue
FROM sales_data
GROUP BY branch
ORDER BY total_revenue DESC;


-- ---

-- 3. Customer Analysis**
-- Goal: Segment customers, understand trends, and profitability.

-- Key SQL Queries:
-- Customer type comparison (e.g., Member vs. Normal):**
SELECT customer_type, COUNT(*) AS num_purchases, SUM(total) AS total_spent
FROM sales_data
GROUP BY customer_type;

-- Gender-based purchasing trends:
SELECT 
    gender, 
    COUNT(*) AS num_purchases, 
    SUM(total) AS total_spent
FROM sales_data
GROUP BY gender;

-- Average rating by customer type:
SELECT 
    customer_type, 
    AVG(rating) AS avg_rating
FROM sales_data
GROUP BY customer_type;

