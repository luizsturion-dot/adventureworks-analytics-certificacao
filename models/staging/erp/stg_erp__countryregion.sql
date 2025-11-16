with 

source as (

    select * 
    from {{ source('erp', 'person_countryregion') }}

),

renamed as (

    select
        cast(COUNTRYREGIONCODE as varchar) as countryregion_pk
        , cast(NAME as string) as country_name

    from source

)

select * from renamed