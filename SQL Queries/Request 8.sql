/* In which quarter of 2020, got the maximum total_sold_quantity? */

SELECT 
    QUARTER(DATE_ADD(date, INTERVAL 4 MONTH)) AS quarter,
    CONCAT(ROUND(SUM(sold_quantity) / 1000000, 2),
            'M') AS total_sold_quantity
FROM
    fact_sales_monthly
WHERE
    fiscal_year = 2020
GROUP BY quarter
ORDER BY total_sold_quantity DESC

