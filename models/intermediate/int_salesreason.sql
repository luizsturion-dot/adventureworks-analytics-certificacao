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
            salesorderheadersalesreason.salesorderid_fk as salesorder_id
            , salesreason.salesreasonid_pk as salesreason_id  
            , salesreason.salesreason_name
            , salesreason.salesreason_type
        from salesorderheadersalesreason
        left join salesreason on salesreason.salesreasonid_pk = salesorderheadersalesreason.salesreasonid_fk

    )

    , reason_order as (
        select
            salesorder_id
            , coalesce(listagg(salesreason_name, ', ') within group (order by salesreason_name), 'No Reason') as sales_reason_agg
            , coalesce(listagg(salesreason_type, ', ') within group (order by salesreason_type), 'No Ype') as sales_type_agg
        from joined
        group by salesorder_id
    )
    
select *
from reason_order
