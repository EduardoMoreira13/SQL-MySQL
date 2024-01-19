-- SUBQUERIES

SELECT Data_Venda, Receita_Venda / (SELECT SUM(Receita_Venda) FROM banco.pedidos) AS 'Soma'
FROM banco.pedidos
ORDER BY Data_Venda;

SELECT Data_Venda, Receita_Venda
FROM banco.pedidos
WHERE Receita_Venda > (SELECT AVG(Receita_Venda) FROM banco.pedidos)
ORDER BY Data_Venda;

SELECT ID_Produto, Receita_Venda
FROM (SELECT ID_Pedido, ID_Produto, Receita_Venda FROM banco.pedidos WHERE Receita_Venda > 500) AS tabela1
ORDER BY ID_Produto;



-- COMMIT E ROLLBACK

ROLLBACK; -- DESFAZ ALTERACOES DE UM BANCO DE DADOS

COMMIT; -- SALVA EM DEFINITIVO AS ALTERACOES DE UM BANCO DE DADOS



-- -- -- -- -- -- -- -- -- --
-- -- FUNCOES DE JANELA -- --
-- -- -- -- -- -- -- -- -- --



-- MEDIA MOVEL

SELECT Data_Venda, Receita_Venda, 
AVG(Receita_Venda) OVER(ORDER BY Data_Venda ROWS BETWEEN 3 PRECEDING AND 0 FOLLOWING) AS 'Media Movel'
FROM banco.pedidos
ORDER BY Data_Venda;

SELECT Data_Venda, Receita_Venda, 
AVG(Receita_Venda) OVER(ORDER BY Data_Venda ROWS BETWEEN 3 PRECEDING AND 3 FOLLOWING) AS 'Media Movel'
FROM banco.pedidos
ORDER BY Data_Venda;



-- SOMA ACUMULADA

SELECT Data_Venda, Receita_Venda, 
SUM(Receita_Venda) OVER(ORDER BY Data_Venda ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW) AS 'Soma Acumulada'
FROM banco.pedidos
ORDER BY Data_Venda;

SELECT Data_Venda, Receita_Venda / (SELECT SUM(Receita_Venda) FROM banco.pedidos) AS 'SOMA',
SUM(Receita_Venda / (SELECT SUM(Receita_Venda) FROM banco.pedidos)) OVER(ORDER BY Data_Venda ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW) AS 'Soma Acumulada'
FROM banco.pedidos
ORDER BY Data_Venda;


-- VETORIZACAO DE UMA INFORMACAO AGRUPADA

SELECT *
FROM banco.pedidos;

SELECT AVG(Receita_Venda) AS 'Media'
FROM banco.pedidos;

SELECT ID_Produto, AVG(Receita_Venda) AS 'Media' -- AGRUPA
FROM banco.pedidos
GROUP BY ID_Produto;

SELECT ID_Produto, AVG(Receita_Venda) OVER() AS 'Media' -- REPETE A INFORMACAO
FROM banco.pedidos
ORDER BY ID_Produto;

SELECT ID_Produto, AVG(Receita_Venda) OVER(PARTITION BY ID_Produto) AS 'Media' -- REPETE A INFORMACAO POR GRUPO
FROM banco.pedidos
ORDER BY ID_Produto;


-- PERCENTUAL EM RELACAO AO TOTAL

SELECT ID_Produto, Receita_Venda, SUM(Receita_Venda) OVER() AS 'Total',
Receita_Venda /  SUM(Receita_Venda) OVER() AS 'Percentual'
FROM banco.pedidos
ORDER BY ID_Produto;

SELECT ID_Produto, Receita_Venda, SUM(Receita_Venda) OVER(PARTITION BY ID_Produto) AS 'Total',
Receita_Venda /  SUM(Receita_Venda) OVER(PARTITION BY ID_Produto) AS 'Percentual'
FROM banco.pedidos
ORDER BY ID_Produto;

SELECT ID_Produto, Receita_Venda, Receita_Venda / (SELECT SUM(Receita_Venda) FROM banco.pedidos) 
FROM banco.pedidos
ORDER BY ID_Produto;


-- CRIACAO DE UM RANKING

SELECT ID_Produto, Receita_Venda, 
RANK() OVER(ORDER BY Receita_Venda DESC) AS 'Rank' -- CONSIDERA EMPATES
FROM banco.pedidos;

SELECT ID_Produto, Receita_Venda, 
DENSE_RANK() OVER(ORDER BY Receita_Venda DESC) AS 'Rank' -- CONSIDERA EMPATES, MAS MANTEM SEQUENCIA
FROM banco.pedidos;

SELECT ID_Loja, Receita_Venda,
DENSE_RANK() OVER(PARTITION BY ID_Loja  ORDER BY Receita_Venda DESC) AS 'Rank' -- CONSIDERA EMPATES, MAS MANTEM SEQUENCIA
FROM banco.pedidos;


-- ANALISE MoM E YoY

SELECT Data_Venda, Receita_Venda, LAG(Receita_Venda, 1, 0) OVER(ORDER BY Data_Venda) AS 'Desloc'
FROM banco.pedidos
ORDER BY Data_Venda;

SELECT Data_Venda, Receita_Venda, LEAD(Receita_Venda, 2, 0) OVER(ORDER BY Data_Venda) AS 'Desloc'
FROM banco.pedidos
ORDER BY Data_Venda;


-- CASE WHEN 

SELECT *
FROM produtos;

SELECT Nome_Produto, Preco_Unit,
       CASE WHEN Preco_Unit <=1000 THEN  'Classe A'
            WHEN Preco_Unit <=2000 AND Preco_Unit > 1000 THEN  'Classe B'
            ELSE 'Classe C'
            END AS Classificacao
FROM produtos;

SELECT Nome_Produto, Preco_Unit,
       CASE WHEN Preco_Unit <=1000 THEN  'Classe A'
            WHEN Preco_Unit <=2000 THEN  'Classe B'
            ELSE 'Classe C'
            END AS Classificacao
FROM produtos;

SELECT Nome, Telefone, Data_Nascimento, datediff(now(), Data_Nascimento),
       CASE WHEN Telefone is null THEN  'Ausente'
            ELSE 'Confirmado'
            END AS Indicacao,
	   CASE WHEN datediff(now(), Data_Nascimento) > 10000 THEN  'Maior'
       ELSE 'Menor'
       END AS Diferenca
FROM clientes;

SELECT Nome_Produto, Preco_Unit,
       CASE WHEN Preco_Unit <=1000 THEN  (Preco_Unit + 300)
            WHEN Preco_Unit <=2000 THEN  (Preco_Unit + 100)
            ELSE Preco_Unit
            END AS Classificacao
FROM produtos;

SELECT Nome_Produto, Preco_Unit, IF(Preco_Unit <=1000, Preco_Unit + 300, Preco_Unit) As Preco,
       CASE WHEN Preco_Unit <=1000 THEN  (Preco_Unit + 300)
            WHEN Preco_Unit <=2000 THEN  (Preco_Unit + 100)
            ELSE Preco_Unit
            END AS Classificacao
FROM produtos;


-- COMANDO TRIM

SELECT Nome_Produto, concat('    ', Nome_Produto) AS A, ltrim(concat('    ', Nome_Produto)) AS AA, 
       concat(Nome_Produto, '    ') AS B, ltrim(concat(Nome_Produto, '    ')) AS BB,
	   concat('   ', Nome_Produto, '   ') AS C, TRIM(concat('   ', Nome_Produto, '   ')) AS CC
FROM produtos;





