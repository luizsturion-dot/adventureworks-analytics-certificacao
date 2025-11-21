with 
    address as (
        select *
        from {{ ref('stg_erp__address')}}
    )

    , stateprovince as (
        select *
        from {{ ref('stg_erp__stateprovince')}}
    )

    , salesterritory as (
        select *
        from {{ ref('stg_erp__salesterritory')}}
    )

    , countryregion as (
        select *
        from {{ ref('stg_erp__countryregion')}}
    )

    , joined as (
        select 
            address.addressid_pk as address_key
            , stateprovince.territoryid_fk as territory_key
            , COALESCE(address.address_line_1, '') || ' ' || COALESCE(address.address_line_2, '') as full_address
            , address.city_name as city
            , address.stateprovinceid_fk as state_province_key
            , stateprovince.stateprovince_name as state_province
            , stateprovince.stateprovincecode
            , address.postal_code
            , salesterritory.territory_name
            , salesterritory.areacontinent
            , countryregion.country_name as country
            , stateprovince.countryregioncode_stateprovince_fk as country_code


        from address
        left join stateprovince on stateprovince.stateprovinceid_pk = address.stateprovinceid_fk
        left join salesterritory on salesterritory.territoryid_pk = stateprovince.territoryid_fk
        left join countryregion on salesterritory.countryregioncode_territory_fk = countryregion.countryregioncode_territory_pk

    )

select * 
from joined