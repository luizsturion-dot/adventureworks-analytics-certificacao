with 

source as (

    select * 
    from {{ source('erp', 'sales_store') }}

),

renamed as (

    select
        cast(BUSINESSENTITYID as int) as businessentityid_store_pk
        , cast("NAME" as varchar) as storename
        

    from source

)

select * from renamed