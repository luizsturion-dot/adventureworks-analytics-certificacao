with 

source as (

    select * 
    from {{ source('erp', 'person_address') }}

),

renamed as (

    select
        cast(ADDRESSID as varchar) as addressid_pk
        , cast(CITY as string) as city_name
        , cast(ADDRESSLINE1 as varchar) as address_line_1
        , cast(ADDRESSLINE2 as varchar) as address_line_2
        , cast(POSTALCODE as varchar) as postal_code
        , cast(STATEPROVINCEID as varchar) as stateprovinceid_fk

    from source

)

select * from renamed