with 
    product as (
        select*
        from {{ ref('stg_sap__product') }}
    )
    , category as (
        select*
        from {{ ref('int_category_product') }}
    )
    , product_cost as (
        select*
        from {{ ref('stg_sap__productcosthistory') }}
    )
    , product_price as (
        select*
        from {{ ref('stg_sap__productlistpricehistory') }}
    )
    , join_tabelas as (
        select 
            product.id_product
            , product.name_product_product
            , product.number_product
            , product_cost.standard_cost
            , product_price.list_price
            , category.product_category_id
            , category.name_product_category
            , category.product_subcategory_id
            , category.name_product_subcategory
        from product
        left join category on product.product_subcategory_id = category.product_subcategory_id
        left join product_cost on product.id_product = product_cost.id_product
        left join product_price on product.id_product = product_price.id_product
    )

select *
from join_tabelas