with 
    fonte_state_province as (
        select 
            cast(stateprovinceid as int) state_province_id						
            , cast(stateprovincecode as string) as state_province_code 						
            , cast(countryregioncode as string) as country_region_code											
            , cast(name as string) as state_name 						
            , cast(territoryid as int) as territory_id						
            , cast(rowguid as string) as row_guid						
            , cast(modifieddate as string) as modified_date
            --, cast(isonlystateprovinceflag 	
        from {{ source('sap', 'stateprovince') }}
    )
select * 
from fonte_state_province