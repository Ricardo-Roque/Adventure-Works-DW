with 
    address as (
        select * 
        from {{ ref('stg_sap__address') }}
    )
    , state_province as (
        select * 
        from {{ ref('stg_sap__stateprovince') }}
    )
    , country_region as (
        select *
        from {{ ref('stg_sap__countryregion') }}
    )
    , join_tabelas_customer as (
        select 
            address.id_address	
            , address.state_province_id						
            , address.addres_line_1 					
            , address.address_line_2
            , state_province.state_name 
            , address.city		
            , country_region.country_region_name							
            , address.postal_code
            , state_province.state_province_code 						
            , state_province.country_region_code											  						
            , state_province.territory_id
        from address
        left join state_province on address.state_province_id = state_province.state_province_id
        left join country_region on state_province.country_region_code = country_region.country_region_code
    )
select * 
from join_tabelas_customer
