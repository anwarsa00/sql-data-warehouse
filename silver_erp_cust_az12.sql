SELECT * 
FROM bronze.erp_cust_az12;

SELECT DISTINCT
    bdate
FROM bronze.erp_cust_az12
WHERE bdate < '1924-01-01' OR bdate > GETDATE() ;


SELECT DISTINCT gen
FROM bronze.erp_cust_az12