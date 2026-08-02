# SQL Data Analyst Portfolio

This repository contains SQL practice and real-world data analysis covering:

---

## 🧠 Topics Covered

- SQL Basics → Filtering, Sorting, Functions  
- SQL Intermediate → Joins, Aggregations, Case-When, Subqueries, Window Functions  
- SQL Advanced → CTEs, Set Operations, Grouping Sets, Rollup & Cube, Date & Time Functions,
                  String Functions, Indexing, Advanced Join Types, Query Optimization
- SQL Interview Practice → 150+ Solved SQL Queries covering Basics, Joins, Subqueries, 
                  CTEs, Window Functions, Gap & Island, and Real-world Interview Problems 

---

## 🛠️ Tools Used

- MySQL / PostgreSQL  
- Real-world style datasets (sales, e-commerce)

---

## 📂 Project Structure
```
sql-data-analyst-portfolio/
│
├── sql-basics/
│   ├── an_intro_of_sql_basics.md
│   ├── basic_filters.sql
│   ├── pattern_matching.sql
│   ├── sorting.sql
│   └── string_functions.sql
├── sql-intermediate/
│   ├── an_intro_of_sql_intermediate.md
│   ├── joins/
│   │   ├── data_setup.sql
│   │   ├── basic_joins.sql
│   │   ├── join_with_conditions.sql
│   │   └── joins_with_aggregation.sql
│
│   ├── aggregation/
│   │   ├── group_by.sql
│   │   └──  having.sql
│
│   ├── case_when/
│   │   └── case_when.sql
│
│   ├── subqueries/
│   └── subqueries.sql
│
│   ├── window-functions/
│   │   ├── row_number.sql
│   │   └── rank_dense_rank.sql
├── sql-advanced/
│   ├── cte_queries.sql
│   ├── window_functions.sql
│   ├── subqueries.sql
│   ├── case_when.sql
│   ├── union_unionall.sql
│   ├── intersect_except.sql
│   ├── grouping_sets_rollup_cube.sql
│   ├── date_functions.sql
│   ├── string_functions.sql
│   ├── indexing.sql
│   └── advanced_join_types.sql
│
├── sql-interview-practice/
│   ├── 01_sql_basics_practice.sql
│   ├── 02_aggregate_functions_practice.sql
│   ├── 03_groupby_having_practice.sql
│   ├── 04_joins_practice.sql
│   ├── 05_case_when_coalesce_practice.sql
│   ├── 06_subqueries_practice.sql
│   ├── 07_cte_practice.sql
│   ├── 08_window_functions_practice.sql
│   └── 09_gap_and_island_practice.sql
└── README.md
```

---

## 📌 SQL Basics

This section covers foundational SQL concepts.

### Topics Covered:
- Filtering using WHERE
- Pattern matching using LIKE
- Sorting using ORDER BY
- Conditional operators (AND, OR, BETWEEN)
- Basic string functions

### Dataset used:
- employees (id, name, department, salary, joining_date)

### Key Learnings:
- Filtering and retrieving required data
- Sorting records efficiently
- Using conditions for precise querying
- Working with basic text functions

### Use Cases:
- Employee data analysis
- Basic reporting
- Filtering business records
- Searching and sorting datasets

---

## 📌 SQL Intermediate

This section focuses on intermediate SQL concepts used for real-world data analysis and business problem solving.

### Topics Covered:
- Joins (INNER, LEFT, RIGHT)
- GROUP BY and HAVING
- Aggregate Functions (COUNT, SUM, AVG)
- CASE WHEN logic
- Subqueries
- Window Functions (ROW_NUMBER, RANK, DENSE_RANK)
- PARTITION BY and Running Totals

### Dataset used:
- Customers (customer_id, name, city)
- Orders (order_id, customer_id, amount, order_date)
- Customers_India (customer_id, name)
- Customers_US (customer_id, name)

### Key Learnings:
- Combining data from multiple tables using joins
- Performing aggregations for analytical insights
- Applying conditional business logic using CASE WHEN
- Writing nested queries using subqueries
- Using window functions for ranking and trend analysis
- Identifying missing and unmatched records

### Use Cases:
- Customer order analysis
- Revenue calculation
- Customer segmentation
- Top N and ranking analysis
- Business reporting
- Trend and performance tracking

---

## 📌 SQL Advanced

This section covers advanced SQL concepts used for analytical querying and performance optimization.

### Topics Covered:
- Common Table Expressions (CTEs)
- Advanced Window Functions
- Advanced Subqueries
- CASE WHEN logic
- UNION and UNION ALL
- INTERSECT and EXCEPT
- GROUPING SETS, ROLLUP, and CUBE
- Date & Time Functions
- String Functions
- Indexing
- Advanced Join Types

### Dataset used:
- Customers (customer_id, name, city, email, address)
- Orders (order_id, customer_id, amount, order_date)
- Employees (employee_id, employee_name, department, salary, joining_date)
- Sales (region, product, sales)
- Customers_India (customer_id, name, email)
- Customers_USA (customer_id, name, email)
- table_a (id)
- table_b (id)
- Products (product_id, product_name)

### Key Learnings:
- Using CTEs to simplify complex queries
- Performing advanced analytical calculations with window functions
- Writing optimized nested queries
- Applying set operations for data comparison
- Using date and string functions for data transformation
- Improving query performance using indexing
- Working with advanced join techniques

### Use Cases:
- Customer segmentation
- Revenue and sales analysis
- Ranking and trend analysis
- Data cleaning and formatting
- Report generation
- Query optimization
- Identifying missing or duplicate records
- Advanced business analytics

---

## 📌 SQL Interview Practice

This section contains hands-on SQL interview questions covering beginner to advanced concepts. Each practice file includes sample datasets, interview questions, SQL solutions, and alternative approaches where applicable.

### Topics Covered:
- SQL Basics
- Aggregate Functions
- GROUP BY and HAVING
- Joins (INNER, LEFT, RIGHT, SELF)
- CASE WHEN and COALESCE
- Subqueries and Correlated Subqueries
- Common Table Expressions (CTEs)
- Window Functions (ROW_NUMBER, RANK, DENSE_RANK, LAG, LEAD)
- Running Totals and Ranking Problems
- Gap & Island Problems
- Set Operations
- Real-world Business SQL Scenarios
- Mixed SQL Interview Questions

### Dataset used:
- Employees (employee_id, employee_name, department, salary, joining_date)
- Departments (department_id, department_name)
- Customers (customer_id, customer_name, city)
- Orders (order_id, customer_id, amount, order_date)
- Sales (sale_id, customer_id, product_id, sale_date, amount)
- Products (product_id, product_name, category, price)
- Login (login_id, user_id, login_date)
- Attendance (employee_id, attendance_date)
- Customers_India (customer_id, customer_name)
- Customers_USA (customer_id, customer_name)

### Key Learnings:
- Solving real SQL interview questions using multiple approaches
- Choosing the appropriate SQL concept based on the problem statement
- Applying Joins, Subqueries, CTEs, and Window Functions effectively
- Solving ranking, running total, and analytical reporting problems
- Identifying consecutive records using Gap & Island techniques
- Improving query readability and optimization
- Developing business-oriented problem-solving skills

### Use Cases:
- Data Analyst interview preparation
- SQL coding practice
- Business reporting and analytics
- Customer behavior analysis
- Revenue and sales reporting
- Ranking and trend analysis
- Consecutive activity (Gap & Island) analysis
- Query optimization practice
- Real-world business case studies
---

## 🎯 Goal

To strengthen SQL skills for data analysis and business problem solving.

## 🔗 Connect with Me

LinkedIn: https://www.linkedin.com/in/divya-devendra-singh
