
with source as (
    
    {#-
    Normally we would select from the table here, but we are using seeds to load
    our data in this project
    #}
    select id,order_id,payment_method,amount from {{ ref('raw_payments') }}

),

renamed as (

    select
        id as payment_id,
        order_id,
        payment_method,

        -- `amount` is currently stored in cents, so we convert it to dollars
        amount / 100 as amount_dollars

    from source

)

select payment_id,
        order_id,
        payment_method,
        amount_dollars
        , {{ var('last_updated') }}
        from renamed