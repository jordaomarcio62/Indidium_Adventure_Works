with
    fonte_provincia as (
        select
            cast(stateprovinceid as  int) as  pk_provincia
            ,cast(territoryid as  int) as  fk_terrirorio
            ,cast(countryregioncode  as  varchar) as  fk_codigo_pais_regiao
            ,cast(stateprovincecode as  varchar) as  codigo_provincia
            ,cast(isonlystateprovinceflag  as  boolean) as  flag_provincia
            ,cast(name  as  varchar) as  nome
            ,cast(rowguid  as  varchar) as  rowguid
            ,cast(modifieddate  as  date) as  data_modificacao
        from {{ source("aw", "Stateprovince") }}
    )
select *
from fonte_provincia