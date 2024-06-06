    with
    pedido_por_itens as (
        select *
        from FEA24_4.dbt_mjordao.int_pedido_por_itens
    )
    , dim_produtos as (
        select *
        from FEA24_4.dbt_mjordao.dim_produtos
    )
    , dim_vendedores as (
        select *
        from FEA24_4.dbt_mjordao.dim_vendedores
    )
    , joined as (
        select
			fatos.sk_vendas
			,fatos.fk_pedido as numero_nota_fiscal
			,fatos.fk_produto
			,fatos.fk_vendedor
			,fatos.fk_cliente
			,fatos.fk_territorio
			,fatos.fk_endereco_da_conta
			,fatos.fk_endereco_de_envio
			,fatos.fk_metodo_envio
			,fatos.fk_cartao_credito
			,fatos.fk_cambio
			,fatos.desconto_perc
			,fatos.preco_da_unidade
			,fatos.quantidade
			,fatos.data_pedido
			,fatos.frete
			,fatos.data_envio
			,fatos.data_vencimento
			,fatos.numero_revisao
			,fatos.status
			,fatos.flag_pedido
			,fatos.numero_compra_pedido
			,fatos.conta
			,fatos.cod_aprovacao
			,fatos.subtotal
			,fatos.imposto
			,fatos.total
			,fatos.comente
			,dim_produtos.nome_produto
			,dim_produtos.numero_produto
			,dim_produtos.fk_sub_categoria
			,dim_produtos.pk_produto
			,dim_produtos.fk_modelo_produto
			,dim_vendedores.fk_pessoa

        from pedido_por_itens as fatos
        left join dim_produtos on fatos.fk_produto = dim_produtos.pk_produto
        left join dim_vendedores on fatos.fk_vendedor = dim_vendedores.fk_pessoa
    )
    , metricas as (
        select
			sk_vendas
			,numero_nota_fiscal
			,fk_produto
			,fk_vendedor
			,fk_cliente
			,fk_territorio
			,fk_endereco_da_conta
			,fk_endereco_de_envio
			,fk_metodo_envio
			,fk_cartao_credito
			,fk_cambio
			,fk_sub_categoria
			,pk_produto
			,fk_modelo_produto
			,fk_pessoa
			,preco_da_unidade
			,quantidade
			,data_pedido
			,data_envio
			,data_vencimento
			,numero_revisao
			,status
			,flag_pedido
			,numero_compra_pedido
			,conta
			,cod_aprovacao
			,subtotal
			,imposto
			,total
			,comente
			,nome_produto
			,numero_produto
            , quantidade * preco_da_unidade as valor_bruto
            ,desconto_perc
            , quantidade * (1 - desconto_perc) * preco_da_unidade as valor_liquido
            , cast(
                frete / count(numero_nota_fiscal) over (partition by numero_nota_fiscal)
                as numeric(18,2)
            ) as frete_rateado
        from joined
    )
select *
from metricas