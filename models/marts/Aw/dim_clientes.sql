with
    cliente as (
        select *
        from {{ ref('stg_aw__cliente') }}
    ),
    pessoa as (
        select * 
        from {{ ref("stg_aw__pessoa") }}
    
    ),

    joined as (
        select
            cl.pk_cliente
            ,cl.fk_pessoa
            ,ps.pk_pessoa
            ,cl.fk_loja
            ,cl.fk_territorio
            ,ps.tipo_pessoa
            ,ps.primeiro_nome
            ,ps.ultimo_nome
        from cliente as cl
        left join pessoa        as ps  on cl.fk_pessoa = ps.pk_pessoa

    )
select *
from joined