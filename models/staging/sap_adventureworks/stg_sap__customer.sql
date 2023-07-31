with 
    customer as(
        select 	
        cast(customerid as int) as customer_id						
        , cast(personid as int)	as person_id					
        , cast(storeid as int) as store_id 						
        , cast(territoryid as int) as territory_id 						
        , cast(rowguid as string) as row_guid 						
        , cast(modifieddate as string) as modified_date
        from {{ source('sap', 'customer') }}
    )
select *
from customer