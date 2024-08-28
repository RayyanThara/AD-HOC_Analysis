/* Get the complete report of the Gross sales amount for the customer  “Atliq 
Exclusive”  for each month. This analysis helps to  get an idea of low and 
high-performing months and take strategic decisions. */
SELECT 
    s.date ,
    YEAR(s.date) AS year,
    ROUND(SUM(sold_quantity * gross_price) / 1000000,
                    2) AS gross_sales_amount
FROM
    fact_gross_price g
        JOIN
    fact_sales_monthly s USING (product_code)
        JOIN
    dim_customer c USING (customer_code)
WHERE
    customer = 'atliq exclusive'
GROUP BY s.date , year;
