
-- Use the `ref` function to select from other models

{{ config(materialized='table') }}

select *
from {{ ref('model_raw') }}
where "STATUS" = 'completed'
