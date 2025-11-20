with 
    customer as (
        select *
        from {{ ref('stg_erp__customer')}}
    )

    , person as (
        select *
        from {{ ref('stg_erp__person')}}
    )

    , creditcard as (
        select *
        from {{ ref('stg_erp__creditcard')}}
    )

    , personcreditcard as (
        select *
        from {{ ref('stg_erp__personcreditcard')}}
    )

    , store as (
        select *
        from {{ ref('stg_erp__store')}}
    )


    , joined as (
        select 
            customer.customerid_pk as customer_id
            , case
                when customer.personid_fk is not null and customer.storeid_fk is null then 'Individual'
                when customer.storeid_fk is not null then 'Company'
                else 'Unknown'
            end as client_type
            , customer.personid_fk as person_id
            , customer.storeid_fk as store_id
            , person.firstname || ' ' || person.lastname as full_name
            , store.storename as store_name
            , creditcard.creditcardid_pk as credit_card_id
            , creditcard.cardtype as credit_card_type
            , customer.customer_territoryid_fk as territory_id
            , person.businessentityid_person_pk as businessentity_id_person
            , store.businessentityid_store_pk as businessentity_id_store
        from customer
        left join store on customer.storeid_fk = store.businessentityid_store_pk
        left join person on customer.personid_fk = person.businessentityid_person_pk
        left join personcreditcard on person.businessentityid_person_pk = personcreditcard.businessentityid_fk
        left join creditcard on personcreditcard.creditcardid_fk = creditcard.creditcardid_pk
    )

select * 
from joined