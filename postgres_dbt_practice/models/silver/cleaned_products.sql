{{ config(
    materialized='view'
) }}

WITH cleaned_products AS (
    SELECT 
        product_id, 
        product_name, 
        category, 
        price, 
        brand
    FROM {{ source('bronze', 'products') }}
    WHERE price > 0 -- Ensure price is valid
)

SELECT * 
FROM cleaned_products