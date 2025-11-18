with 
    salesreason as (
        select *
        from {{ ref('stg_erp__salesreason')}}
    )

    , salesorderheadersalesreason as (
        select *
        from {{ ref('stg_erp__salesorderheadersalesreason')}}
    )

    , joined as (
        select 
            salesreason.salesreasonid_pk,
            salesreason.salesreason_name,
            salesreason.salesreason_type,
            salesorderheadersalesreason.salesorderid_fk
        from salesreason
        left join salesorderheadersalesreason on salesreason.salesreasonid_pk = salesorderheadersalesreason.salesreasonid_fk

    )

select * 
from joined