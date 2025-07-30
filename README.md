# Global-Layoffs-Explorer
Exploratory data analysis of global layoffs using MySQL – cleaning, transforming, and extracting insights.

# LayoffScope – Global Layoffs Exploratory Data Analysis with MySQL

🔍 **LayoffScope** is a full-cycle SQL project that performs exploratory data analysis (EDA) on global layoffs data.  
The goal is to clean, transform, and extract meaningful insights from raw data related to employee layoffs around the world.

---

## 📌 Problem Statement

Due to global economic changes, many companies have laid off thousands of employees in recent years.  
This project seeks to answer questions like:

- Which companies laid off the most employees?
- What industries and countries were most affected?
- In what years and months did layoffs spike?
- How did layoffs evolve over time?

---

## 📊 Project Stages

### 1. 🧹 Data Cleaning
Performed in MySQL using:
- Removing duplicates with `ROW_NUMBER()`
- Trimming whitespace and standardizing values (e.g., "United States." → "United States")
- Handling `NULL` and empty values using `JOIN` and `UPDATE`
- Converting date columns to `DATE` type
- Dropping unnecessary columns

### 2. 📈 Exploratory Data Analysis (EDA)
Key analysis included:
- Total layoffs by company, industry, and country
- Trends over time (by year and month)
- Top companies by layoffs per year using `CTEs` and `DENSE_RANK()`
- Rolling totals to analyze trends month-by-month

---

## ⚙️ Technologies Used

- **MySQL**
- **Window Functions** (`ROW_NUMBER()`, `DENSE_RANK()`)
- **Common Table Expressions (CTEs)**
- **Data Aggregation & Filtering**

---

## 📁 Files in the Project

- `Data_Cleaning.sql` – Cleaning and transforming the raw layoffs dataset  
- `Data_Exploratory.sql` – Performing EDA and generating insights
