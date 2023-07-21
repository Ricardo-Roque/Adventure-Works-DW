with 
    business_entity_address as (
        select *
        from {{ ref('stg_sap__businessentityaddress') }}
    )
    , address as (
        select * 
        from {{ ref('stg_sap__address') }}
    )
    , state_province as (
        select * 
        from {{ ref('stg_sap__stateprovince') }}
    )
    , business_entity as (
        select * 
        from {{ ref('stg_sap__businessentity') }}
    )
    , join_tabelas_customer as (
        select 
            business_entity.id_business						
            , business_entity_address.id_address	
            , address.state_province_id						
            , address.addres_line_1 					
            , address.address_line_2
            , state_province.state_name 
            , address.city	
            , business_entity_address.address_type									
            , address.postal_code
            , state_province.state_province_code 						
            , state_province.country_region_code											  						
            , state_province.territory_id
            , business_entity_address.row_guid					
            , business_entity_address.modified_date
        from business_entity
        left join business_entity_address on business_entity.id_business = business_entity_address.id_business
        left join address on business_entity_address.id_address = address.id_address
        left join state_province on address.state_province_id = state_province.state_province_id
    )
select * 
from join_tabelas_customer
