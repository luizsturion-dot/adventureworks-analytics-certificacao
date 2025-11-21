with 
    salesorderdetail as (
        select *
        from {{ ref('stg_erp__salesorderdetail')}}
    )

    
    , salesorderheader as (
        select *
        from {{ ref('stg_erp__salesorderheader')}}
    )


-- Primeiramente, realizamos o join entre as duas entidades;

    , joined as (
        select 
            salesorderdetail.salesorderdetailid_pk,
            salesorderdetail.salesorderid_fk,
            salesorderdetail.order_quantity,
            salesorderdetail.unitprice,
            salesorderdetail.productid,
            salesorderdetail.unitpricediscount, 
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
                       
        from salesorderdetail
        left join salesorderheader on salesorderdetail.salesorderid_fk = salesorderheader.salesordeid_pk

    )

-- Em seguida, prosseguimos para as métricas desejadas.
-- Definições de métricas tirados de: https://dataedo.com/samples/html/AdventureWorks/doc/AdventureWorks_2/modules/Sales_12/tables/Sales_SalesOrderHeader_185.html

    , metrics as (
        select 
            salesorderdetailid_pk as sales_detail_id
            , salesordeid_pk as sales_order_id
            , customerid_fk as customer_id
            , creditcardid_fk as credit_card_id
            , header_territoryid_fk as territory_id
            , shiptoaddressid_fk as shipping_id
            , productid as product_id
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