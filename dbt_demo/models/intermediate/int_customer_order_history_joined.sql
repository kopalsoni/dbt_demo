with cte_order as (
    
    SELECT o.customer_id
    , min(o.order_date) as first_order
    , max(o.order_date) as most_recent_order
    , count(o.order_id) as number_of_orders
    from {{ source('int_base_tables', 'stg_orders') }} o
    group by o.customer_id
),
cte_customer as (
    select customer_id, first_name, last_name
    from {{ source('int_base_tables','stg_customers') }}
),
join_customer_orders as (
    select c.customer_id
    , c.first_name
    , c.last_name
    , o.first_order
    , o.most_recent_order
    , case when most_recent_order <= '2018-01-15' then 'Churned'
            when most_recent_order <= '2018-03-01' then 'Churn risk'
            else 'Healthy'
        end as customer_status
    , o.number_of_orders

    from cte_customer c
    join cte_order o
    on o.customer_id = c.customer_id
)

select customer_id, first_name, last_name, first_order, most_recent_order, customer_status, number_of_orders
 from join_customer_orders





