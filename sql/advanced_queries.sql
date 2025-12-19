-- =========================================
-- Advanced SQL Analytics Queries (KPIs)
-- =========================================

-- 0) Base revenue column assumed:
-- revenue = quantity * unit_price

-- 1) Total Revenue
SELECT
  SUM(quantity * unit_price) AS total_revenue
FROM sales;

-- 2) Average Order Value (AOV)
SELECT
  AVG(order_revenue) AS avg_order_value
FROM (
  SELECT order_id, SUM(quantity * unit_price) AS order_revenue
  FROM sales
  GROUP BY order_id
) t;

-- 3) Top 5 customers by revenue
SELECT
  customer_id,
  SUM(quantity * unit_price) AS customer_revenue
FROM sales
GROUP BY customer_id
ORDER BY customer_revenue DESC
LIMIT 5;

-- 4) Revenue by category (with % contribution)
SELECT
  category,
  SUM(quantity * unit_price) AS revenue,
  ROUND(
    100.0 * SUM(quantity * unit_price) /
    (SELECT SUM(quantity * unit_price) FROM sales)
  , 2) AS pct_of_total
FROM sales
GROUP BY category
ORDER BY revenue DESC;

-- 5) Monthly revenue trend
SELECT
  strftime('%Y-%m', order_date) AS year_month,
  SUM(quantity * unit_price) AS revenue
FROM sales
GROUP BY strftime('%Y-%m', order_date)
ORDER BY year_month;

-- 6) Month-over-Month (MoM) growth
WITH monthly AS (
  SELECT
    strftime('%Y-%m', order_date) AS year_month,
    SUM(quantity * unit_price) AS revenue
  FROM sales
  GROUP BY strftime('%Y-%m', order_date)
),
mom AS (
  SELECT
    year_month,
    revenue,
    LAG(revenue) OVER (ORDER BY year_month) AS prev_revenue
  FROM monthly
)
SELECT
  year_month,
  revenue,
  prev_revenue,
  ROUND(
    100.0 * (revenue - prev_revenue) / NULLIF(prev_revenue, 0)
  , 2) AS mom_growth_pct
FROM mom
ORDER BY year_month;

-- 7) Running total revenue (cumulative)
WITH monthly AS (
  SELECT
    strftime('%Y-%m', order_date) AS year_month,
    SUM(quantity * unit_price) AS revenue
  FROM sales
  GROUP BY strftime('%Y-%m', order_date)
)
SELECT
  year_month,
  revenue,
  SUM(revenue) OVER (ORDER BY year_month) AS running_total
FROM monthly
ORDER BY year_month;

-- 8) Ranking products by revenue within each category
WITH prod_rev AS (
  SELECT
    category,
    product,
    SUM(quantity * unit_price) AS revenue
  FROM sales
  GROUP BY category, product
)
SELECT
  category,
  product,
  revenue,
  RANK() OVER (PARTITION BY category ORDER BY revenue DESC) AS product_rank
FROM prod_rev
ORDER BY category, product_rank;
