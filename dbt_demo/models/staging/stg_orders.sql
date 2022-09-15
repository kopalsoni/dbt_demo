{{ config(materialized='incremental') }}

with source as (

    {#-
    Normally we would select from the table here, but we are using seeds to load
    our data in this project
    #}
    select id,user_id,order_date,status
     from {{ ref('raw_orders') }}

),

renamed as (

    select
        id as order_id,
        user_id as customer_id,
        order_date,
        status

    from source

)

select order_id,customer_id,order_date,status
        , {{ var('last_updated') }}
         from renamed od


{% if is_incremental() %}
    where od.order_date > (select max(order_date) from {{ this }})
{% endif %}





