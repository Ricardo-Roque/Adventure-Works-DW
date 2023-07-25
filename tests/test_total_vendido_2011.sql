{{
    config(
        severity = 'error'
    )
}}
with
    sales_in_2011 as (
        select sum(gross_total) as sales_total
        from {{ ref('fact_sales') }}
        where order_date between '2011-01-01' and '2011-12-31'
    )
select sales_total
from sales_in_2011
where sales_total not between 12646112.00 and 12646113.00