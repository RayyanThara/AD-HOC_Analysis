/* Which segment had the most increase in unique products in 
2021 vs 2020? */
-- >
WITH ProductCounts AS (
    SELECT
        segment,
        SUM(CASE WHEN fiscal_year = 2020 THEN 1 ELSE 0 END) AS product_count_2020,
        SUM(CASE WHEN fiscal_year = 2021 THEN 1 ELSE 0 END) AS product_count_2021
    FROM dim_product
    join fact_gross_price
    using (product_code)
    GROUP BY segment
)
SELECT
    segment,
    product_count_2020,
    product_count_2021,
    (product_count_2021 - product_count_2020) AS difference
FROM ProductCounts
ORDER BY difference DESC