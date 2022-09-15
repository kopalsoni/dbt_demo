{{ config(materialized = 'incremental') }}                  -- to insert new rows without dropping and recreating the table everytime its built

with source as (

    {#-
    Normally we would select from the table here, but we are using seeds to load
    our data in this project
    #}
    select id,first_name,last_name from {{ ref('raw_customers') }}

),

renamed as (

    select
        id as customer_id,
        first_name,
        last_name

    from source

)

select customer_id, first_name, last_name
        , {{ var('last_updated') }} as last_updated
         from renamed r

-- condition to insert, only new ids > existing ids
{% if is_incremental() %}
    where r.customer_id > ( select max(customer_id) from {{ this }})
{% endif %}




