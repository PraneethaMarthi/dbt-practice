{{ config(
    materialized='view'
) }}

WITH time_dim AS (
    SELECT 
        date_trunc('day', day::date) AS date_day,
        EXTRACT(year FROM day::date) AS year,
        EXTRACT(month FROM day::date) AS month,
        EXTRACT(day FROM day::date) AS day,
        EXTRACT(quarter FROM day::date) AS quarter
    FROM generate_series('2020-01-01'::date, '2030-12-31'::date, '1 day'::interval) AS day
)

SELECT * 
FROM time_dim