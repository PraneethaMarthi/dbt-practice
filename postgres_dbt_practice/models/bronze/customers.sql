-- models/bronze/customers.sql

{{ config(materialized='table') }}

select *
from {{ source('bronze', 'customers') }}
