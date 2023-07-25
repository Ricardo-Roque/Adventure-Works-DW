with 
    sales as (
        select *
        from {{ ref('int_sales_orders') }}
    )
    , address as (
        select *
        from {{ ref('dim_address') }}
    )
    , credit_card as (
        select *
        from {{ ref('dim_creditcard') }}
    )
    , product as (
        select *
        from {{ ref('dim_product') }}
    )
    , sales_reason as (
        select *
        from {{ ref('dim_salesreason') }}
    )
    , join_tabelas as (
        select 
            sales.sales_order_id						
            , sales.sales_order_detail_id	
            , sales.id_product	
            , sales.customer_id									
            , sales.ship_to_address_id						
            , sales.credit_card_id	
            , sales.unit_price	
            , sales.order_qty		
            , sales.unit_price_discount												
            , sales.order_date						
            , sales.due_date						
            , sales.ship_date						
            , sales.status 										
            , sales.sub_total						
            , sales.tax_amt						
            , sales.freight						
            , sales.total_due 
            , sales.gross_total
            , sales.net_total
            , sales.freight_per_items
            , address.state_province_id						
            , address.addres_line_1 					
            , address.address_line_2
            , address.state_name 
            , address.city		
            , address.country_region_name							
            , credit_card.card_type	
            , product.product_name
            , product.name_product_category
            , product.name_product_subcategory
            , sales_reason.sales_reason						
            , sales_reason.reason_type
        from sales
        left join address on sales.ship_to_address_id = address.id_address
        left join credit_card on sales.credit_card_id = credit_card.credit_card_id
        left join product on sales.id_product = product.id_product
        left join sales_reason on sales.sales_order_id = sales_reason.sales_order_id
    )
    
    , sales_key as (
        select 
            row_number() over (order by sales_order_id,sales_order_detail_id) as sales_sk
            , *
        from join_tabelas
    )

select *
from sales_key