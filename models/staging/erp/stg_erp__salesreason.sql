with 

source as (

    select * 
    from {{ source('erp', 'sales_salesreason') }}

),

renamed as (

    select
        cast(SALESREASONID as int) as salesreasonid_pk
        , cast(NAME as varchar) as salesreason_name
        , cast(REASONTYPE as varchar) as salesreason_type

    from source

)

select * from renamed