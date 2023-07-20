with 
    credit_card_fonte as (
        select *
        from {{ ref('int_credit_card') }}
    )
    , customer as (
        select *
        from {{ ref('stg_sap__person') }}
    )
    , join_customer as (
        select
            customer.id_business						
            , customer.title					
            , customer.first_name						
            , customer.middle_name 						
            , customer.last_name 																					
            , credit_card_fonte.credit_card_id												
            , credit_card_fonte.card_type		
            , customer.row_guid								
            , credit_card_fonte.modified_date
        from customer
        left join credit_card_fonte on customer.id_business = credit_card_fonte.id_business
    )
select * 
from join_customer