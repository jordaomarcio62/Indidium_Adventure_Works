with
    fonte_cliente as (
        select
            cast(customerid as  int) as  pk_cliente
            ,cast(personid  as  int) as  fk_pessoa
            ,cast(storeid as  int) as  fk_loja
            ,cast(territoryid as  int) as  fk_territorio
            ,rowguid 
            ,cast(modifieddate  as  date) as  data_modificacao
        from {{ source("aw", "Customer") }}
    )
select *
from fonte_cliente