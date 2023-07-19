with 
    fonte_product_cost_history as (
        select
            cast(productid as int) as id_product						
            , cast(startdate as string) as start_date						
            , cast(enddate as string) as end_date					
            , cast(standardcost as numeric) as standard_cost						
            , cast(modifieddate as string) as modified_date
        from {{ source('sap', 'productcosthistory') }}
    )
select*
from fonte_product_cost_history