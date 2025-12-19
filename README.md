# sql-data-engineering
Practical SQL project with ETL, table creation, joins, and analytical queries for sales data
## 1. Database Schema (ERD)

- `customers` –(customer_id, name, country, join_date, ...)
- `products` – (product_id, name, category, price, ...)
- `sales` – (sale_id, customer_id, product_id, quantity, sale_date, total_amount, ...)


`customers (1) → (N) sales`
`products (1) → (N) sales`
ER

<img width="741" height="597" alt="image" src="https://github.com/user-attachments/assets/21059557-b836-415a-8b04-29c8b2333421" />

