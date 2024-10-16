{{ config(
    materialized='view'
) }}

WITH cleaned_customers AS (
    SELECT 
        customer_id, 
        first_name, 
        last_name, 
        email, 
        membership_status
    FROM {{ source('bronze', 'customers') }}
    WHERE email IS NOT NULL -- Ensure email is present
)

SELECT * 
FROM cleaned_customers