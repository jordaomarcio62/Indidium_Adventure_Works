with
    fonte_cartao_credito as (
        select
            cast(creditcardid as  int) as  pk_cartao_credito
            ,cast(cardtype as  varchar) as  tipo_cartao
            ,cast(cardnumber as  int) as  numero_cartao
            ,cast(expmonth as  int) as  mes_exp
            ,cast(expyear  as  int) as  ano_exp
            ,cast(modifieddate as  date) as  data_modificacao
        from {{ source("aw", "creditcard") }}
    )
select *
from fonte_cartao_credito