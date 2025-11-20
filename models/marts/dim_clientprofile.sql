with
    dim_clientprofile as (
        select *
        from {{ ref('int_clientprofile') }}
    )

select *
from dim_clientprofile