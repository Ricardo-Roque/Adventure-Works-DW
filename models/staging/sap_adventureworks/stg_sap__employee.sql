with 
    fonte_employee as (
        select
            cast(businessentityid as int) as id_business						
            , cast(nationalidnumber as int) as national_id_number 						
            , cast(loginid as string) as login_id						
            , cast(jobtitle as string) as job_title						
            , cast(birthdate as string) as birth_date_employee												
            , cast(rowguid as string) as row_guid						
            , cast(modifieddate as string) as modified_date_employee						
            --, cast(organizationnode
            --, cast(maritalstatus 						
            --, cast(gender						
            --, cast(hiredate						
            --, cast(salariedflag						
            --, cast(vacationhours						
            --, cast(sickleavehours						
            --, cast(currentflag
        from {{ source('sap', 'employee') }}
    )
    
select * 
from fonte_employee