with 
    credit_card_fonte as (
        select *
        from {{ ref('int_credit_card') }}
    )
    , customer as (
        select *
        from {{ ref('stg_sap__person') }}
    )
    , address as (
        select *
        from {{ ref('int_address_customer') }}
    )
    , join_customer as (
        select
            customer.id_business						
            , customer.title					
            , customer.first_name						
            , customer.middle_name 						
            , customer.last_name 	
            , address.id_address	
            , address.state_province_id						
            , address.addres_line_1 					
            , address.address_line_2
            , address.state_name 
            , address.city	
            , address.address_type									
            , address.postal_code
            , address.state_province_code 						
            , address.country_region_code											  						
            , address.territory_id																				
            , credit_card_fonte.credit_card_id												
            , credit_card_fonte.card_type		
            , customer.row_guid								
            , credit_card_fonte.modified_date
        from customer
        left join credit_card_fonte on customer.id_business = credit_card_fonte.id_business
        left join address on customer.id_business = address.id_business
        )
select * 
from join_customer