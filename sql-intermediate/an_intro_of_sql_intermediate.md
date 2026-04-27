# 📊 SQL Intermediate – Topic-wise Introduction

This document covers intermediate SQL concepts that are essential for solving real-world data problems.  
These concepts go beyond basic queries and focus on combining, transforming, and analyzing data effectively.

---

## 1️⃣ JOINS  
Joins are used to combine data from multiple tables based on a related column.

Types of joins:
- `INNER JOIN` → Returns matching records from both tables  
- `LEFT JOIN` → Returns all records from left table + matched records from right  
- `RIGHT JOIN` → Returns all records from right table + matched records from left  

Joins are fundamental in real-world data analysis where data is spread across multiple tables.

---

## 2️⃣ GROUP BY  
`GROUP BY` is used to group rows that have the same values into summary rows.  
It is often used with aggregate functions like `COUNT()`, `SUM()`, and `AVG()`.

Example use cases:
- Total sales per region  
- Number of employees per department  

---

## 3️⃣ HAVING  
`HAVING` is used to filter grouped data after applying `GROUP BY`.  
While `WHERE` filters rows, `HAVING` filters aggregated results.

---

## 4️⃣ CASE WHEN  
`CASE WHEN` is used to add conditional logic inside SQL queries.  
It works like an IF-ELSE statement.

Example use cases:
- Categorizing data  
- Creating custom labels  
- Conditional transformations  

---

## 5️⃣ Subqueries  
A subquery is a query inside another query.  
It helps break complex problems into smaller parts.

Types:
- Single-row subquery  
- Multi-row subquery  
- Nested subqueries  

Used for filtering, comparison, and dynamic calculations.

---

## 6️⃣ Window Functions  
Window functions perform calculations across a set of rows related to the current row without grouping them.

Common functions:
- `ROW_NUMBER()` → Assigns unique row numbers  
- `RANK()` → Assigns rank with gaps  
- `DENSE_RANK()` → Assigns rank without gaps  

Used for:
- Ranking data  
- Finding top values  
- Running totals  

---

## 💡 Key Insight  
SQL becomes powerful when you start connecting data across tables and applying logic to solve business problems—not just retrieving data.

---

## 🚀 Real-World Importance  
These concepts are heavily used in:
- Data analysis  
- Reporting dashboards  
- Business intelligence  
- Data science workflows  

---

## 🔗 Connect with Me  
LinkedIn: https://www.linkedin.com/in/divya-devendra-singh
