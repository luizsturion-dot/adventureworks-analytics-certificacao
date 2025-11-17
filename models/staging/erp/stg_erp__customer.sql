with 

source as (

    select * 
    from {{ source('erp', 'sales_customer') }}

),

renamed as (

    select
        cast(CUSTOMERID as int) as customerid_pk
        , cast(PERSONID as int) as personid_fk
        , cast(STOREID as int) as storeid_fk
        , cast(TERRITORYID as int) as customer_territoryid_fk

    from source

)

select * from renamed