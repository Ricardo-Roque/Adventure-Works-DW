with 
    fonte_product_category as (
        select 
            cast(productcategoryid as int) as product_category_id						
            , cast(name	as string) as name_product_category					
            , cast(rowguid as string) as row_guid					 	
            , cast(modifieddate as string) as modified_date
        from {{ source('sap', 'productcategory') }}
    )
select*
from fonte_product_category