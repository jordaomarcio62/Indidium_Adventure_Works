with
    fonte_pessoa as (
        select
            cast(businessentityid as  int) as  pk_pessoa
            ,cast(persontype  as  varchar) as  tipo_pessoa
            ,cast(namestyle  as  boolean) as  nome_estilo
            ,cast(title as  varchar) as  titulo
            ,cast(firstname  as  varchar) as  primeiro_nome
            ,cast(middlename  as  varchar) as  nome_do_meio
            ,cast(lastname  as  varchar) as  ultimo_nome
            ,cast(suffix  as  varchar) as  sufixo
            ,cast(emailpromotion  as  int) as  email_promocao
            ,cast(additionalcontactinfo  as  varchar) as  contato_adcional
            ,cast(demographics  as  varchar) as  demografica
            ,cast(rowguid  as  varchar) as  rowguid
            ,cast(modifieddate  as  date) as  data_modificacao
        from {{ source("aw", "Person") }}
    )
select *
from fonte_pessoa