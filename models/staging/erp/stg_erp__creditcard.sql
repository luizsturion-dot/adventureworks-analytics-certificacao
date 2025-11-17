with 

source as (

    select * 
    from {{ source('erp', 'sales_creditcard') }}

),

renamed as (

    select
        cast(CREDITCARDID as int) as creditcardid_pk
        , cast(CARDTYPE as varchar) as cardtype

    from source

)

select * from renamed