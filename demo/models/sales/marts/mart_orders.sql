
-- Use the `ref` function to select from other models

{{ config(materialized='table') }}

select customer_id,
       full_name,
       count(*) as total_orders
from {{ ref('stg_customers') }}
left join {{ ref('stg_orders') }}
on {{ ref('stg_orders') }}.user_id = {{ ref('stg_customers') }}.customer_id
group by customer_id, full_name
