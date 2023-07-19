with 
    fonte_product as (
        select
            cast(productid as int) as id_product						
            , cast(name as string) as product_name						
            , cast(productnumber as string) as number_product						
            , cast(makeflag as string) as make_flag											
            , cast(safetystocklevel as int) as safety_stock_level						
            , cast(reorderpoint as int) as re_order_point 						
            , cast(standardcost as numeric) as standard_cost						
            , cast(listprice as numeric) as list_price									
            , cast(daystomanufacture as int) as days_to_manufacture						
            , cast(productline as string) as product_line					
            , cast(class as string) as class_product						
            , cast(style as string) as style_product 						
            , cast(productsubcategoryid as int) as product_subcategory_id 						
            , cast(productmodelid as int) as product_model_id						
            , cast(sellstartdate as string) as sell_start_date						
            , cast(sellenddate as string) as sell_end_date						
            , cast(discontinueddate as int) as discontinued_date						
            , cast(rowguid as string) as row_guid						
            , cast(modifieddate as string) as modified_date
            --, finishedgoodsflag						
            --, color
            --, size					
            --, sizeunitmeasurecode						
            --, weightunitmeasurecode						
            --, weight	
        from {{ source('sap', 'product') }}
    )

select*
from fonte_product