with
    fonte_pais_regiao
     as (
        select
            cast(countryregioncode as  varchar) as  pk_codigo_pais_regiao
            ,cast(name  as  varchar) as  name
            ,cast(modifieddate  as  date) as  data_modificacao

        from {{ source("aw", "countryregion") }}
    )
select *
from fonte_pais_regiao
