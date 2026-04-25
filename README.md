# 📊 Data Warehouse Project

## 📌 Project Overview

This project focuses on building a Data Warehouse using SQL.

The goal is to transform raw data into clean, structured, and reliable data that can be used later for reporting and analysis.

---

## 🏗️ Data Architecture

The project follows the Medallion Architecture:

* **Bronze Layer** → Raw data (no changes)
* **Silver Layer** → Cleaned and standardized data
* **Gold Layer** → Business-ready data

---

## 🗂️ Data Model

The project is built using a star schema:

* **Customers**
* **Products**
* **Sales (Fact Table)**

Relationships:

* Sales → Customers (customer_key)
* Sales → Products (product_key)

---

## ⚙️ ETL Process

The data flows through three main stages:

1. Load raw data into Bronze layer
2. Clean and transform data in Silver layer
3. Build analytical tables in Gold layer

---

## 🧪 Data Quality Checks

Data quality checks were applied to ensure clean and reliable data:

* No duplicate or null IDs
* No unwanted spaces in text
* Valid numeric values (no negatives)
* Valid dates
* Data consistency checks

Files:

* `tests/silver/quality_checks_silver_layer.sql`
* `tests/gold/quality_checks_gold_layer.sql`

---

## 🛠️ Tools Used

* SQL Server
* GitHub

---

## 📁 Project Structure

```bash
data-warehouse-project/
│
├── datasets/
├── docs/
├── scripts/
│   ├── bronze/
│   ├── silver/
│   └── gold/
├── tests/
│   ├── silver/
│   └── gold/
├── README.md
```

---

## 🚀 Next Step

Power BI dashboard will be added to visualize the data and provide insights.

---
