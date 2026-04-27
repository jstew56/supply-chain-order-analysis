/* ============================================================
Project: Supply Chain Revenue & Operations Analysis
Author: Jessica Stewart
Tool: Snowflake SQL

Business Objective:
Analyze total revenue by customer segment to understand
which segments contribute the most to overall revenue.

Dataset:
- F_ORD_SALES (Fact Table)
- D_CUS_MASTER (Customer Dimension)

============================================================ */

-- Calculate total revenue by customer segment
SELECT 
    d_cus_master.segment AS customer_segment,
    SUM(f_ord_sales.line_total_usd) AS total_revenue
FROM f_ord_sales
JOIN d_cus_master 
    ON d_cus_master.customer_key = f_ord_sales.customer_key
GROUP BY customer_segment
ORDER BY total_revenue DESC;

-- Insight:
-- This query identifies the highest revenue-generating customer segments,
-- helping businesses prioritize marketing, sales, and retention strategies.
