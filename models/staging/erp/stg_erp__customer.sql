with 

source as (

    select * 
    from {{ source('erp', 'sales_customer') }}

),

renamed as (

    select
        cast(CUSTOMERID as int) as customer_pk
        , cast(PERSONID as int) as person_fk
        , cast(STOREID as int) as store_fk
        , cast(TERRITORYID as int) as customer_territory_fk

    from source

)

select * from renamed