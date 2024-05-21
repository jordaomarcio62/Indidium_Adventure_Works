with
    fonte_motivo_venda as (
        select
            cast(salesreasonid as  int) as  pk_motivo_venda
            ,cast(name  as  varchar) as  nome
            ,cast(reasontype  as  varchar) as  tipo_motivo
            ,cast(modifieddate as  date) as  data_modificacao

        from {{ source("aw", "Salesreason") }}
    )
select *
from fonte_motivo_venda