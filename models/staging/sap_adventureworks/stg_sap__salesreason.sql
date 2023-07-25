with 
    fonte_sales_reason as (
        select          	
            cast(salesreasonid as int) as sales_reason_id					
            , cast(name as string) as sales_reason						
            , cast(reasontype as string) as reason_type						
            , cast(modifieddate as string) as modified_date
        from {{ source('sap', 'salesreason') }}
    )
select * 
from fonte_sales_reason