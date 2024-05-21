with
    fonte_produtos as (
        select
            cast(productid as  int) as  pk_produto
            ,cast(productsubcategoryid as  int) as  fk_sub_categoria
            ,cast(productmodelid  as  int) as  fk_modelo_produto            
            ,cast(name  as  varchar) as  nome_produto
            ,cast(productnumber as  varchar) as  numero_produto
            ,cast(makeflag as  boolean) as  produto_em_producao
            ,cast(finishedgoodsflag  as  boolean) as  produto_acabado
            ,cast(color  as  varchar) as  cor
            ,cast(safetystocklevel  as  int) as  nivel_estoque
            ,cast(reorderpoint  as  int) as  ponto_de_reencomenda
            ,cast(standardcost  as  float) as  custo_padrao
            ,cast(listprice as  float) as  preco_lista
            ,cast(size  as  varchar) as  tamanho
            ,cast(sizeunitmeasurecode  as  varchar) as  codigo_tamanho
            ,cast(weightunitmeasurecode as  varchar) as  codigo_peso
            ,cast(weight  as  float) as  peso
            ,cast(daystomanufacture as  int) as  dias_para_fabricacao
            ,cast(productline  as  varchar) as  linha_de_produto
            ,cast(class  as  varchar) as  classe
            ,cast(style  as  varchar) as  estilo
            ,cast(sellstartdate as  date) as  data_inicio_venda
            ,cast(sellenddate as  date) as  data_fim_venda
            ,cast(rowguid as  varchar) as  rowguid
            ,cast(modifieddate  as  date) as  data_modificacao
        from {{ source("aw", "Product") }}
    )
select *
from fonte_produtos