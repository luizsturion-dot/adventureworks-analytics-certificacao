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
            {{ dbt_utils.generate_surrogate_key(['salesorderheadersalesreason.salesorderid_fk', 'salesreason.salesreasonid_pk']) }} as reason_key
            , salesorderheadersalesreason.salesorderid_fk as salesorder_id
            , salesreason.salesreasonid_pk as salesreason_id  
            , salesreason.salesreason_name
            , salesreason.salesreason_type
        from salesorderheadersalesreason
        left join salesreason on salesreason.salesreasonid_pk = salesorderheadersalesreason.salesreasonid_fk

    )

select * 
from joined