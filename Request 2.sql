/* What is the percentage of unique product increase in 2021 vs. 2020? */
-- >
WITH upc as
	(SELECT distinct product_code,fiscal_year FROM fact_sales_monthly)
,
	 upc2 as (
SELECT
	 (SELECT count(*) FROM upc WHERE fiscal_year = 2020) as unique_product_count_2020,
     (SELECT count(*) FROM upc WHERE fiscal_year = 2021) as unique_product_count_2021
)
SELECT 
unique_product_count_2020,
unique_product_count_2021, 
round((unique_product_count_2021 - unique_product_count_2020)*100/unique_product_count_2020,2) as pct_chg 
FROM upc2;
