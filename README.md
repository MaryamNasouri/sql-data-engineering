# sql-data-engineering
Practical SQL project with ETL, table creation, joins, and analytical queries for sales data
## 1. Database Schema (ERD)

- `customers` –(customer_id, name, country, join_date, ...)
- `products` – (product_id, name, category, price, ...)
- `sales` – (sale_id, customer_id, product_id, quantity, sale_date, total_amount, ...)


`customers (1) → (N) sales`
`products (1) → (N) sales`
ER
 ┌─────────────┐        ┌─────────────┐
 │  customers  │        │   products  │
 │─────────────│        │─────────────│
 │ customer_id │        │ product_id  │
 │ name        │        │ name        │
 │ country     │        │ category    │
 └───────┬─────┘        └──────┬──────┘
         │                      │
         │ 1                  1 │
         │                      │
         ▼                      ▼
              ┌─────────────────────┐
              │        sales        │
              │─────────────────────│
              │ sale_id             │
              │ customer_id (FK)    │
              │ product_id (FK)     │
              │ quantity            │
              │ sale_date           │
              └─────────────────────┘
