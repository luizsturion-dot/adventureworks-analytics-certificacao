with 

source as (

    select * 
    from {{ source('erp', 'production_product') }}

),

renamed as (

    select
        cast(PRODUCTID as int) as productid_pk
        , cast(NAME as string) as product_name
        , cast(PRODUCTNUMBER as string) as product_number
        , cast(SIZE as varchar) as product_size
        , cast(COLOR as varchar) as product_color
        , cast(WEIGHT as string) as product_weight

    from source

)

select * from renamed