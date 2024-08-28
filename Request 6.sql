/*Generate a report which contains the top 5 customers who received an 
average high pre_invoice_discount_pct  for the fiscal year 2021 and in the 
Indian market. */

SELECT 
    c.customer_code,
    c.customer,
    ROUND(AVG(d.pre_invoice_discount_pct),2) AS avg_discount_pct
FROM
    dim_customer c
        JOIN
    fact_pre_invoice_deductions d USING (customer_code)
WHERE
    c.market = 'India'
        AND d.fiscal_year = 2021
GROUP BY c.customer_code , c.customer
ORDER BY avg_discount_pct DESC
LIMIT 5
