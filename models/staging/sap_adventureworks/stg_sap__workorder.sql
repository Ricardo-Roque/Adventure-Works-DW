with 
    fonte_workorder as (
        select
            cast(workorderid as int) as work_order_id						
            , cast(productid as int) as id_product						
            , cast(orderqty as int) as order_qty						
            , cast(scrappedqty as int) as scrapped_qty						
            , cast(startdate as string) as start_date						
            , cast(enddate as string) as end_date						
            , cast(duedate as string) as due_date						
            , cast(scrapreasonid as int) as scrap_reason_id						
            , cast(modifieddate as string) as modified_date
        from {{ source('sap', 'workorder') }}
    )
select*
from fonte_workorder
