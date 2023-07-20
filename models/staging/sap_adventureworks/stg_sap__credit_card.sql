with 
    fonte_credit_card as (
        select 
            cast(creditcardid as int) as credit_card_id						
            , cast(cardtype as string) as card_type									
            , cast(modifieddate as string) as modified_date
            --, cast(cardnumber as 						
            --, cast(expmonth						
            --, cast(expyear
        from {{ source('sap', 'creditcard') }}
    )
select * 
from fonte_credit_card