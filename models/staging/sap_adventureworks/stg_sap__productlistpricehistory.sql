with 
    fonte_product_list_price_history as (
        select
            cast(productid as int) as id_product							
            , cast(startdate as string) as start_date						
            , cast(enddate as string) as end_date						
            , cast(listprice as numeric) as list_price						
            , cast(modifieddate as string) as modified_date
        from {{ source('sap', 'productlistpricehistory') }}
    )
select *
from fonte_product_list_price_history