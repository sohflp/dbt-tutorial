
-- Use the `ref` function to select from other models

{{ config(materialized='table') }}

{% set payment_methods = ["bank_transfer", "credit_card", "coupon", "gift_card"] %}

select customer_id,
       full_name,
       count(*) as total_orders,
       {% for payment_method in payment_methods %}
       sum(case when payment_method = '{{payment_method}}' then amount end) as {{payment_method}}_amount,
       {% endfor %}
       sum(amount) as total_amount
from {{ ref('stg_customers') }}
left join {{ ref('stg_orders') }}
on {{ ref('stg_orders') }}.user_id = {{ ref('stg_customers') }}.customer_id
left join {{ ref('stg_payments') }}
on {{ ref('stg_payments') }}.order_id = {{ ref('stg_orders') }}.id
group by customer_id, full_name
