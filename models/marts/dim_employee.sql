with
    employee as (
        select 
            id_business						
            , national_id_number 						
            , login_id						
            , job_title						
            , birth_date_employee												
            , row_guid						
            , modified_date_employee
        from {{ ref('stg_sap__employee') }}
    )

select * 
from employee