/* Exploratory Data Analysis (EDA): 
Exploratory data analysis is done to answer the listed questions and aims of this project. */

-- Business Questions To Answer:

-- 1. What is the count of distinct cities in the dataset?
SELECT COUNT(DISTINCT city) AS city_count FROM sales_data;

-- 2. For each branch, what is the corresponding city?
SELECT DISTINCT branch, city FROM sales_data;

-- 3. What is the count of distinct product lines in the dataset?
SELECT COUNT(DISTINCT product_line) distinct_product_lines FROM sales_data;

-- 4. Which payment method occurs most frequently?
SELECT payment_method, COUNT(*) AS frequency
FROM sales_data
GROUP BY payment_method
ORDER BY frequency DESC
LIMIT 1;

-- 5. Which product line has the highest sales?
SELECT product_line, SUM(total) AS total_revenue
FROM sales_data
GROUP BY product_line
ORDER BY total_revenue DESC
LIMIT 1;

-- 6. How much revenue is generated each month?
SELECT month_name, SUM(total) AS monthly_revenue
FROM sales_data
GROUP BY month_name
ORDER BY monthly_revenue DESC;

-- 7. In which month did the cost of goods sold reach its peak?
SELECT month_name, SUM(cogs) AS total_cogs
FROM sales_data
GROUP BY month_name
ORDER BY total_cogs DESC
LIMIT 1;

-- 8. Which product line generated the highest revenue?
SELECT product_line, SUM(total) AS total_gross_income
FROM sales_data
GROUP BY product_line
ORDER BY total_gross_income DESC
LIMIT 1;

-- 9. In which city was the highest revenue recorded?
SELECT city, SUM(total) AS revenue
FROM sales_data
GROUP BY city
ORDER BY revenue DESC
LIMIT 1;

-- 10. Which product line incurred the highest Value Added Tax?
SELECT product_line, SUM(vat) AS total_vat
FROM sales_data
GROUP BY product_line
ORDER BY total_vat DESC
LIMIT 1;

-- 11. For each product line, add a column indicating "Good" if its sales are above average, otherwise "Bad."
WITH avg_sales AS (
    SELECT AVG(total) AS avg_total FROM sales_data
)
SELECT product_line,
       SUM(total) AS total_sales,
       CASE WHEN SUM(total) > (SELECT avg_total FROM avg_sales)
            THEN 'Good' ELSE 'Bad' END AS performance
FROM sales_data
GROUP BY product_line;

-- 12. Identify the branch that exceeded the average number of products sold.
WITH avg_qty AS (
    SELECT AVG(quantity) AS avg_quantity FROM sales_data
)
SELECT branch, SUM(quantity) AS total_quantity
FROM sales_data
GROUP BY branch
HAVING SUM(quantity) > (SELECT avg_quantity FROM avg_qty);

-- 13. Which product line is most frequently associated with each gender?
SELECT gender, product_line, COUNT(*) AS frequency
FROM sales_data
GROUP BY gender, product_line
ORDER BY gender, frequency DESC;

-- 14. Calculate the average rating for each product line.
SELECT product_line, ROUND(AVG(rating), 2) AS avg_rating
FROM sales_data
GROUP BY product_line;

-- 15. Count the sales occurrences for each time of day on every weekday.
SELECT day_name, time_of_day, COUNT(*) AS sales_count
FROM sales_data
GROUP BY day_name, time_of_day
ORDER BY day_name, time_of_day;

-- 16. Identify the customer type contributing the highest revenue.
SELECT customer_type, SUM(total) AS total_revenue
FROM sales_data
GROUP BY customer_type
ORDER BY total_revenue DESC;

-- 17. Determine the city with the highest VAT percentage.
SELECT city, AVG(vat) AS avg_vat
FROM sales_data
GROUP BY city
ORDER BY avg_vat DESC;

-- 18. Identify the customer type with the highest VAT payments.
SELECT customer_type, SUM(vat) as total_vat
FROM sales_data
GROUP BY customer_type
ORDER BY total_vat DESC;

-- 19. What is the count of distinct customer types in the dataset?
SELECT COUNT(DISTINCT customer_type) AS customer_types FROM sales_data;

-- 20. What is the count of distinct payment methods in the dataset?
SELECT COUNT(DISTINCT payment_method) AS customer_types FROM sales_data;

-- 21. Which customer type occurs most frequently?
SELECT customer_type, COUNT(*) AS frequency
FROM sales_data
GROUP BY customer_type
ORDER BY frequency DESC;

-- 22. Identify the customer type with the highest purchase frequency.
SELECT customer_type, COUNT(*) AS purchase_count
FROM sales_data
GROUP BY customer_type
ORDER BY purchase_count DESC;

-- 23. Determine the predominant gender among customers.
SELECT gender, COUNT(*) AS gender_count
FROM sales_data
GROUP BY gender
ORDER BY gender_count DESC;

-- 24. Examine the distribution of genders within each branch.
SELECT branch, gender, COUNT(*) AS count
FROM sales_data
GROUP BY branch, gender
ORDER BY branch, gender;

-- 25. Identify the time of day when customers provide the most ratings.
SELECT time_of_day, COUNT(rating) AS rating_count
FROM sales_data
GROUP BY time_of_day
ORDER BY rating_count DESC;

-- 26. Determine the time of day with the highest customer ratings for each branch.
SELECT branch, time_of_day, ROUND(AVG(rating), 2) AS avg_rating
FROM sales_data
GROUP BY branch, time_of_day
ORDER BY branch, avg_rating DESC;

-- 27. Identify the day of the week with the highest average ratings.
SELECT day_name, ROUND(AVG(rating), 2) AS avg_rating
FROM sales_data
GROUP BY day_name
ORDER BY avg_rating DESC;

-- 28. Determine the day of the week with the highest average ratings for each branch.
SELECT branch, day_name, ROUND(AVG(rating), 2) AS avg_rating
FROM sales_data
GROUP BY branch, day_name
ORDER BY branch, avg_rating DESC;






