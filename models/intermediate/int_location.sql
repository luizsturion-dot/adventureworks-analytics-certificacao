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
            address.addressid_pk,
            stateprovince.territoryid_fk,
            address.city_name,
            address.stateprovinceid_fk,
            stateprovince.stateprovince_name,
            stateprovince.stateprovincecode,
            address.postal_code,
            salesterritory.territory_name,
            salesterritory.areacontinent,
            countryregion.country_name,
            stateprovince.countryregioncode_stateprovince_fk,
            salesterritory.countryregioncode_territory_fk,

        from address
        left join stateprovince on stateprovince.stateprovinceid_pk = address.stateprovinceid_fk
        left join salesterritory on salesterritory.countryregioncode_territory_fk = stateprovince.countryregioncode_stateprovince_fk
        left join countryregion on salesterritory.countryregioncode_territory_fk = countryregion.countryregioncode_territory_pk

    )

select * 
from joined