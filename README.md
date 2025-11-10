# 🧑‍💻 Task S2.02. SQL Queries – Products & Manufacturers  
**Author:** David Rey  
**Corrected by:** Luriguso ([luriguso](https://github.com/Viid21/S2_02_MySQL_Queries/issues/1))

## 📄 Description  
This project focuses on practicing **SQL queries** using two related tables:  

- **producto**  
  - `codigo`  
  - `nombre`  
  - `precio`  
  - `codigo_fabricante`  

- **fabricante**  
  - `codigo`  
  - `nombre`  

The field `codigo_fabricante` in the `producto` table is a foreign key referencing the field `codigo` in the `fabricante` table.  

The goal is to execute a series of queries to retrieve, filter, and manipulate data from these tables, applying concepts such as **SELECT**, **JOIN**, **ORDER BY**, **DISTINCT**, **LIMIT**, **functions (UPPER, LOWER, ROUND, TRUNCATE)**, and **conditions (WHERE, IN, LIKE)**.

---

## 🔹 Queries to Implement  

1. List the name of all products in the `producto` table.  
2. List the names and prices of all products.  
3. List all columns of the `producto` table.  
4. List the product name, price in euros, and price in USD.  
5. Same as above, but using column aliases: `product_name`, `euros`, `dollars`.  
6. List product names and prices, converting names to uppercase.  
7. List product names and prices, converting names to lowercase.  
8. List manufacturer names and, in another column, the first two characters of the name in uppercase.  
9. List product names and prices, rounding the price value.  
10. List product names and prices, truncating the price to remove decimals.  
11. List the manufacturer codes that have products in the `producto` table.  
12. Same as above, but eliminating duplicates.  
13. List manufacturer names in ascending order.  
14. List manufacturer names in descending order.  
15. List product names ordered first by name (ASC) and then by price (DESC).  
16. Return the first 5 rows of the `fabricante` table.  
17. Return 2 rows starting from the 4th row of the `fabricante` table (including the 4th).  
18. List the name and price of the cheapest product (using `ORDER BY` and `LIMIT`).  
19. List the name and price of the most expensive product (using `ORDER BY` and `LIMIT`).  
20. List the names of products whose manufacturer code is equal to 2.  
21. Return product name, price, and manufacturer name for all products.  
22. Same as above, ordered by manufacturer name alphabetically.  
23. Return product code, product name, manufacturer code, and manufacturer name for all products.  
24. Return product name, price, and manufacturer name of the cheapest product.  
25. Return product name, price, and manufacturer name of the most expensive product.  
26. Return all products from manufacturer **Lenovo**.  
27. Return all products from manufacturer **Crucial** with price > 200€.  
28. Return all products from manufacturers **Asus**, **Hewlett-Packard**, and **Seagate** (without using `IN`).  
29. Same as above, but using `IN`.  
30. Return product name and price of all products whose manufacturer name ends with the vowel `e`.  
31. Return product name and price of all products whose manufacturer name contains the character `w`.  
32. Return product name, price, and manufacturer name of all products with price ≥ 180€, ordered by price (DESC) and then name (ASC).  
33. Return manufacturer code and name only for those manufacturers that have products associated.  
34. Return all manufacturers with their products, including those without products (using `LEFT JOIN`).  
35. Return only manufacturers that do not have any associated products.  
36. Return all products from manufacturer **Lenovo** (without using `INNER JOIN`).  
37. Return all products that have the same price as the most expensive product from manufacturer **Lenovo** (without using `INNER JOIN`).  
38. List the name of the most expensive product from manufacturer **Lenovo**.  
39. List the name of the cheapest product from manufacturer **Hewlett-Packard**.  
40. Return all products with price ≥ the most expensive product from manufacturer **Lenovo**.  
41. List all products from manufacturer **Asus** with price greater than the average price of all its products.  

---

## 💻 Technologies Used  
- MySQL / MariaDB for relational database design  
- SQL queries with `SELECT`, `JOIN`, `WHERE`, `ORDER BY`, `GROUP BY`, `LIMIT`, `DISTINCT`  
- String functions: `UPPER()`, `LOWER()`, `LEFT()`  
- Numeric functions: `ROUND()`, `TRUNCATE()`  
- Filtering with `IN`, `LIKE`  
- Git & GitHub for version control  
- Documentation with README  

---

## 📋 Requirements  
- MySQL or compatible RDBMS installed  
- SQL client or IDE (MySQL Workbench, DBeaver, IntelliJ Database plugin)  
- Git installed to clone the repository  
- Basic knowledge of relational modeling and SQL  

---

## 🛠️ Installation  
- Clone the repository:  
```bash
https://github.com/Viid21/S2_02_MySQL_Queries.git
