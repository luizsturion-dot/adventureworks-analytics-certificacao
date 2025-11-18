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
            customer.customerid_pk,
            customer.personid_fk,
            customer.storeid_fk,
            person.firstname || ' ' || person.lastname as full_name,
            store.storename,
            creditcard.creditcardid_pk,
            creditcard.cardtype,
            customer.customer_territoryid_fk,
            personcreditcard.creditcardid_fk,
            person.businessentityid_person_pk,
            store.businessentityid_store_pk
        from customer
        left join store on customer.storeid_fk = store.businessentityid_store_pk
        left join person on customer.personid_fk = person.businessentityid_person_pk
        left join personcreditcard on person.businessentityid_person_pk = personcreditcard.businessentityid_fk
        left join creditcard on personcreditcard.creditcardid_fk = creditcard.creditcardid_pk
    )

select * 
from joined