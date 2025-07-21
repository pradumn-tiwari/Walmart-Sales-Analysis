## 📊 Dataset Overview

The `Walmart_Dataset.csv` file contains simulated transactional data across multiple Walmart branches. This dataset is ideal for analyzing sales performance, customer behavior, product trends, and revenue breakdowns.

### 🔧 General Info

- 📈 **Total Records:** ~10,000+
- 🏬 **Branches Covered:** 3 (A, B, C)
- 🧑‍🤝‍🧑 **Customer Genders:** Male, Female
- 💳 **Payment Types:** Cash, Credit Card, Ewallet
- 📍 **Cities:** Yangon, Naypyitaw, Mandalay

---

### 🧾 Column-wise Description

| Column Name   | Description                                                                 |
|---------------|-----------------------------------------------------------------------------|
| `Invoice ID`  | Unique transaction ID                                                       |
| `Branch`      | Branch where the transaction occurred (A, B, C)                             |
| `City`        | City corresponding to the branch                                            |
| `Customer Type` | Type of customer (e.g., Member or Normal)                                 |
| `Gender`      | Gender of the customer                                                      |
| `Product Line`| Category of the product purchased                                           |
| `Unit Price`  | Price per item                                                              |
| `Quantity`    | Number of items purchased                                                   |
| `Tax 5%`      | 5% tax applied to the transaction                                           |
| `Total`       | Total transaction value = (Unit Price × Quantity) + Tax                     |
| `Date`        | Date of transaction                                                         |
| `Time`        | Time of transaction                                                         |
| `Payment`     | Mode of payment (e.g., Cash, Credit Card, Ewallet)                          |
| `COGS`        | Cost of goods sold                                                          |
| `Gross Margin %` | Gross margin percentage (typically fixed at 4.761905%)                   |
| `Gross Income`| Profit earned per transaction                                               |
| `Rating`      | Customer rating of the experience (scale: 1–10)                             |

---

### 🧠 Potential Use Cases

- Branch-level revenue performance analysis
- Product category popularity and seasonality
- Payment method distribution
- Customer behavior segmentation (e.g., gender-based, membership status)
- Sales trends over time (day/week/month)
- Peak hours and time-of-day insights
- Correlation of rating with payment methods or total spend

---



