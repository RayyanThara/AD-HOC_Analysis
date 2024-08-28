/* Get the Top 3 products in each division that have a high 
total_sold_quantity in the fiscal_year 2021? */

WITH cte AS
(SELECT 
    division,
    product_code,
    product,
    SUM(sold_quantity) AS total_sold_quantity
FROM
    dim_product p
        JOIN
    fact_sales_monthly s USING (product_code)
WHERE
    fiscal_year = 2021
GROUP BY division , product_code , product)
,
	cte2 AS
(SELECT
*, RANK() OVER(PARTITION BY division ORDER BY total_sold_quantity DESC) AS rankk
FROM cte)

SELECT 
    *
FROM
    cte2
WHERE
    rankk <= 3