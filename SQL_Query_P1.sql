-- SQL RETAIL SALES ANALYSIS P1 
CREATE DATABASE SQL_Project1;
USE SQL_Project1;

CREATE TABLE retail_sales 
			(
				transactions_id	INT PRIMARY KEY,
                sale_date DATE,
                sale_time TIME,
                customer_id	INT,
                gender VARCHAR(10),
                age	INT,
                category VARCHAR(15),	
                quantiy	INT,
                price_per_unit FLOAT,
                cogs FLOAT,
                total_sale fLOAT
			);
            
SELECT * FROM retail_sales;

-- DATA CLEANING

SELECT COUNT(*) FROM retail_sales
where transactions_id is NULL;

SELECT * FROM retail_sales
where
transactions_id is NULL
OR
sale_date is NULL
OR
sale_time is NULL
OR
customer_id is NULL
OR
gender is NULL
or
age is NULL
or
category is NULL
or
quantiy is NULL
or 
price_per_unit is NULL
or
cogs is NULL
or
total_sale is NULL
;

DELETE FROM retail_sales
where
transactions_id is NULL
OR
sale_date is NULL
OR
sale_time is NULL
OR
customer_id is NULL
OR
gender is NULL
or
age is NULL
or
category is NULL
or
quantiy is NULL
or 
price_per_unit is NULL
or
cogs is NULL
or
total_sale is NULL
;

-- DATA EXPLORATION

SELECT * FROM retail_sales;

-- How many sales we have
SELECT COUNT(*) as total_sale FROM retail_sales;

-- How many Unique coustmers we have - 3 one 
SELECT COUNT(*) as customer_id from retail_sales;
SELECT COUNT(customer_id) as total_sales from retail_sales;
SELECT COUNT(DISTINCT customer_id) as total_sales from retail_sales; -- it counts the customers for total sales who have unique customer id

SELECT DISTINCT category FROM retail_sales;

-- Data Analysis and Findings

-- 1. Write a SQL query to retrieve all columns for sales made on '2022-11-05:

Select * from retail_sales
where
sale_date = '2022-11-05';

-- 2 Write a SQL query to retrieve all transactions where the category is 'Clothing' and the quantity sold is more than 4 in the month of Nov-2022:

select * from retail_sales
where 
category = 'clothing'
and 
quantiy >= 4
and
sale_date BETWEEN '2022-11-01' AND '2022-11-30'
;

-- 3 Write a SQL query to calculate the total sales (total_sale) for each category.AND total orders:

SELECT 
distinct category, 
SUM(total_sale) as total_sales, 
COUNT(*) AS TOTAL_ORDERS 
from retail_sales
group by category;

-- 4 Write a SQL query to find the average age of customers who purchased items from the 'Beauty' category.:

SELECT
ROUND(AVG(AGE) ,2) as avg_age
FROM retail_sales
where category = 'Beauty';

-- 5 Write a SQL query to find all transactions where the total_sale is greater than 1000.:

Select * from 
retail_sales
where
total_sale > 1000;

-- 6 Write a SQL query to find the total number of transactions (transaction_id) made by each gender in each category.:

SELECT
category, 
gender,
COUNT(transactions_id) as transactions
from retail_sales
group by category, gender
order by 1;

-- 7 Write a SQL query to calculate the average sale for each month. Find out best selling month in each year:

SELECT * from
(
	SELECT 
    YEAR(sale_date) as year,
    MONTH(sale_date) as month,
    Round(AVG(total_sale) ,2),
    RANK() OVER( 
				PARTITION BY YEAR(sale_date)
                ORDER BY AVG(total_sale) DESC
                ) as rnk
                from retail_sales
                group by YEAR(sale_date), MONTH(sale_date)
) as t
where rnk = 1;


-- 8 **Write a SQL query to find the top 5 customers based on the highest total sales **:

SELECT
transactions_id,
SUM(total_sale)
from retail_sales
GROUP BY 1
ORDER BY 2 DESC
LIMIT 5;


-- Q.9 Write a SQL query to find the number of unique customers who purchased items from each category.

SELECT 
    category,    
    COUNT(DISTINCT customer_id) as cnt_unique_cs
FROM retail_sales
GROUP BY category;

-- Q.10 Write a SQL query to create each shift and number of orders (Example Morning <12, Afternoon Between 12 & 17, Evening >17)

SELECT
    CASE
        WHEN HOUR(sale_time) < 12 THEN 'Morning'
        WHEN HOUR(sale_time) BETWEEN 12 AND 17 THEN 'Afternoon'
        ELSE 'Evening'
    END AS shift,
    COUNT(*) AS total_orders
FROM retail_sales
GROUP BY shift;

-- END of Project