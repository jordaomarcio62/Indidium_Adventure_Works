with
    fonte_endereco as (
        select
            cast(addressid as  int) as  pk_endereco
            ,cast(stateprovinceid  as  int) as  fk_provincia
            ,cast(addressline1 as  varchar) as  enderco_1
            ,cast(addressline2 as  varchar) as  endeco_2
            ,cast(city  as  varchar) as  cidade
            ,cast(postalcode as  varchar) as  codigo_postal
            ,cast(spatiallocation  as  varchar) as  localizacao
            ,cast(rowguid as  varchar) as  rowguid
            ,cast(modifieddate  as  date) as  data_modificacao
        from {{ source("aw", "Address") }}
    )
select *
from fonte_endereco