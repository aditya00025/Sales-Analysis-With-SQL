-- 'superstore' table created
CREATE TABLE superstore (
    row_id INT,  -- Unique identifier for each row
    order_id TEXT,  -- Order ID (text format)
    order_date DATE,  -- Date when the order was placed
    ship_date DATE,  -- Date when the order was shipped
    ship_mode TEXT,  -- Mode of shipping (e.g., Standard, Expedited)
    customer_id TEXT,  -- Unique identifier for the customer
    customer_name TEXT,  -- Name of the customer
    segment TEXT,  -- Customer segment (e.g., Consumer, Corporate)
    country TEXT,  -- Country of the customer
    city TEXT,  -- City where the customer is located
    state TEXT,  -- State where the customer is located
    postal_code INT,  -- Postal code for the customer's address
    region TEXT,  -- Region of the country (e.g., North, South)
    product_id TEXT,  -- Unique identifier for the product
    category TEXT,  -- Category of the product (e.g., Furniture, Office Supplies)
    sub_category TEXT,  -- Sub-category of the product
    product_name TEXT,  -- Name of the product
    sales NUMERIC,  -- Total sales amount for the product
    quantity INT,  -- Quantity of the product sold
    discount NUMERIC,  -- Discount applied to the product
    profit NUMERIC  -- Profit from the product sale
);


--Basic Operations:

-- Select all data from the superstore table
SELECT * FROM superstore;

-- Count the total number of rows in the superstore table
SELECT COUNT(*) FROM superstore;

--Extracting month from order_date

SELECT order_date,
EXTRACT(MONTH FROM order_date) AS month
FROM superstore
LIMIT 10;


-- Count the number of rows where sales is NULL
-- (Currently there are no NULL values, but this is an example of how to handle them)
SELECT COUNT(*) FROM superstore WHERE sales IS NULL;

-- If any sales are NULL, update them to 0
UPDATE public.superstore
SET sales = 0
WHERE sales IS NULL;


--Aggregation:

-- Grouping data by year and month
SELECT 
    EXTRACT(YEAR FROM order_date) AS year,
    EXTRACT(MONTH FROM order_date) AS month,
    COUNT(*) AS order_count
FROM superstore
GROUP BY year, month;

-- Calculate total sales by region, ordered by total sales in descending order
SELECT region, SUM(sales) AS total_sales
FROM superstore
GROUP BY region
ORDER BY total_sales DESC;

-- Calculate total sales by state and return the top 10 states based on total sales
SELECT state, SUM(sales) AS total_sales
FROM public.superstore
GROUP BY state
ORDER BY total_sales DESC LIMIT 10;

-- Counting distinct orders (order volume)
SELECT COUNT(DISTINCT order_id) AS total_orders
FROM superstore;

-- Calculate the average sales across the entire superstore dataset
SELECT AVG(sales) AS avg_sales
FROM superstore;

-- Calculate the average profit across the entire superstore dataset
SELECT AVG(profit) AS avg_profit
FROM superstore;

-- Calculate total quantity, total sales, and total profit by product category
SELECT category, SUM(quantity) AS total_quantity, SUM(sales) AS total_sales, SUM(profit) AS total_profit
FROM superstore
GROUP BY category
ORDER BY total_sales DESC;

-- Calculate total sales by product name and category, and average discount for the top 5 products
SELECT product_name, SUM(sales) AS total_sales, category, AVG(discount) AS avg_discount
FROM superstore
GROUP BY product_name, category
ORDER BY total_sales DESC
LIMIT 5;

-- Calculate total profit by product name and category, and average discount for the top 5 products
SELECT product_name, SUM(profit) AS total_profit, category, AVG(discount) AS avg_discount
FROM superstore
GROUP BY product_name, category
ORDER BY total_profit DESC
LIMIT 5;

-- Count the number of orders in each customer segment and order by the segment with the most orders
SELECT segment, COUNT(*) AS order_count
FROM superstore
GROUP BY segment
ORDER BY order_count DESC;

-- Get the highest and lowest sales for each product, ordered by highest sales
SELECT product_name, MAX(sales) AS highest_sales, MIN(sales) AS lowest_sales
FROM public.superstore
GROUP BY product_name
ORDER BY highest_sales DESC LIMIT 5;



-- Time-based Analysis:

-- Filtering orders by date
SELECT * FROM superstore WHERE 
order_date BETWEEN '2015-04-18' AND '2017-11-09';


-- Window Functions:

-- Rank products within each category based on sales
SELECT product_name, category, sales, 
RANK() OVER (PARTITION BY category ORDER BY sales DESC) AS rank
FROM superstore;

-- Top 5 products from each category based on sales rank
WITH RankedProducts AS (
    SELECT product_name, category, sales, 
    RANK() OVER (PARTITION BY category ORDER BY sales DESC) AS rank
    FROM superstore
)
SELECT product_name, category, sales, rank
FROM RankedProducts
WHERE rank <= 5  
ORDER BY category, rank;

-- Calculate minimum and maximum sales within each category, along with the row number to rank products
WITH ranked_products AS (
    SELECT product_name, category, sales,
           MIN(sales) OVER (PARTITION BY category) AS min_sales,
           MAX(sales) OVER (PARTITION BY category) AS max_sales,
           ROW_NUMBER() OVER (PARTITION BY category ORDER BY sales DESC) AS row_num
    FROM superstore
)
SELECT product_name, category, sales, min_sales, max_sales
FROM ranked_products
WHERE row_num <= 5;  



