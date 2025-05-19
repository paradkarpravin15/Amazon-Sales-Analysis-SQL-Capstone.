/*
Feature Engineering: 
This will help us generate some new columns from existing ones.

2.1 Add a new column named timeofday to give insight of sales in the Morning, 
Afternoon and Evening. This will help answer the question on which part of the day most 
sales are made.
2.2 Add a new column named dayname that contains the extracted days of the week on which 
the given transaction took place (Mon, Tue, Wed, Thur, Fri). This will help answer the 
question on which week of the day each branch is busiest.
2.3 Add a new column named monthname that contains the extracted months of the year on 
which the given transaction took place (Jan, Feb, Mar). Help determine which month of 
the year has the most sales and profit.
*/
-- 2.Feature Engineering: 
-- 2.1: Add time_of_day
ALTER TABLE sales_data ADD COLUMN time_of_day VARCHAR(20);

UPDATE sales_data
SET time_of_day = CASE
    WHEN EXTRACT(HOUR FROM time) BETWEEN 3 AND 12 THEN 'Morning'
    WHEN EXTRACT(HOUR FROM time) BETWEEN 12 AND 17 THEN 'Afternoon'
	WHEN EXTRACT(HOUR FROM time) BETWEEN 17 AND 21 THEN 'Evening'
    ELSE 'Night'
END;

-- 2.2: Add day_name
ALTER TABLE sales_data ADD COLUMN day_name VARCHAR(10);

UPDATE sales_data
SET day_name = LEFT(DAYNAME(date),3);

-- 2.3: Add month_name
ALTER TABLE sales_data ADD COLUMN month_name VARCHAR(10);

UPDATE sales_data
SET month_name = LEFT(MONTHNAME(date),3);

