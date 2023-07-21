with 
    business_entity as (
        select 
            cast(businessentityid as int) as id_business
        from {{ source('sap', 'businessentity') }}
    )
select * 
from business_entity