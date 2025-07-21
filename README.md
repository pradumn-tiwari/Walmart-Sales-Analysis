# 📊 Walmart Sales Analysis

This project analyzes transactional data from Walmart to uncover key business insights related to sales trends, branch performance, product demand, customer behavior, and more.

---
## 🔍 Key Analysis Performed

### ✅ Data Cleaning
- Removed null values from `unit_price` and `quantity`
- Converted `unit_price` to numeric (removed currency symbols)
- Final dataset: **9969 records** (0.81% data loss)

### ✅ Data Manipulation
- Created derived fields:
  - `total = unit_price × quantity`
  - `time_of_day` (morning, afternoon, evening)
  - `month` extracted from `date`

### ✅ Exploratory Data Analysis (EDA)
- **Branch Performance:** Identified top-selling branches
- **Category Analysis:** Most frequently sold product categories
- **City-Level Sales:** Revenue patterns across different cities
- **Monthly Trends:** Time-series sales analysis per branch
- **Payment Methods:** Most popular payment types used
- **Customer Ratings:** Average feedback by branch
- **Time of Day:** Peak periods for customer activity
- **Price vs Quantity:** Relationship between pricing and demand
- **Average Invoice Value:** Mean total sales per transaction

---

## 📈 Visualizations

Visualized insights using:
- `matplotlib`
- `seaborn`
- Line plots, bar charts, facet grids, area plots, and more

---
## ⚙️ Automated the data pipeline
Using Kaggle API and SQLAlchemy, reducing manual data handling time by over 70% and streamlining dataset ingestion for reproducible analysis.
