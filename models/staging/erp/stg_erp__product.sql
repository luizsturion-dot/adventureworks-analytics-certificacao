with 

source as (

    select * 
    from {{ source('erp', 'production_product') }}

),

renamed as (

    select
        cast(PRODUCTID as int) as productid_pk
        , cast(PRODUCTNUMBER as int) as productnumber
        , cast(NAME as int) as product_name

    from source

)

select * from renamed