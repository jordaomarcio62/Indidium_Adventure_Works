with
    fonte_pedido_motivo_venda as (
        select
            cast(salesorderid as  int) as  fk_pedido
            ,cast(salesreasonid as  int) as  fk_motivo_venda
            ,cast(modifieddate  as  date) as  data_modificacao
        from {{ source("aw", "Salesorderheadersalesreason") }}
    )
select *
from fonte_pedido_motivo_venda