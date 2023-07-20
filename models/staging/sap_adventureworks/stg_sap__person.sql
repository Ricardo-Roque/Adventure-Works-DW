with 
    fonte_person as (
        select 
            cast(businessentityid as int) as id_business						
            , cast(title as string) as title					
            , cast(firstname as string) as first_name						
            , cast(middlename as string) as middle_name 						
            , cast(lastname as string) as last_name 											
            , cast(rowguid as string) as row_guid						
            , cast(modifieddate as string) as modified_date
            --, persontype							
            --, namestyle
            --, suffix						
            --, emailpromotion						
            --, additionalcontactinfo						
            --, demographics
        from {{ source('sap', 'person') }}
    )
select * 
from fonte_person