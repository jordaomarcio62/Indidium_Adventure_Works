with
    funcionarios as (
        select *
        from {{ ref('stg_aw__funcionarios') }}
    ),
    pessoa as (
        select * 
        from {{ ref("stg_aw__pessoa") }}
    ),
    vendedores as (
        select * 
        from {{ref("stg_aw__vendedores")}}
    ),

    joined as (
        select
            vd.fk_pessoa
            ,vd.fk_territorio
            ,vd.cota_vendas
            ,vd.bonus
            ,vd.comissao_pct
            ,vd.vendas_acumuladas
            ,vd.vendas_ult_ano
            ,fc.id_login
            ,fc.cargo
            ,fc.organizacao
            ,ps.tipo_pessoa
            ,ps.primeiro_nome
            ,ps.ultimo_nome
        from vendedores as vd
        left join pessoa        as ps  on vd.fk_pessoa = ps.pk_pessoa
        left join funcionarios  as fc  on ps.pk_pessoa = fc.fk_pessoa
    )
select *
from joined