{{ config(
    materialized = 'table'
) }}

SELECT 
    store_id, 
    store_name, 
    city, 
    state, 
    zip_code, 
    manager_name
FROM {{ ref('cleaned_stores') }}  -- Reference the cleaned silver view
ORDER BY store_id