with 

source as (

    select * 
    from {{ source('erp', 'person_address') }}

),

renamed as (

    select
        cast(ADDRESSID as varchar) as addressid_pk
        , cast(CITY as string) as city_name
        , cast(POSTALCODE as varchar) as postal_code
        , cast(STATEPROVINCEID as varchar) as stateprovinceid_fk

    from source

)

select * from renamed