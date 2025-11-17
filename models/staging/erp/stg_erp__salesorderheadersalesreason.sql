with 

source as (

    select * 
    from {{ source('erp', 'sales_salesorderheadersalesreason') }}

),

renamed as (

    select
        cast(SALESORDERID as int) as salesorderid_fk
        , cast(SALESREASONID as int) as salesreasonid_fk


    from source

)

select * from renamed