-- =========================================
-- Database: Sales Analytics (MySQL)
-- File: create_tables.sql
-- =========================================

DROP TABLE IF EXISTS sales;
DROP TABLE IF EXISTS products;
DROP TABLE IF EXISTS customers;

CREATE TABLE customers (
  customer_id VARCHAR(50) PRIMARY KEY,
  customer_name VARCHAR(100) NOT NULL,
  country VARCHAR(60),
  join_date DATE
);

CREATE TABLE products (
  product_id VARCHAR(50) PRIMARY KEY,
  product_name VARCHAR(120) NOT NULL,
  category VARCHAR(60),
  unit_price DECIMAL(10,2) NOT NULL
);

CREATE TABLE sales (
  sale_id BIGINT PRIMARY KEY AUTO_INCREMENT,
  sale_date DATE NOT NULL,
  customer_id VARCHAR(50) NOT NULL,
  product_id VARCHAR(50) NOT NULL,
  quantity INT NOT NULL,
  total_amount DECIMAL(12,2) NOT NULL,

  CONSTRAINT fk_sales_customer
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id),

  CONSTRAINT fk_sales_product
    FOREIGN KEY (product_id) REFERENCES products(product_id)
);

-- Helpful indexes for analytics
CREATE INDEX idx_sales_date ON sales(sale_date);
CREATE INDEX idx_sales_customer ON sales(customer_id);
CREATE INDEX idx_sales_product ON sales(product_id);

