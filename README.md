🛒 Zepto E-commerce SQL Data Analysis Project

This is my complete SQL Data Analyst Portfolio Project, built using a real-world e-commerce inventory dataset inspired by Zepto — one of India’s fastest-growing quick-commerce companies.

The project represents how a real data analyst works with messy inventory data, cleans it, explores business metrics, and generates insights using pure SQL.

This project is perfect for:

📊 Showcasing SQL skills in your portfolio

🧪 Practicing Exploratory Data Analysis (EDA)

💼 Applying for Data Analyst / Python Analyst / Business Analyst roles

🛍 Understanding e-commerce data structures

📌 Project Overview

This project covers the end-to-end workflow used in real analytics roles:

✔️ Database Setup

Created a PostgreSQL table to store SKU-level data — including pricing, stock availability, weights, discounts, and categories.

✔️ Exploratory Data Analysis

Performed row counts, category grouping, stock comparison, null value checks, and duplicate product detection.

✔️ Data Cleaning

Handled missing values, removed invalid entries, and converted price values from paise to rupees.

✔️ Business Insight Queries

Analyzed discount patterns, price-per-gram value, revenue potential, category performance, and high-MRP stock issues.

📁 Dataset

Dataset: Zepto inventory (SKU-level data)
Source: Public open dataset inspired by Zepto catalogue
Format: CSV

Columns:

sku_id

name

category

mrp

discountPercent

discountedSellingPrice

availableQuantity

weightInGms

outOfStock

quantity

📚 Database & Table Creation
CREATE TABLE zepto (
  sku_id SERIAL PRIMARY KEY,
  category VARCHAR(120),
  name VARCHAR(150) NOT NULL,
  mrp NUMERIC(8,2),
  discountPercent NUMERIC(5,2),
  availableQuantity INTEGER,
  discountedSellingPrice NUMERIC(8,2),
  weightInGms INTEGER,
  outOfStock BOOLEAN,
  quantity INTEGER
);

📥 Data Import

CSV imported using pgAdmin:

\copy zepto(category,name,mrp,discountPercent,availableQuantity,
            discountedSellingPrice,weightInGms,outOfStock,quantity)
FROM 'data/zepto_v2.csv'
WITH (FORMAT csv, HEADER true, DELIMITER ',', QUOTE '"', ENCODING 'UTF8');


If encoding error occurs → save file again as CSV UTF-8.

🔍 Data Exploration (EDA)

✔ Total rows
✔ Unique categories
✔ Out-of-stock analysis
✔ Null value detection
✔ Duplicate product check
✔ Summary statistics

🧹 Data Cleaning

✔ Removed rows with zero MRP or invalid values
✔ Converted mrp & selling price from paise → rupees
✔ Checked inconsistencies in weight
✔ Normalized boolean values

📊 Business Insight Queries

✔ Top 10 highest-discount SKUs
✔ Most expensive items currently out of stock
✔ Category-wise potential inventory revenue
✔ Least discount on high-MRP products
✔ Price-per-gram value analysis
✔ Category discount ranking
✔ Inventory weight segment analysis

⚙️ How to Use

Clone the repo:

git clone https://github.com/adityajaiswal25/Zepto_Inventory_SQL_Data_Analysis
cd Zepto_Inventory_SQL_Data_Analysis


Run the SQL files inside the /sql folder:

create_tables.sql

cleaning.sql

analysis_queries.sql

Import the CSV inside /data folder into PostgreSQL.

Run analysis queries to explore insights.

🧑‍💻 About Me

I’m Aditya Jaiswal — an aspiring  Python Developer who enjoys working with SQL, Python, cloud tools, and real-world datasets.

This project is part of my learning journey and portfolio building.

📬 Connect with Me

LinkedIn: https://www.linkedin.com/in/adityajaiswal25

GitHub: https://github.com/adityajaiswal25
<your-username>

⭐ Support

If you found this useful, feel free to star ⭐ the repo!
