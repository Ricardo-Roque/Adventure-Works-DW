with
    fonte_address as (
        select 
            cast(addressid as int) as id_address						
            , cast(addressline1	as string) as addres_line_1 					
            , cast(addressline2 as string) as address_line_2						
            , cast(city as string) as city						
            , cast(stateprovinceid as int) as state_province_id						
            , cast(postalcode as string) as postal_code										
            , cast(rowguid as string) as row_guid					
            , cast(modifieddate as string) as modified_date
            --, cast(spatiallocation 	
        from {{ source('sap', 'address') }}
    )
select * 
from fonte_address