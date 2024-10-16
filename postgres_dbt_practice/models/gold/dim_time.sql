{{ config(
    materialized='table'
) }}

SELECT *
FROM {{ ref('silver_time') }} -- Reference the time dimension from silver
ORDER BY date_day