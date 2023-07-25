with 
    sales_order_header_sales_reason as (
        select *
        from {{ ref('stg_sap__salesorderheadersalesreason') }}
    )
    , sales_reason as (
        select *
        from {{ ref('stg_sap__salesreason') }}
    )
    , join_sales_reason as (
        select 
            sales_order_header_sales_reason.sales_order_id					
            , sales_order_header_sales_reason.sales_reason_id	
            , sales_reason.sales_reason						
            , sales_reason.reason_type
        from sales_order_header_sales_reason
        left join sales_reason on sales_order_header_sales_reason.sales_reason_id = sales_reason.sales_reason_id
    )
select *
from join_sales_reason