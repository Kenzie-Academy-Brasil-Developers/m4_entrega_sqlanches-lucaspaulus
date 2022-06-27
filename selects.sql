-- Aqui você deve colocar os códigos SQL referentes às
-- Seleções de dados

-- 1)
    SELECT 
        ped.id,
        ped.status,
        ped.cliente_id,
        prod.id,
        prod.nome,
        prod.tipo,
        prod.preco,
        prod.pts_de_lealdade
    FROM
        pedidos ped
    JOIN
        produtos_pedidos prodped ON ped.id = prodped.pedido_id
    JOIN
        produtos prod ON prodped.produto_id = prod.id; 

-- 2)
    SELECT 		
        ped.id
    FROM
        pedidos ped

    JOIN
        produtos_pedidos prodped ON ped.id = prodped.pedido_id
    JOIN
        produtos prod ON prodped.produto_id = prod.id
    WHERE 
        prod.nome LIKE '%Fritas';

-- 3)
    SELECT
        c.nome AS gostam_de_fritas
    FROM
        clientes c
    JOIN
        pedidos ped ON c.id = ped.cliente_id
    JOIN
        produtos_pedidos prodped ON ped.id = prodped.pedido_id
    JOIN
        produtos prod ON prodped.produto_id = prod.id
    WHERE 
        prod.nome LIKE '%Fritas';

-- 4)
    SELECT
        SUM(prod.preco)
    FROM 
        pedidos ped
    JOIN 
        clientes c ON c.id = ped.cliente_id
    JOIN
        produtos_pedidos prodped ON ped.id = prodped.pedido_id
    JOIN
        produtos prod ON prodped.produto_id = prod.id
    WHERE 
        c.nome = 'Laura';

-- 5)
    SELECT
        prod.nome,
        COUNT(prod.id)

    FROM
        produtos prod
    JOIN 
        produtos_pedidos prodped ON prodped.produto_id = prod.id
    GROUP BY
        prod.id ORDER BY prod.nome;