with 

source as (

    select * 
    from {{ source('erp', 'person_stateprovince') }}

),

renamed as (

    select
        cast(STATEPROVINCEID as int) as stateprovinceid_pk
        , cast(TERRITORYID as int) as territoryid_fk
        , cast(STATEPROVINCECODE as varchar) as stateprovincecode
        , cast(COUNTRYREGIONCODE as varchar) as countryregioncode_stateprovince_fk
        , cast(NAME as varchar) as stateprovince_name

    from source

)

select * from renamed