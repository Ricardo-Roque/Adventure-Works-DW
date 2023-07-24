with
    sales_order_detail as (
        select *
        from {{ ref('stg_sap__salesorderdetail') }}
    )
    , sales_order_header as (
        select *
        from {{ ref('stg_sap__salesorderheader') }}
    )
    , join_sales_order as (
        select  
            sales_order_detail.sales_order_id						
            , sales_order_detail.sales_oder_detail_id	
            , sales_order_detail.id_product	
            , sales_order_header.customer_id									
            , sales_order_header.ship_to_address_id						
            , sales_order_header.credit_card_id	
            , sales_order_detail.unit_price	
            , sales_order_detail.order_qty		
            , sales_order_detail.unit_price_discount												
            , sales_order_header.order_date						
            , sales_order_header.due_date						
            , sales_order_header.ship_date						
            , sales_order_header.status 										
            , sales_order_header.sub_total						
            , sales_order_header.tax_amt						
            , sales_order_header.freight						
            , sales_order_header.total_due
            , sales_order_detail.row_guid					
            , sales_order_detail.modified_date
            --, sales_order_detail.carrier_tracking_number
            --, sales_order_header.credit_card_approval_code	
            --, sales_order_header.account_number 						
            --, sales_order_header.purchase_order_number	
            --, sales_order_header.revision_number		
            --, sales_order_detail.special_offer_id	
            --, sales_order_header.currency_rate_id
            --, sales_order_header.ship_method_id	
            --, sales_order_header.bill_to_address_id	
            --, sales_order_header.sales_person_id		
            --, sales_order_header.territory_id	
        from sales_order_detail
        left join sales_order_header on sales_order_detail.sales_order_id = sales_order_header.sales_order_id
    )
    , sales_key as (
        select 
            cast((sales_oder_detail_id || '-' || customer_id) as string) as pk_sales
            , *
        from join_sales_order
    )
select *
from join_sales_order