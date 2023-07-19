with 
    category as (
        select*
        from {{ ref('stg_sap__productcategory') }}
    )
    , sub_category as (
        select*
        from {{ ref('stg_sap__productsubcategory') }}
    )
    , join_category_product as (
        select
            category.product_category_id 
            , sub_category.product_subcategory_id	
            , category.name_product_category			
            , sub_category.name_product_subcategory		 					
        from sub_category
        left join category on sub_category.product_category_id = category.product_category_id	
    )
select *
from join_category_product
