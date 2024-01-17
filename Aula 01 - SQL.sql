-- COMANDO SELECT

SELECT * 
FROM banco.pedidos;

SELECT ID_Pedido, ID_Cliente, Receita_Venda 
FROM banco.pedidos;


-- COMANDO DISTINCT
SELECT ID_Cliente, Nome
FROM banco.clientes;

SELECT DISTINCT Nome
FROM banco.clientes;


-- COMANDO WHERE E CONDICOES

SELECT *
FROM banco.clientes;

SELECT Nome, Sobrenome, Renda_Anual
FROM banco.clientes
WHERE Renda_Anual > 50000;

SELECT Nome, Sobrenome, Renda_Anual
FROM banco.clientes
WHERE Renda_Anual >= 30000;

SELECT Nome, Sobrenome, Renda_Anual
FROM banco.clientes
WHERE Renda_Anual = 30000;

SELECT Nome, Sobrenome, Renda_Anual
FROM banco.clientes
WHERE Renda_Anual <> 30000;

SELECT Nome, Sobrenome, Renda_Anual
FROM banco.clientes
WHERE Renda_Anual > 30000 AND Renda_Anual < 80000;

SELECT Nome, Sobrenome, Renda_Anual
FROM banco.clientes
WHERE Renda_Anual = 30000 OR Renda_Anual = 70000;

SELECT Nome, Sobrenome, Renda_Anual
FROM banco.clientes
WHERE Renda_Anual > 30000 AND Telefone IS NULL;

SELECT Nome, Sobrenome, Renda_Anual
FROM banco.clientes
WHERE Renda_Anual > 30000 AND Telefone IS NOT NULL;

SELECT Nome, Sobrenome, Renda_Anual
FROM banco.clientes
WHERE Renda_Anual IN (30000,70000);

SELECT Nome, Sobrenome, Renda_Anual
FROM banco.clientes
WHERE Renda_Anual NOT IN (30000,70000);

SELECT Nome, Sobrenome, Renda_Anual
FROM banco.clientes
WHERE Nome = 'ALEJANDRO';