with 
    person_credit_card as (
        select *
        from {{ ref('stg_sap__person_credit_card') }}
    )
    , credit_card as (
        select *
        from {{ ref('stg_sap__credit_card') }}
    )
    , join_credit_card as (
        select 
            person_credit_card.id_business						
            , person_credit_card.credit_card_id												
            , credit_card.card_type									
            , credit_card.modified_date
        from person_credit_card
        left join credit_card on person_credit_card.credit_card_id = credit_card.credit_card_id        
    )
select * 
from join_credit_card