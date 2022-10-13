
-- Use the `ref` function to select from other models

{{ config(materialized='table') }}

{% set payment_methods = ["coupon", "bank_transfer", "credit_card", "gift_card"] %}

with source_data as (

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

)

-- Convert $ amount based on a macro
select  customer_id,
        full_name,
        total_orders,
        {% for payment_method in payment_methods %}
        {{ cents_to_dollars(payment_method + '_amount') }} as {{payment_method}}_amount,
        {% endfor %}
        {{ cents_to_dollars('total_amount') }} as total_amount
  from  source_data
