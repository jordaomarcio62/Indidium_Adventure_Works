with
    endereco as (
        select *
        from {{ ref('stg_aw__endereco') }}
    ),
    provincia as (
        select * 
        from {{ ref("stg_aw__provincia") }}
    ),
    pais_regiao as (
        select * 
        from {{ref("stg_aw__pais_regiao")}}
    ),

    joined as (
        select

            ed.pk_endereco
            ,ed.fk_provincia
            ,ed.enderco_1
            ,ed.endeco_2
            ,ed.cidade
            ,ed.codigo_postal
            ,ed.localizacao
            ,prs.fk_terrirorio
            ,prs.fk_codigo_pais_regiao
            ,prs.codigo_provincia
            ,prs.flag_provincia
            ,prs.nome
            ,pr.pk_codigo_pais_regiao
            ,pr.name as pais


        from endereco               as ed
        left join provincia         as prs  on ed.fk_provincia = prs.pk_provincia
        left join pais_regiao       as pr   on prs.fk_codigo_pais_regiao = pr.pk_codigo_pais_regiao
    )
select *
from joined