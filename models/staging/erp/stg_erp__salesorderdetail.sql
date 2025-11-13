with 

source as (

    select * from {{ source('erp', 'salesorderdetail') }}

),

renamed as (

    select
        cast(salesorderdetailid as int) as salesorderdetailid_pk
        , cast(orderqty as int) as order_quantity
        , cast(unitprice as int) as unitprice
        , cast(productid as int) as productid

    from source

)

select * from renamed