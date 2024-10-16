{{ config(
    materialized='view'
) }}

WITH cleaned_sales AS (
    SELECT 
        sale_id, 
        product_id, 
        customer_id, 
        store_id, 
        sale_date, 
        quantity, 
        total_amount, 
        discount_applied
    FROM {{ source('bronze', 'sales') }}
    WHERE sale_date IS NOT NULL -- Remove invalid sale dates
)

SELECT * 
FROM cleaned_sales