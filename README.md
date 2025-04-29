# Superstore Sales Analysis using SQL

This project analyzes Superstore sales data using SQL.  
It covers basic operations, aggregations, time-based analysis, and window functions.

## SQL Operations Performed

### 1. Basic Operations
- Select all data
- Count total number of rows
- Extract month from `order_date`
- Handle NULL values in `sales`

### 2. Aggregations
- Group sales data by year and month
- Calculate total sales by region and state
- Find top 10 states by total sales
- Count distinct orders
- Calculate average sales and profit
- Summarize quantity, sales, and profit by category
- Find top products by sales and profit
- Count orders by customer segment
- Find highest and lowest sales per product

### 3. Time-based Analysis
- Filter orders between specific dates

### 4. Window Functions
- Rank products within categories based on sales
- Find top 5 products in each category
- Calculate min and max sales within each category

## Tools Used

- PostgreSQL
- SQL (Aggregation, Date Functions, Window Functions)

## How to Run

1. Create the `superstore` table in PostgreSQL.
2. Load your data into the table.
3. Run the provided SQL queries step-by-step.
