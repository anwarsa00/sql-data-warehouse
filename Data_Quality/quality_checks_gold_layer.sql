/*
========================================
Gold Layer Quality Checks
========================================
Purpose:
Check data quality before using it in reports.

Checks:
- No duplicate keys in dimensions
- All fact records linked to dimensions

Note:
If any result appears → there is a data issue
========================================
*/

-- ===============================
-- Check Customers Table
-- ===============================
-- No duplicate customer_key

SELECT 
    customer_key,
    COUNT(*) AS count_rows
FROM gold.dim_customers
GROUP BY customer_key
HAVING COUNT(*) > 1;


-- ===============================
-- Check Products Table
-- ===============================
-- No duplicate product_key

SELECT 
    product_key,
    COUNT(*) AS count_rows
FROM gold.dim_products
GROUP BY product_key
HAVING COUNT(*) > 1;


-- ===============================
-- Check Fact Table Links
-- ===============================
-- All records should match customer & product

SELECT 
    f.*
FROM gold.fact_sales f
LEFT JOIN gold.dim_customers c
    ON f.customer_key = c.customer_key
LEFT JOIN gold.dim_products p
    ON f.product_key = p.product_key
WHERE c.customer_key IS NULL 
   OR p.product_key IS NULL;
