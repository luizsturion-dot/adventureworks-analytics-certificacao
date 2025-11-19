with 

source as (

    select * 
    from {{ source('erp', 'sales_salesorderheader') }}

),

renamed as (

    select
        cast(SALESORDERID as int) as salesordeid_pk
        , cast(CUSTOMERID as int) as customerid_fk
        , cast(CREDITCARDID as int) as creditcardid_fk
        , cast(SHIPTOADDRESSID as int) as shiptoaddressid_fk
        , cast(TERRITORYID as int) as header_territoryid_fk
        , cast(TOTALDUE as int) as totaldue
        , cast(SUBTOTAL as int) as subtotal
        , cast(TAXAMT as int) as taxamt
        , cast(ORDERDATE as date) as orderdate
        , cast(DUEDATE as date) as duedate
        , cast(SHIPDATE as date) as shipdate
        , cast(FREIGHT as real) as freight
        , cast(STATUS as int) as status
        
                     
               
    from source

)

select * from renamed