# 🛒 SQL Retail Sales Analysis Project

## 📌 Project Overview

**Project Title:** Retail Sales Analysis

**Level:** Beginner

**Database:** SQL_Project1

This project demonstrates SQL skills commonly used by Data Analysts to perform data cleaning, exploratory data analysis (EDA), and business analysis on retail sales data.

The project covers:

* Database Creation
* Data Cleaning
* Data Exploration
* Business Analysis
* Window Functions
* Aggregations
* Customer Insights

---

# 🗄️ Database Setup

## Create Database

```sql
CREATE DATABASE SQL_Project1;
USE SQL_Project1;
```

## Create Table

```sql
CREATE TABLE retail_sales
(
    transactions_id INT PRIMARY KEY,
    sale_date DATE,
    sale_time TIME,
    customer_id INT,
    gender VARCHAR(10),
    age INT,
    category VARCHAR(15),
    quantiy INT,
    price_per_unit FLOAT,
    cogs FLOAT,
    total_sale FLOAT
);
```

---

# 🧹 Data Cleaning

## Check for NULL Values

```sql
SELECT * FROM retail_sales
WHERE
transactions_id IS NULL
OR sale_date IS NULL
OR sale_time IS NULL
OR customer_id IS NULL
OR gender IS NULL
OR age IS NULL
OR category IS NULL
OR quantiy IS NULL
OR price_per_unit IS NULL
OR cogs IS NULL
OR total_sale IS NULL;
```

## Delete NULL Records

```sql
DELETE FROM retail_sales
WHERE
transactions_id IS NULL
OR sale_date IS NULL
OR sale_time IS NULL
OR customer_id IS NULL
OR gender IS NULL
OR age IS NULL
OR category IS NULL
OR quantiy IS NULL
OR price_per_unit IS NULL
OR cogs IS NULL
OR total_sale IS NULL;
```

---

# 🔍 Data Exploration

## Total Number of Sales

```sql
SELECT COUNT(*) AS total_sale
FROM retail_sales;
```

## Total Customers

```sql
SELECT COUNT(*) AS customer_id
FROM retail_sales;
```

```sql
SELECT COUNT(customer_id) AS total_sales
FROM retail_sales;
```

## Unique Customers

```sql
SELECT COUNT(DISTINCT customer_id) AS total_sales
FROM retail_sales;
```

## Product Categories

```sql
SELECT DISTINCT category
FROM retail_sales;
```

---

# 📊 Data Analysis & Findings

## 1️⃣ Retrieve all columns for sales made on '2022-11-05'

```sql
SELECT *
FROM retail_sales
WHERE sale_date = '2022-11-05';
```

---

## 2️⃣ Retrieve all transactions where the category is 'Clothing' and quantity sold is greater than or equal to 4 during November 2022

```sql
SELECT *
FROM retail_sales
WHERE
category = 'clothing'
AND quantiy >= 4
AND sale_date BETWEEN '2022-11-01' AND '2022-11-30';
```

---

## 3️⃣ Calculate total sales and total orders for each category

```sql
SELECT
DISTINCT category,
SUM(total_sale) AS total_sales,
COUNT(*) AS total_orders
FROM retail_sales
GROUP BY category;
```

---

## 4️⃣ Find the average age of customers who purchased items from the 'Beauty' category

```sql
SELECT
ROUND(AVG(age),2) AS avg_age
FROM retail_sales
WHERE category = 'Beauty';
```

---

## 5️⃣ Find all transactions where total_sale is greater than 1000

```sql
SELECT *
FROM retail_sales
WHERE total_sale > 1000;
```

---

## 6️⃣ Find the total number of transactions made by each gender in each category

```sql
SELECT
category,
gender,
COUNT(transactions_id) AS transactions
FROM retail_sales
GROUP BY category, gender
ORDER BY 1;
```

---

## 7️⃣ Calculate the average sale for each month and find the best selling month in each year

```sql
SELECT *
FROM
(
    SELECT
        YEAR(sale_date) AS year,
        MONTH(sale_date) AS month,
        ROUND(AVG(total_sale),2),
        RANK() OVER
        (
            PARTITION BY YEAR(sale_date)
            ORDER BY AVG(total_sale) DESC
        ) AS rnk
    FROM retail_sales
    GROUP BY YEAR(sale_date), MONTH(sale_date)
) AS t
WHERE rnk = 1;
```

---

## 8️⃣ Find the top 5 customers based on the highest total sales

```sql
SELECT
transactions_id,
SUM(total_sale)
FROM retail_sales
GROUP BY 1
ORDER BY 2 DESC
LIMIT 5;
```

---

## 9️⃣ Find the number of unique customers who purchased items from each category

```sql
SELECT
category,
COUNT(DISTINCT customer_id) AS cnt_unique_cs
FROM retail_sales
GROUP BY category;
```

---

## 🔟 Create each shift and calculate the number of orders

### Shift Logic

| Shift     | Time                   |
| --------- | ---------------------- |
| Morning   | Before 12 PM           |
| Afternoon | Between 12 PM and 5 PM |
| Evening   | After 5 PM             |

```sql
SELECT
CASE
    WHEN HOUR(sale_time) < 12 THEN 'Morning'
    WHEN HOUR(sale_time) BETWEEN 12 AND 17 THEN 'Afternoon'
    ELSE 'Evening'
END AS shift,
COUNT(*) AS total_orders
FROM retail_sales
GROUP BY shift;
```

---

# 📈 Key Findings

* Identified total sales records and unique customers.
* Analyzed category-wise sales performance.
* Measured average customer age for Beauty category purchases.
* Identified high-value transactions above 1000.
* Analyzed transaction distribution by gender and category.
* Determined the best-performing month in each year using Window Functions.
* Identified top-performing transactions based on total sales.
* Measured unique customer contribution across product categories.
* Analyzed order distribution across Morning, Afternoon, and Evening shifts.

---

# 🛠️ Skills Demonstrated

* SQL Queries
* Data Cleaning
* Data Exploration
* Aggregate Functions
* GROUP BY
* ORDER BY
* CASE WHEN
* Window Functions
* RANK()
* Business Analytics
* Customer Analysis
* Sales Trend Analysis

---

# 🚀 Tools Used

* MySQL
* MySQL Workbench

---

# 📂 Project Structure

```text
SQL Retail Sales Analysis
│
├── Database Creation
├── Data Cleaning
├── Data Exploration
├── Business Analysis
└── SQL Queries
```

---

# 👨‍💻 Author

**Udit Goyal**

Aspiring Data Analyst

This project showcases practical SQL skills used in real-world retail sales analysis and business reporting.


### Stay Updated and Join the Community

For more content on SQL, data analysis, and other data-related topics, make sure to follow me on social media and join our community:
- **LinkedIn**: [Connect with me professionally](https://www.linkedin.com/in/udit-gupta-7a69102b2/?lipi=urn%3Ali%3Apage%3Ad_flagship3_profile_view_base_contact_details%3BfokiQAWLTKCN7ibklxjFBA%3D%3D)

Thank you for your support, and I look forward to connecting with you!



