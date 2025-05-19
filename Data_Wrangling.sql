/*
Data Wrangling: 
This is the first step where inspection of data is done to make sure NULL values and 
missing values are detected and data replacement methods are used to replace missing or 
NULL values.

1.1 Build a database
1.2 Create a table and insert the data.
1.3 Select columns with null values in them. There are no null values in our database 
as in creating the tables, we set NOT  NULL for each field, hence null values are 
filtered out.	*/

-- 1.Data Wrangling: 
CREATE DATABASE amazon_sales;
USE amazon_sales;

CREATE TABLE sales_data (
    invoice_id VARCHAR(30) PRIMARY KEY,
    branch VARCHAR(5) NOT NULL,
    city VARCHAR(30) NOT NULL,
    customer_type VARCHAR(30) NOT NULL,
    gender VARCHAR(10) NOT NULL,
    product_line VARCHAR(100) NOT NULL,
    unit_price DECIMAL(10,2) NOT NULL,
    quantity INT NOT NULL,
    vat DECIMAL(6,4) NOT NULL,
    total DECIMAL(10,2) NOT NULL,
    date DATE NOT NULL,
    time TIME NOT NULL,
    payment_method VARCHAR(30) NOT NULL,
    cogs DECIMAL(10,2) NOT NULL,
    gross_margin_percentage DECIMAL(11,9) NOT NULL,
    gross_income DECIMAL(10,2) NOT NULL,
    rating DECIMAL(2,1) NOT NULL
);

SELECT * FROM sales_data;
