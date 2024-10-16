{{ config(
    materialized='table'
) }}

SELECT 
    product_id, 
    product_name, 
    category, 
    price, 
    brand
FROM {{ ref('cleaned_products') }} -- Reference the cleaned silver view
ORDER BY price DESC