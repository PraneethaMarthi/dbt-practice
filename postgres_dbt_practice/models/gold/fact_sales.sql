{{ config(
    materialized='table'
) }}

SELECT 
    sale_id, 
    product_id, 
    customer_id, 
    store_id, 
    sale_date, 
    quantity, 
    total_amount, 
    discount_applied
FROM {{ ref('cleaned_sales') }} -- Reference the cleaned silver view
ORDER BY sale_date