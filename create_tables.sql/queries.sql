USE salesdb;

-- 1) Total revenue
SELECT 
    SUM(quantity * unit_price) AS total_revenue
FROM sales;

-- 2) Total orders per region
SELECT 
    region,
    COUNT(order_id) AS total_orders
FROM sales
GROUP BY region
ORDER BY total_orders DESC;

-- 3) Best-selling category
SELECT 
    category,
    SUM(quantity) AS total_quantity_sold
FROM sales
GROUP BY category
ORDER BY total_quantity_sold DESC
LIMIT 1;

-- 4) Monthly revenue
SELECT 
    DATE_FORMAT(order_date, '%Y-%m') AS month,
    SUM(quantity * unit_price) AS revenue
FROM sales
GROUP BY DATE_FORMAT(order_date, '%Y-%m')
ORDER BY month;

-- 5) Top 3 customers by revenue
SELECT 
    customer_id,
    SUM(quantity * unit_price) AS customer_revenue
FROM sales
GROUP BY customer_id
ORDER BY customer_revenue DESC
LIMIT 3;
