with 

source as (

    select * 
    from {{ source('erp', 'sales_salesorderdetail') }}

),

renamed as (

    select
        cast(SALESORDERDETAILID as int) as salesorderdetailid_pk
        , cast(ORDERQTY as int) as order_quantity
        , cast(UNITPRICE as int) as unitprice
        , cast(PRODUCTID as int) as productid

    from source

)

select * from renamed