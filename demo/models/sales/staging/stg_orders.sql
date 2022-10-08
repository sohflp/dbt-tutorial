
/*
    Welcome to your first dbt model!
    Did you know that you can also configure models directly within SQL files?
    This will override configurations stated in dbt_project.yml

    Try changing "table" to "view" below
*/

with source_data as (

    select "ID" as id,
           "USER_ID" as user_id,
           "STATUS" as status
      from {{ source('raw', 'orders') }}
     where "STATUS" = 'completed'

)

select *
from source_data

/*
    Uncomment the line below to remove records with null `id` values
*/

-- where id is not null
