# Kimia Farma Big Data Analytics

This repository contains the SQL script used to create an analysis table for evaluating Kimia Farma's business performance during the period 2020–2023.  
The project is part of the **Big Data Analytics Virtual Internship Program** by Rakamin Academy.

---

## 📊 Project Overview

The objective of this project is to analyze Kimia Farma's business performance by integrating transaction, product, branch, and inventory data into a single analysis table.  
The resulting table is used as the main data source for performance dashboards in Google Looker Studio.

---

## 🗂 Dataset Used

The analysis table is created by combining the following datasets:

- `kf_final_transaction`
- `kf_product`
- `kf_kantor_cabang`
- `kf_inventory`

All datasets are stored and processed using **Google BigQuery**.

---

## 🏗 Analysis Table

**Table Name:**  
`tabel_analisa_kimia_farma`

**Key Information Included:**
- Transaction details
- Branch and regional information
- Product information
- Business metrics such as:
  - Nett Sales
  - Nett Profit
  - Gross Profit Percentage

The table is designed as a **denormalized table** to simplify analysis and visualization.

---

## 🧮 Business Logic

Gross profit percentage is calculated based on product price range:

| Price Range (IDR) | Gross Profit |
|------------------|--------------|
| ≤ 50,000         | 10%          |
| 50,001 – 100,000 | 15%          |
| 100,001 – 300,000| 20%          |
| 300,001 – 500,000| 25%          |
| > 500,000        | 30%          |

---


---

## 🚀 Tools & Technologies

- Google BigQuery
- SQL
- Google Looker Studio

---

## 👤 Author

**Akbar Nur Rizqi**  
Big Data Analytics Intern  
Rakamin Academy

