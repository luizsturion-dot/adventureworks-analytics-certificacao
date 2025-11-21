with
    fct_sales as (
        select *
        from {{ ref('int_sales__metrics') }}
    )

select *
from fct_sales