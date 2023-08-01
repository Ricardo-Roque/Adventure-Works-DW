with 
    person as (
        select *
        from {{ ref('stg_sap__person') }}
    )
    , customer as (
        select *
        from {{ ref('stg_sap__customer') }}
    )
    , join_customer as (
        select
            customer.customer_id
            , customer.person_id
            , person.id_business						
            , person.title					
            , person.first_name						
            , person.middle_name 						
            , person.last_name 																					
            , person.row_guid								
        from person
        left join customer on person.id_business = customer.person_id
        )
select * 
from join_customer