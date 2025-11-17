with 

source as (

    select * 
    from {{ source('erp', 'sales_salesterritory') }}

),

renamed as (

    select
        cast(TERRITORYID as int) as territoryid_pk
        , cast(NAME as string) as territory_name
        , cast(GROUP as varchar) as areacontinent
        , cast(COUNTRYREGIONCODE as varchar) as countryregioncode_territory_fk

    from source

)

select * from renamed