-- 1. 🚻 What is the gender-wise customer distribution?
SELECT gender AS customer_gender, COUNT(*) AS customer_count
FROM walmart
GROUP BY customer_gender;

-- 2. 🛒 Which product category contributes the most to overall sales revenue?
SELECT product_line AS category, ROUND(SUM(total), 2) AS total_sales
FROM walmart
GROUP BY product_line
ORDER BY total_sales DESC;

-- 3. 🏙️ Which city generates the highest income?
SELECT city AS region, ROUND(SUM(total), 2) AS revenue_generated
FROM walmart
GROUP BY region
ORDER BY revenue_generated DESC
LIMIT 1;

-- 4. 📊 Monthly sales trend: How does revenue vary by month?
SELECT TO_CHAR(date, 'YYYY-MM') AS month_year, ROUND(SUM(total), 2) AS monthly_sales
FROM walmart
GROUP BY month_year
ORDER BY month_year;

-- 5. 🧾 Average revenue per transaction
SELECT ROUND(AVG(total), 2) AS mean_invoice_total
FROM walmart;

-- 6. 🏷️ Unit pricing analysis: Which category has the highest average unit cost?
SELECT product_line AS category, ROUND(AVG(unit_price), 2) AS mean_unit_price
FROM walmart
GROUP BY category
ORDER BY mean_unit_price DESC;

-- 7. 💼 How do sales vary across customer types?
SELECT customer_type, ROUND(SUM(total), 2) AS revenue_by_type
FROM walmart
GROUP BY customer_type;

-- 8. 🔁 What are the most used payment options in each branch?
WITH payment_stats AS (
  SELECT branch_code, payment, COUNT(*) AS payment_count,
         RANK() OVER(PARTITION BY branch_code ORDER BY COUNT(*) DESC) AS payment_rank
  FROM walmart
  GROUP BY branch_code, payment
)
SELECT branch_code, payment, payment_count
FROM payment_stats
WHERE payment_rank = 1;

-- 9. 🧩 What are the high-performing product lines per branch?
WITH avg_scores AS (
  SELECT branch, product_line, ROUND(AVG(rating), 2) AS rating_avg,
         RANK() OVER(PARTITION BY branch ORDER BY AVG(rating) DESC) AS rank_val
  FROM walmart
  GROUP BY branch, product_line
)
SELECT branch, product_line AS top_category, rating_avg
FROM avg_scores
WHERE rank_val = 1;

-- 10. ⏰ When do people spend the most? (Revenue by hour of day)
SELECT EXTRACT(HOUR FROM time) AS transaction_hour, SUM(total) AS hourly_revenue
FROM walmart
GROUP BY transaction_hour
ORDER BY hourly_revenue DESC;

-- 11. 🌍 Which weekdays have peak sales volumes?
SELECT TO_CHAR(date, 'Day') AS weekday, ROUND(SUM(total), 2) AS weekday_sales
FROM walmart
GROUP BY weekday
ORDER BY weekday_sales DESC;

-- 12. 📦 Profit analysis by product line
SELECT product_line, ROUND(SUM(total * profit_margin), 2) AS estimated_profit
FROM walmart
GROUP BY product_line
ORDER BY estimated_profit DESC;

-- 13. 🎯 Highest quantity sold by branch
SELECT branch AS store, SUM(quantity) AS total_units_sold
FROM walmart
GROUP BY store
ORDER BY total_units_sold DESC;

-- 14. 🔀 Compare performance between years (YoY drop in revenue)
WITH yr_2022 AS (
  SELECT branch, SUM(total) AS rev_2022
  FROM walmart
  WHERE EXTRACT(YEAR FROM date) = 2022
  GROUP BY branch
),
yr_2023 AS (
  SELECT branch, SUM(total) AS rev_2023
  FROM walmart
  WHERE EXTRACT(YEAR FROM date) = 2023
  GROUP BY branch
)
SELECT y22.branch,
       y22.rev_2022,
       y23.rev_2023,
       ROUND(((y22.rev_2022 - y23.rev_2023) / y22.rev_2022) * 100, 2) AS decline_percent
FROM yr_2022 y22
JOIN yr_2023 y23 ON y22.branch = y23.branch
WHERE y23.rev_2023 < y22.rev_2022
ORDER BY decline_percent DESC
LIMIT 5;

-- 15. 📈 Revenue contribution of each payment method
SELECT payment, ROUND(SUM(total), 2) AS payment_revenue
FROM walmart
GROUP BY payment
ORDER BY payment_revenue DESC;

-- 16. 🏷️ Which product lines show highest fluctuation in quantity?
SELECT product_line, STDDEV(quantity) AS qty_std_dev
FROM walmart
GROUP BY product_line
ORDER BY qty_std_dev DESC;

-- 17. 💰 Revenue and profit mapping by city and product category
SELECT city, product_line,
       ROUND(SUM(total), 2) AS revenue,
       ROUND(SUM(total * profit_margin), 2) AS profit
FROM walmart
GROUP BY city, product_line
ORDER BY city;

-- 18. ⭐ Rating range across all cities and categories
SELECT city, product_line,
       MIN(rating) AS min_rating,
       MAX(rating) AS max_rating,
       ROUND(AVG(rating), 2) AS avg_rating
FROM walmart
GROUP BY city, product_line;

-- 19. 🧍‍♂️ Customer-type breakdown by gender
SELECT gender, customer_type, COUNT(*) AS count
FROM walmart
GROUP BY gender, customer_type;

-- 20. 🏬 Category-wise performance in each store
SELECT branch, product_line, ROUND(SUM(total), 2) AS store_category_revenue
FROM walmart
GROUP BY branch, product_line
ORDER BY branch, store_category_revenue DESC;
