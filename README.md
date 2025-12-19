
# SQL Data Engineering & Analytics Project

## 1. Overview
This project demonstrates a practical end-to-end SQL data analytics workflow.
It covers database schema design, ETL pipeline implementation, and advanced analytical SQL queries
to generate business KPIs from raw sales data.

The goal is to showcase real-world SQL and data engineering skills used in analytics and BI roles.



## 2. Dataset
The dataset represents simplified sales transactions with the following attributes:
- Order information
- Product details
- Customer activity
- Revenue metrics

Raw data is stored as CSV files and processed through an ETL pipeline.



## 3. Database Schema (ERD)
The data model consists of three main entities:

- **customers**: customer-level information  
- **products**: product catalog  
- **sales**: transactional sales records  

Relationships:
- One customer can have many sales
- One product can appear in many sales
<img width="741" height="597" alt="image" src="https://github.com/user-attachments/assets/21059557-b836-415a-8b04-29c8b2333421" />




## 4. ETL Pipeline
A lightweight ETL pipeline is implemented in Python:

**Extract**
- Reads raw CSV sales data

**Transform**
- Handles invalid dates
- Removes invalid quantities and prices
- Creates derived features:
  - `revenue`
  - `year_month`

**Load**
- Writes cleaned data to a new CSV file
- Loads transformed data into a SQLite database

ETL scripts are located in the `etl/` directory.

---

## 5. SQL Analysis & KPIs
The project includes both basic and advanced SQL queries.

### Key Metrics:
- Total Revenue
- Average Order Value (AOV)
- Top Customers by Revenue
- Revenue by Product Category
- Monthly Revenue Trend
- Month-over-Month (MoM) Growth
- Cumulative (Running Total) Revenue
- Product Ranking within Categories

Advanced SQL features used:
- CTEs
- Window Functions (`LAG`, `RANK`, `SUM OVER`)
- Aggregations and subqueries

Queries can be found in:
- `sql/queries.sql`
- `sql/advanced_queries.sql`

---

## 6. How to Run the Project

### Requirements
```bash
pip install -r etl/requirements.txt
Run ETL
bash
Copy code
python etl/load_data.py
Query the Database
Use any SQLite client or Python to run SQL queries against:

bash
Copy code
data/sales.db
7. Project Structure
pgsql
Copy code
sql-data-engineering/
├── data/
├── etl/
├── sql/
│   ├── create_tables.sql
│   ├── queries.sql
│   └── advanced_queries.sql
└── README.md
8. Future Improvements
Extend schema with customer and product dimension tables

Add indexes for performance optimization

Migrate pipeline to a cloud data warehouse

Automate ETL scheduling

9. Skills Demonstrated
SQL (Joins, Aggregations, Window Functions)

Data Modeling & Schema Design

ETL Pipelines

Analytics Engineering Concepts

Business KPI Analysis

Author
Maryam Nasourinia
