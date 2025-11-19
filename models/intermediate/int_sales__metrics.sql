with 
    salesorderheader as (
        select *
        from {{ ref('stg_erp__salesorderheader')}}
    )

    , salesorderdetail as (
        select *
        from {{ ref('stg_erp__salesorderdetail')}}
    )

-- Primeiramente, realizamos o join entre as duas entidades;

    , joined as (
        select 
            salesorderheader.salesordeid_pk,
            salesorderheader.customerid_fk,
            salesorderheader.creditcardid_fk,
            salesorderheader.shiptoaddressid_fk,
            salesorderheader.header_territoryid_fk,
            salesorderheader.orderdate,
            salesorderheader.duedate,
            salesorderheader.shipdate,
            salesorderheader.freight,
            salesorderheader.status,
            salesorderdetail.salesorderdetailid_pk,
            salesorderdetail.salesorderid_fk,
            salesorderdetail.order_quantity,
            salesorderdetail.unitprice,
            salesorderdetail.productid,
            salesorderdetail.unitpricediscount                        
        from salesorderheader
        left join salesorderdetail on salesorderheader.salesordeid_pk = salesorderdetail.salesorderid_fk

    )

-- Em seguida, prosseguimos para as métricas desejadas.
-- Definições de métricas tirados de: https://dataedo.com/samples/html/AdventureWorks/doc/AdventureWorks_2/modules/Sales_12/tables/Sales_SalesOrderHeader_185.html

    , metrics as (
        select 
            salesordeid_pk
            , salesorderdetailid_pk
            , productid
            , customerid_fk
            , creditcardid_fk
            , header_territoryid_fk
            , shiptoaddressid_fk
            , order_quantity
            , unitprice
            , unitpricediscount
            , case
                when unitpricediscount > 0 then true else false
            end as had_discount
            , order_quantity * unitprice as negotiated_price
            , order_quantity * unitprice * (1 - unitpricediscount) as net_negotiated_price
            , case 
                when status like 1 then 'In process'
                when status like 2 then 'In Approved'
                when status like 3 then 'Backordered'
                when status like 4 then 'Rejected' 
                when status like 5 then 'Shipped'
                when status like 6 then 'Cancelled' 
            end as status_description
            , orderdate
            , duedate
            , shipdate
            , freight
        from joined
    )

select * 
from metrics