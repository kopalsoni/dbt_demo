{% set payment_methods = ['credit_card', 'coupon', 'bank_transfer', 'gift_card'] %}

with orders as (
    select order_id
    , customer_id
    , order_date
    , status
    from {{ ref('stg_orders') }}
)
, order_payments as (
    select
        order_id,
        {% for payment_method in payment_methods -%}
        sum(case when payment_method = '{{ payment_method }}' then amount_dollars else 0 end) as {{ payment_method }}_amount,
        {% endfor -%}
        
        sum(amount_dollars) as total

    from {{ ref('stg_payments') }}

    group by order_id
)
, final as (
    select
        o.order_id
    , o.customer_id
    , o.order_date
    , o.status, 

    {% for payment_method in payment_methods %}

        op.{{ payment_method }}_amount,
        
        case 
            when {{ payment_method }}_amount is not null then true 
            else false end as had_{{ payment_method }}_payment,
    
    {% endfor -%}


    op.total as amount

    from orders o
    left join order_payments op
        on o.order_id = op.order_id

)

select *  from final





