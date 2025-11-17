with 

source as (

    select * 
    from {{ source('erp', 'sales_personcreditcard') }}

),

renamed as (

    select
        cast(CREDITCARDID as int) as creditcardid_fk
        , cast(BUSINESSENTITYID as varchar) as businessentityid_fk

    from source

)

select * from renamed