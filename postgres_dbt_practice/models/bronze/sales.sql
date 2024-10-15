{{ config(materialized='table') }}

select *
from {{ source('bronze', 'sales') }}