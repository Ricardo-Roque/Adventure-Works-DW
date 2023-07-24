with 
    customer as (
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
            , customer.row_guid								
        from customer
        )
select * 
from join_customer