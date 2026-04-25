/*
========================================
Silver Layer Quality Checks
========================================
Purpose:
Check data before moving to Gold layer.

Checks:
- No duplicate or null IDs
- Clean text (no extra spaces)
- Valid values (no negatives)
- Correct dates
- Data consistency

Note:
If any result appears → fix the data
========================================
*/

-- ===============================
-- Customers Table
-- ===============================

-- Check duplicate or null ID
SELECT 
    cst_id,
    COUNT(*) AS count_rows
FROM silver.crm_cust_info
GROUP BY cst_id
HAVING COUNT(*) > 1 OR cst_id IS NULL;

-- Check spaces in text
SELECT 
    cst_key
FROM silver.crm_cust_info
WHERE cst_key != TRIM(cst_key);

-- Check values (quick look)
SELECT DISTINCT 
    cst_marital_status
FROM silver.crm_cust_info;


-- ===============================
-- Products Table
-- ===============================

-- Check duplicate or null ID
SELECT 
    prd_id,
    COUNT(*) AS count_rows
FROM silver.crm_prd_info
GROUP BY prd_id
HAVING COUNT(*) > 1 OR prd_id IS NULL;

-- Check spaces
SELECT 
    prd_nm
FROM silver.crm_prd_info
WHERE prd_nm != TRIM(prd_nm);

-- Check cost
SELECT 
    prd_cost
FROM silver.crm_prd_info
WHERE prd_cost < 0 OR prd_cost IS NULL;

-- Check categories
SELECT DISTINCT 
    prd_line
FROM silver.crm_prd_info;

-- Check dates
SELECT *
FROM silver.crm_prd_info
WHERE prd_end_dt < prd_start_dt;


-- ===============================
-- Sales Table
-- ===============================

-- Check invalid dates
SELECT 
    sls_due_dt
FROM silver.crm_sales_details
WHERE sls_due_dt <= 0 
   OR LEN(sls_due_dt) != 8;

-- Check order dates
SELECT *
FROM silver.crm_sales_details
WHERE sls_order_dt > sls_ship_dt 
   OR sls_order_dt > sls_due_dt;

-- Check sales calculation
SELECT 
    sls_sales,
    sls_quantity,
    sls_price
FROM silver.crm_sales_details
WHERE sls_sales != sls_quantity * sls_price
   OR sls_sales IS NULL 
   OR sls_quantity IS NULL 
   OR sls_price IS NULL;


-- ===============================
-- ERP Customers
-- ===============================

-- Check birthdate range
SELECT 
    bdate
FROM silver.erp_cust_az12
WHERE bdate < '1924-01-01' 
   OR bdate > GETDATE();

-- Check gender values
SELECT DISTINCT 
    gen
FROM silver.erp_cust_az12;


-- ===============================
-- Locations
-- ===============================

-- Check country values
SELECT DISTINCT 
    cntry
FROM silver.erp_loc_a101;


-- ===============================
-- Product Categories
-- ===============================

-- Check spaces
SELECT *
FROM silver.erp_px_cat_g1v2
WHERE cat != TRIM(cat) 
   OR subcat != TRIM(subcat) 
   OR maintenance != TRIM(maintenance);

-- Check values
SELECT DISTINCT 
    maintenance
FROM silver.erp_px_cat_g1v2;
