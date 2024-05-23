with
    pedido_motivo_venda as (
        select *
        from {{ ref('stg_aw__pedido_motivo_venda') }}
    ),
    motivo_venda as (
        select * 
        from {{ ref("stg_aw__motivo_venda") }}
    
    ),

    joined as (
        select
            pmv.fk_pedido
            ,pmv.fk_motivo_venda
            ,pm.nome
            ,pm.tipo_motivo
        from pedido_motivo_venda          as pmv
        left join motivo_venda            as pm  on pmv.fk_motivo_venda = pm.pk_motivo_venda

    )
select *
from joined