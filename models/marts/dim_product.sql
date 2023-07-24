with 
    product as (
        select *
        from {{ ref('stg_sap__product') }}
    )
    , sub_category as (
        select * 
        from {{ ref('stg_sap__productsubcategory') }}
     )
     , category as (
        select *
        from {{ ref('stg_sap__productcategory') }}
     )
    , join_tabelas as (
        select 
            product.id_product
            , product.product_name
            , product.number_product
            , category.product_category_id
            , category.name_product_category
            , sub_category.product_subcategory_id
            , sub_category.name_product_subcategory
        from product
        left join sub_category on product.product_subcategory_id = sub_category.product_subcategory_id
        left join category on sub_category.product_category_id = category.product_category_id
    )

select *
from join_tabelas
order by id_product
