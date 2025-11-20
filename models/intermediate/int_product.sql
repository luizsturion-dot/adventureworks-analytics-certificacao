with 
    product as (
        select *
        from {{ ref('stg_erp__product')}}
    )

    , renamed as (
        select 
            product.productid_pk as product_id
            , product.product_name
            , product.product_number
            , product.product_size
            , product.product_color
            , product.product_weight

        from product

    )

select * 
from renamed
