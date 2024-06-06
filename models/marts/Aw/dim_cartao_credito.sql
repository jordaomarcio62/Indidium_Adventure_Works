with
    fonte_cartao_credito as (
        select *
        from {{ ref('stg_aw__cartaocredito') }}
    ),

    joined as (
        select
            *
        from fonte_cartao_credito as cc
     

    )
select *
from joined