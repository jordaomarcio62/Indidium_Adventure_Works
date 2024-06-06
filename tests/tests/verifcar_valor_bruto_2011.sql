with 
verifica_valor as (
select 
    cast(sum(valor_bruto) as  numeric(18,2)) as valor_bruto
from {{ ref('fct_pedidos') }}
    where year(data_pedido) = 2011
)
SELECT
    valor_bruto
FROM   verifica_valor
    WHERE
        valor_bruto != 12646112.16





