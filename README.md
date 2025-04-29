Superstore Sales Analysis (SQL)
This project performs SQL operations on a superstore dataset using PostgreSQL.

It covers basic operations, aggregations, time-based analysis, and window functions.

Table Schema
The superstore table includes:

row_id (INT)

order_id (TEXT)

order_date (DATE)

ship_date (DATE)

ship_mode (TEXT)

customer_id (TEXT)

customer_name (TEXT)

segment (TEXT)

country (TEXT)

city (TEXT)

state (TEXT)

postal_code (INT)

region (TEXT)

product_id (TEXT)

category (TEXT)

sub_category (TEXT)

product_name (TEXT)

sales (NUMERIC)

quantity (INT)

discount (NUMERIC)

profit (NUMERIC)

Operations Performed
Basic Queries

Select all records

Count total rows

Extract month from order_date

Handle NULL values in sales

Aggregations

Group by year and month

Total sales by region and state

Top states based on sales

Distinct order count

Average sales and profit

Total quantity, sales, and profit by category

Top products by sales and profit

Orders by customer segment

Highest and lowest sales per product

Time-based Analysis

Filter orders within a specific date range

Window Functions

Rank products within each category by sales

Top 5 products from each category

Minimum and maximum sales within each category

Tools Used
PostgreSQL

SQL (Aggregation, Window functions, Date functions)

How to Use
Create the superstore table.

Insert the dataset.

Run the SQL scripts provided to perform the analysis.
