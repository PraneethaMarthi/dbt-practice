{{ config(
    materialized='table'
) }}

WITH sales_agg AS (
    SELECT 
        store_id,
        COUNT(sale_id) AS total_sales_count,
        SUM(total_amount) AS total_revenue,
        AVG(total_amount) AS avg_sales_value
    FROM {{ ref('fact_sales') }} -- Reference the fact sales table in gold
    GROUP BY store_id
)

SELECT 
    sa.store_id,
    st.store_name,
    sa.total_sales_count,
    sa.total_revenue,
    sa.avg_sales_value
FROM sales_agg sa
JOIN {{ ref('dim_stores') }} st
ON sa.store_id = st.store_id