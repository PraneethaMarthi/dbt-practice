{{ config(
    materialized='view'
) }}

WITH cleaned_stores AS (
    SELECT 
        store_id, 
        store_name, 
        city, 
        state, 
        zip_code, 
        manager_name
    FROM {{ source('bronze', 'stores') }}
    WHERE store_id IS NOT NULL -- Ensure valid stores
)

SELECT * 
FROM cleaned_stores