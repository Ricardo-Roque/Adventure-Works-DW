with 
    product as (
        select*
        from {{ ref('stg_sap__product') }}
    )
     , category as (
        select*
        from {{ ref('int_category_product') }}
     )
    , join_tabelas as (
        select 
            product.id_product
            , product.product_name
            , product.number_product
            , category.product_category_id
            , category.name_product_category
            , category.product_subcategory_id
            , category.name_product_subcategory
        from product
        left join category on product.product_subcategory_id = category.product_subcategory_id
    )

select *
from join_tabelas
order by id_product
