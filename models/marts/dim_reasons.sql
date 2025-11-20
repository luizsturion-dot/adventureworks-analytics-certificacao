with
    dim_reasons as (
        select *
        from {{ ref('int_salesreason') }}
    )

select *
from dim_reasons