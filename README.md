# SQL Data Warehouse Project

## Project Overview

This project demonstrates the design and analysis of a Retail Sales Data Warehouse using MySQL.

The project includes:
- Database design
- Table creation with Primary and Foreign Keys
- Data insertion
- Business analytics queries
- JOINs
- CTEs (Common Table Expressions)
- Window Functions

---

## Database Schema

### Customers
Stores customer information.

### Products
Stores product details and pricing.

### Orders
Stores order-level information.

### Order_Details
Stores transaction-level sales data.

---

## Entity Relationship Structure

Customers
    |
    |
Orders
    |
    |
Order_Details
    |
    |
Products

---

## SQL Concepts Used

- CREATE TABLE
- PRIMARY KEY
- FOREIGN KEY
- INNER JOIN
- LEFT JOIN
- GROUP BY
- ORDER BY
- Aggregate Functions
- CTEs
- Window Functions
- RANK()

---

## Business Questions Solved

1. Total Revenue Generated
2. Revenue by Customer
3. Top Selling Products
4. Revenue by Category
5. Customer Ranking by Revenue
6. Customers with No Orders
7. Monthly Sales Trend
8. High Revenue Customers using CTE
9. Top Product in Each Category

---

## Key Insights

- Neel generated the highest revenue.
- Electronics contributed the majority of sales revenue.
- Laptop was the highest revenue-generating product.
- Window Functions were used to rank customers.
- CTEs were used to simplify analytical queries.

---

## Repository Structure

├── create_tables.sql

├── insert_data.sql

├── analysis_queries.sql

└── README.md

---

## Technologies Used

- MySQL
- MySQL Workbench
- GitHub

---

## Author

Neel Abhishek
