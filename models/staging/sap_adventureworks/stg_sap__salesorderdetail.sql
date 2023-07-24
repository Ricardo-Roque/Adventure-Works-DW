with 
    fonte_sales_order_detail as (
        select 
            cast(salesorderid as int) as sales_order_id						
            , cast(salesorderdetailid as int) as sales_oder_detail_id	
            , cast(productid as int) as id_product	
            , cast(unitprice as numeric) as unit_price	
            , cast(orderqty as int) as order_qty		
            , cast(unitpricediscount as numeric) as unit_price_discount				
            , cast(carriertrackingnumber as string) as carrier_tracking_number						
            , cast(specialofferid as int) as special_offer_id								
            , cast(rowguid as string) as row_guid					
            , cast(modifieddate as string) as modified_date
        from {{ source('sap', 'salesorderdetail') }}
    )
select * 
from fonte_sales_order_detail