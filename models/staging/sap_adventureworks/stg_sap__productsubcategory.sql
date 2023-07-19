with 
    fonte_product_subcategory as (
        select 
            cast(productsubcategoryid as int) as product_subcategory_id						
            , cast(productcategoryid as int) as product_category_id						
            , cast(name as string) as name_product_subcategory						
            , cast(rowguid as string) as row_guid						
            , cast(modifieddate as string) as modified_date
        from {{ source('sap', 'productsubcategory') }}
    )
select* 
from fonte_product_subcategory