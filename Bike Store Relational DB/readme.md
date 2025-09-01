---

# Database Solution Project: Bike Store Data

This project documents the development of a high-quality database solution using PostgreSQL and T-SQL, focused on the analysis and reporting of a bike store's sales data. The entire process, from environment setup to data cleaning and integrity, is detailed here.

---

## 1. Project Setup and Environment Configuration

The initial phase involved setting up a robust development environment to support T-SQL and PostgreSQL-based solutions.

* **Database System**: PostgreSQL was selected as the primary database system, a powerful and open-source choice.
* **Management Tools**: **pgAdmin** was used as the main graphical interface for database management, while **Visual Studio Code (VS Code)** was chosen as the primary code editor, with the official PostgreSQL extension for seamless integration.
* **Data Source**: The "Bike Store Sample Database" from Kaggle was selected. This dataset is ideal for its relational structure, which includes multiple interconnected tables such as `orders`, `products`, and `stores`.

---

## 2. Database Schema and Object Creation

The core of the project began with defining the database structure.

* **Schema Design**: A detailed schema was created to reflect the relationships within the dataset. Tables were designed with appropriate data types and were linked using **Primary Keys** and **Foreign Keys** to enforce referential integrity.
* **Table Creation Scripts**: SQL scripts were written to create all necessary tables, ensuring the correct order of creation to satisfy foreign key constraints.

---

## 3. Data Ingestion and Integrity Validation

A critical part of the process was the reliable ingestion of data from CSV files while maintaining data integrity.

* **Initial Import Attempt**: The standard `COPY` command was initially used for data import. This method was abandoned due to its server-side nature, which prevented direct access to local files, resulting in a `No such file or directory` error.
* **Revised Import Strategy**: A client-side approach using the `\copy` command, executed via the `psql` terminal, was adopted. This method successfully read files from the local machine and loaded the data into the database.
* **Data Integrity Challenges**: During the import of `order_items.csv`, a **foreign key constraint violation** was encountered. This error occurred because some `order_id` values in `order_items` did not have a corresponding entry in the `orders` table. This problem was a direct result of prior data cleaning, which removed rows with null values from the `orders` table.
* **Automated Data Cleaning Script**: A Python script was developed to resolve the integrity issue. Using the **pandas** library, this script automates the validation process:
    * It reads both the `orders` and `order_items` CSV files.
    * It identifies and removes any line in `order_items` where the `order_id` does not exist in the `orders` file.
    * It generates a new, clean CSV file that is guaranteed to be valid for import.
    * The script includes **real-time progress feedback** using the `tqdm` library, making the process transparent and user-friendly.

---

## 4. Development of Procedures and Functions

With the database populated and the data validated, the project advanced to creating reusable code blocks for recurring tasks and complex calculations.

* **Function Development**: A PostgreSQL function named `get_order_total_revenue` was created. This function encapsulates the logic for calculating the total revenue of a single order, including discounts. It ensures data consistency and reusability across different reports and queries.
* **Best Practices**: The function was developed following best practices, using descriptive naming conventions for variables and parameters (`p_order_id`, `v_total_revenue`) to enhance code readability.
* **Final SQL Queries**: Several queries were built to showcase how to use the function and join multiple tables to generate insightful reports, such as a summary of total sales, revenue, and discounts by product.

---

## 5. Performance Analysis and Optimization

This phase focused on understanding and improving query performance.

* **Identifying Inefficiencies**: A key learning was that what appears to be a "slow" query on a small database may not actually be inefficient due to the low volume of data. For a query filtering high-spending customers, the in-practice performance of a subquery was deceptively fast.
* **The Theory of Optimization**: Despite the small data size, the query was refactored from an inefficient correlated subquery to an optimized version using **`JOINs`** and a **`HAVING`** clause. This serves as a crucial exercise, demonstrating the **best practice** for building queries that scale.
* **Conclusion**: While the optimized query did not show a major performance gain on this small dataset, the exercise highlights the importance of writing scalable queries. This prepares the solution to handle future growth and large-scale data without requiring a full refactor. The analysis of `EXPLAIN ANALYZE` also confirmed that the PostgreSQL query planner, for small tables, correctly chose a `Sequential Scan` over an `Index Scan` as the most efficient method.

---

## 6. Next Steps

With the core functions and reports established, the project is ready to move into final automation and visualization. Future tasks will include:

* Creating scripts for data migration and scheduled management reports.
* Building insightful reports and dashboards using tools like Power BI.