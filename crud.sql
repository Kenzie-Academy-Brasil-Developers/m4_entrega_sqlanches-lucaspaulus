-- Aqui você deve colocar os códigos SQL referentes às
-- Simulações de um CRUD

-- Criação

-- 1)
INSERT INTO clientes 
    (nome, lealdade)
VALUES
    ('Georgia', 0);


-- 2)
INSERT INTO pedidos
	(status, cliente_id)
VALUES
	('Recebido', 6);


-- 3)
INSERT INTO produtos_pedidos
	(pedido_id, produto_id)
VALUES
	((SELECT id FROM clientes WHERE nome = 'Georgia'), (SELECT id FROM produtos WHERE nome = 'Big Serial')),
    ((SELECT id FROM clientes WHERE nome = 'Georgia'), (SELECT id FROM produtos WHERE nome = 'Varchapa')),
    ((SELECT id FROM clientes WHERE nome = 'Georgia'), (SELECT id FROM produtos WHERE nome = 'Fritas')),
    ((SELECT id FROM clientes WHERE nome = 'Georgia'), (SELECT id FROM produtos WHERE nome = 'Coca-Cola')),
    ((SELECT id FROM clientes WHERE nome = 'Georgia'), (SELECT id FROM produtos WHERE nome = 'Coca-Cola'));
    


-- Leitura

-- 1)
SELECT
  c.*,
  ped.*,
  prod.*
FROM clientes c
INNER JOIN pedidos ped ON c.id = ped.cliente_id
INNER JOIN produtos_pedidos prodped ON ped.id = prodped.pedido_id
INNER JOIN produtos prod ON prod.id = prodped.produto_id
WHERE c.nome = 'Georgia';

-- Atualização

-- 1)

UPDATE
	clientes
	SET
lealdade = (
	SELECT SUM(prod.pts_de_lealdade) total
  	FROM produtos AS prod
  	JOIN produtos_pedidos prodped ON prod.id = prodped.produto_id
  	JOIN pedidos ped ON prodped.pedido_id = ped.id
  	JOIN clientes c ON ped.cliente_id = c.id
  	WHERE c.nome = 'Georgia'
)

WHERE nome = 'Georgia';

-- Deleção

-- 1)
DELETE FROM
  clientes
WHERE
  nome LIKE 'Marcelo'

