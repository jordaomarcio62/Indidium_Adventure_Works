with
    fonte_ordem_detalhes as (
        select
            cast(salesorderdetailid as int) as pk_pedido_detalhes
            ,cast(salesorderid as int) as fk_pedido
            ,cast(productid as int) as fk_produto
            ,cast(orderqty as int) as quantidade
            ,cast(unitprice as float) as preco_da_unidade
            ,cast(unitpricediscount as float) as desconto_perc
        from {{ source("aw", "salesorderdetail") }}
    )
select *
from fonte_ordem_detalhes