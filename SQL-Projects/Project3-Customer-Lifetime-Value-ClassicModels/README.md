# Customer Lifetime Value (CLV) using ClassicModels  

## 📌 Project Overview  
This project focuses on computing **Customer Lifetime Value (CLV)** using the **ClassicModels** sample database in MySQL.  
CLV is an important business metric that estimates the total revenue a company can expect from a customer throughout their relationship.  

By writing SQL queries, I explored and analyzed customer purchases, transactions, revenues, and profitability to calculate CLV.  

---

## 🛠️ Tech Stack  
- **Database:** MySQL  
- **Dataset:** ClassicModels (sample dataset)  
- **Tool:** MySQL Workbench  

---

## 🎯 Objectives  
- Explore customer purchasing behavior using SQL.  
- Compute total revenue from orders and payments.  
- Calculate average purchase value, purchase frequency, and customer lifespan.  
- Derive Customer Lifetime Value (CLV).  
- Apply business rules such as **Gross Margin** and **Customer Acquisition Cost (CAC)**.  

---

## 📂 Project Structure  
- `mysqlsampledatabase.sql`→ Classicmodel sample dataset file
- `project_queries.sql`→ SQL queries for revenue, transactions, average purchase value, and CLV.
- `README.md`→ Project documentation  

---

## 📊 CLV Formula  
The final formula used to compute CLV is:  


CLV = (Average Purchase Value * Purchase Frequency * Gross Margin * times Average Customer Lifespan) - CAC


---

## 📥 Setting Up the Database  
To set up the **ClassicModels** database:  

1. Open **MySQL Workbench** (or your MySQL client).  
2. Run the following in order from the `classicmodels.sql` file:  

   ```sql
   -- Step 1: Create the database
   CREATE DATABASE IF NOT EXISTS classicmodels;

   -- Step 2: Switch to the database
   USE classicmodels;

   -- Step 3: Create the tables
   -- (Run all CREATE TABLE statements from the file)

   -- Step 4: Insert sample data
   -- (Run all INSERT statements from the file)
   
  ---

  ## 🚀 How to Run  
- After setting up the database using the above steps, just run **project_queries.sql** to compute the CLV value.  
- Replace placeholder parameters (e.g., `@gross_margin`, `@CAC`) in `queries.sql` to test different scenarios.  

---

## 📖 Learnings  
- Strengthened SQL skills: joins, CTEs, subqueries, and aggregations.  
- Applied business metrics to raw transactional data to compute CLV.  
- Practiced structuring an analytics SQL pipeline for reproducible results.  

---

## 🤝 Connect with Me  
- If you found this project helpful or interesting, let’s connect on [LinkedIn](https://www.linkedin.com/in/sadia-moeed) ✨  



