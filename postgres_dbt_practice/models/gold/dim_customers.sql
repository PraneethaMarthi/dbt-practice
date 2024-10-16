{{ config(
    materialized='table'
) }}

SELECT 
    customer_id, 
    first_name, 
    last_name, 
    email, 
    membership_status
FROM {{ ref('cleaned_customers') }} -- Reference the cleaned silver view
ORDER BY customer_id