with 

source as (

    select * 
    from {{ source('erp', 'person_person') }}

),

renamed as (

    select
        cast(BUSINESSENTITYID as int) as businessentityid_person_pk
        , cast(FIRSTNAME as varchar) as firstname
        , cast(LASTNAME as varchar) as lastname

    from source

)

select * from renamed