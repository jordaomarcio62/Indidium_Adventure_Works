with
    fonte_ordem as (
        select
            cast(salesorderid  as  int) as  pk_pedido
            ,cast(salespersonid as  int) as  fk_pessoa
            ,cast(territoryid as  int) as  fk_territorio
            ,cast(billtoaddressid  as  int) as  fk_endereco_da_conta
            ,cast(shiptoaddressid  as  int) as  fk_endereco_de_envio
            ,cast(shipmethodid  as  int) as  fk_metodo_envio
            ,cast(creditcardid  as  int) as  fk_cartao_credito
            ,cast(currencyrateid  as  int) as  fk_cambio
            ,cast(customerid  as  int) as  fk_cliente
            ,cast(revisionnumber  as  int) as  numero_revisao
            ,cast(orderdate  as  date) as  data_pedido
            ,cast(duedate  as  date) as  data_vencimento
            ,cast(shipdate  as  date) as  data_envio
            ,cast(status  as  int) as  status
            ,cast(onlineorderflag  as  boolean) as  flag_pedido
            ,cast(purchaseordernumber  as  varchar) as  numero_compra_pedido
            ,cast(accountnumber as  varchar) as  conta
            ,cast(creditcardapprovalcode as  varchar) as  cod_aprovacao
            ,cast(subtotal  as  float) as  subtotal
            ,cast(taxamt as  float) as  imposto
            ,cast(freight  as  float) as  frete
            ,cast(totaldue  as  float) as  total
            ,cast(comment as  int) as  comente
            ,cast(rowguid  as  varchar) as  rowguid
            ,cast(modifieddate  as  date) as  data_modificacao
        from {{ source("aw", "salesorderheader") }}
    )
select *
from fonte_ordem