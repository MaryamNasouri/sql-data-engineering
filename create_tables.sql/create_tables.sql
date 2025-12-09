-- Create database 
CREATE DATABASE IF NOT EXISTS salesdb;
USE salesdb;

-- Drop table if exists
DROP TABLE IF EXISTS sales;

-- Create main sales table
CREATE TABLE sales (
    order_id INT PRIMARY KEY,
    order_date DATE,
    customer_id INT,
    product VARCHAR(50),
    category VARCHAR(50),
    region VARCHAR(50),
    quantity INT,
    unit_price DECIMAL(10,2)
);

-- Verification
SELECT * FROM sales LIMIT 5;

