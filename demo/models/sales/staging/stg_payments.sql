
/*
    Welcome to your first dbt model!
    Did you know that you can also configure models directly within SQL files?
    This will override configurations stated in dbt_project.yml

    Try changing "table" to "view" below
*/

with source_data as (

    select "ORDERID" as order_id,
           "PAYMENTMETHOD" as payment_method,
           "AMOUNT" as amount,
           "CREATED" as created
      from {{ source('raw', 'payments') }}
     where "STATUS" = 'success'

)

select *
from source_data

/*
    Uncomment the line below to remove records with null `id` values
*/

-- where id is not null
