with
    fonte_businessentity_address as (
        select 
            cast(businessentityid as int) as id_business						
            , cast(addressid as int) as id_address						
            , cast(addresstypeid as int) as address_type						
            , cast(rowguid as string) as row_guid					
            , cast(modifieddate as string) as modified_date
        from {{ source('sap', 'businessentityaddress') }}
    )
select * 
from fonte_businessentity_address