with 

source as (

    select * 
    from {{ source('erp', 'sales_salesorderdetail') }}

),

renamed as (

    select
        cast(SALESORDERDETAILID as int) as salesorderdetailid_pk
        , cast(SALESORDERID as int) as salesorderid_fk
        , cast(ORDERQTY as int) as order_quantity
        , cast(UNITPRICE as float) as unitprice
        , cast(PRODUCTID as int) as productid
        , cast(UNITPRICEDISCOUNT as int) as unitpricediscount               
               
    from source

)

select * from renamed