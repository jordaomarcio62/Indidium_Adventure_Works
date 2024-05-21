with
    fonte_vendedores as (
        select
            cast(businessentityid  as  int) as  fk_pessoa
            ,cast(territoryid  as  int) as  fk_territorio
            ,cast(salesquota as  int) as  cota_vendas
            ,cast(bonus  as  int) as  bonus
            ,cast(commissionpct  as  float) as  comissao_pct
            ,cast(salesytd  as  float) as  vendas_acumuladas
            ,cast(saleslastyear as  float) as  vendas_ult_ano
            ,cast(rowguid  as  varchar) as  rowguid 
            ,cast(modifieddate  as  date) as  data_modificacao
        from {{ source("aw", "Salesperson") }}
    )
select *
from fonte_vendedores