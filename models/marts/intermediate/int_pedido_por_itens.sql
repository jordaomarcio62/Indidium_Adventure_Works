with
    ordens as (
        select *
        from {{ ref('stg_aw__ordem') }}
    )
    , ordem_detalhes as (
        select *
        from {{ ref('stg_aw__ordem_detalhes') }}
    )
    , joined as (
        select
            ordem_detalhes.fk_pedido
            ,ordem_detalhes.fk_produto
            ,ordens.fk_pessoa as fk_vendedor
            ,ordens.fk_territorio
            ,ordens.fk_endereco_da_conta
            ,ordens.fk_endereco_de_envio
            ,ordens.fk_metodo_envio
            ,ordens.fk_cartao_credito
            ,ordens.fk_cambio
            ,ordens.fk_cliente
            ,ordem_detalhes.quantidade
            ,ordem_detalhes.preco_da_unidade
            ,ordem_detalhes.desconto_perc
            ,ordens.numero_revisao
            ,ordens.data_pedido
            ,ordens.data_vencimento
            ,ordens.data_envio
            ,ordens.status
            ,ordens.flag_pedido
            ,ordens.numero_compra_pedido
            ,ordens.conta
            ,ordens.cod_aprovacao
            ,ordens.subtotal
            ,ordens.imposto
            ,ordens.frete
            ,ordens.total
            ,ordens.comente
        from ordem_detalhes
        left join ordens on ordem_detalhes.fk_pedido = ordens.pk_pedido
    )
    , criada_chave_primaria as (
        select
            cast(FK_PEDIDO as varchar) || '-' || FK_PRODUTO::varchar as sk_vendas
            , *
        from joined
    )
select *
from criada_chave_primaria