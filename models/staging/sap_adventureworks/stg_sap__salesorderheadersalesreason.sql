with 
    fonte_sales_order_header_sales_reason as (
        select 
            cast(salesorderid as int) as sales_order_id						
            , cast(salesreasonid as int) as sales_reason_id						
            , cast(modifieddate as string) as modified_date
        from {{ source('sap', 'salesorderheadersalesreason') }}
    )
select *
from fonte_sales_order_header_sales_reason