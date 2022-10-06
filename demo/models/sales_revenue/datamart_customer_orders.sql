
-- Use the `ref` function to select from other models

{{ config(materialized='table') }}

select customer_id,
       full_name,
       count(*) as total_orders
from {{ ref('staging_customers_name') }}
left join {{ ref('staging_orders_completed') }}
on {{ ref('staging_orders_completed') }}.user_id = {{ ref('staging_customers_name') }}.customer_id
group by customer_id, full_name
