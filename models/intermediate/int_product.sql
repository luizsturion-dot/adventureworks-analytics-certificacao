with 
    product as (
        select *
        from {{ ref('stg_erp__product')}}
    )

select * 
from product