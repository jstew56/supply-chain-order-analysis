/* ============================================================
Project: Supply Chain Order Analysis
Tool: SQL (Star Schema Join)
Author: Jessica Stewart

Business Objective:
Return a list of customers who have placed orders, including
customer details, order information, product data, and supplier details.

Schema Structure:
- D_CUS_MASTER (Customer Dimension)
- F_ORD_SALES (Sales Fact Table)
- D_PRD_CATALOG (Product Dimension)
- D_SUP_SUPPLIER (Supplier Dimension)
============================================================ */

SELECT 
    d_cus_master.customer_key,
    d_cus_master.cus_name,
    d_cus_master.cus_code,
    d_cus_master.loyalty_tier,
    d_cus_master.segment,
    f_ord_sales.ord_id,
    f_ord_sales.order_date,
    f_ord_sales.product_key,
    d_prd_catalog.prd_name AS product_name,
    d_sup_supplier.sup_name AS supplier_name,
    f_ord_sales.line_total_usd AS order_amount_usd
FROM d_cus_master
INNER JOIN f_ord_sales 
    ON d_cus_master.customer_key = f_ord_sales.customer_key
INNER JOIN d_prd_catalog 
    ON d_prd_catalog.product_key = f_ord_sales.product_key
INNER JOIN d_sup_supplier 
    ON d_sup_supplier.supplier_key = f_ord_sales.supplier_key;

-- Key Insight:
-- This query joins dimension and fact tables in a star schema
-- to produce a full customer-order-product-supplier view.
