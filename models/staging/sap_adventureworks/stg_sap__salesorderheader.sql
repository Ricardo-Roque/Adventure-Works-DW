with 
    fonte_sales_order_header as (
        select 
            cast(salesorderid as int) as sales_order_id						
            , cast(revisionnumber as int) as revision_number						
            , cast(orderdate as string) as order_date						
            , cast(duedate as string) as due_date						
            , cast(shipdate as string) as ship_date						
            , cast(status as int) as status 						
            , cast(purchaseordernumber as string) as purchase_order_number						
            , cast(accountnumber as string) as account_number 						
            , cast(customerid as int) as customer_id						
            , cast(salespersonid as int) as sales_person_id					
            , cast(territoryid as int) as territory_id						
            , cast(billtoaddressid as int) as bill_to_address_id						
            , cast(shiptoaddressid as int) as ship_to_address_id						
            , cast(shipmethodid as int) as ship_method_id						
            , cast(creditcardid as int) as credit_card_id						
            , cast(creditcardapprovalcode as string) as credit_card_approval_code						
            , cast(currencyrateid as int) as currency_rate_id						
            , cast(subtotal as numeric) as sub_total						
            , cast(taxamt as numeric) as tax_amt						
            , cast(freight as numeric) as freight						
            , cast(totaldue as numeric) as total_due									
            , cast(rowguid as string) as row_guid					
            , cast(modifieddate as string) as modified_date
            --, cast(onlineorderflag 
            --, cast(comment		
        from {{ source('sap', 'salesorderheader') }}
    )
select * 
from fonte_sales_order_header