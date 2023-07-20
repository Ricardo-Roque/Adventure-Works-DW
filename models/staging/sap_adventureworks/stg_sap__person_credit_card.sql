with 
    fonte_person_credit_card as (
        select 
            cast(businessentityid as int) as id_business						
            , cast(creditcardid as int) as credit_card_id						
            , cast(modifieddate as string) as modified_date
        from {{ source('sap', 'personcreditcard') }}
    )
select * 
from fonte_person_credit_card