with 
    fonte_country_region as (
        select 
            cast(countryregioncode as string) as country_region_code						
            , cast(name as string) as country_region_name						
            , cast(modifieddate as string) as modified_date
        from {{ source('sap', 'countryregion') }}
    )
select * 
from fonte_country_region