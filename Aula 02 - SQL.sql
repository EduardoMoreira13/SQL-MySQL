-- COMANDO COUNT

SELECT *
FROM banco.clientes;

SELECT COUNT(*)
FROM banco.clientes;

SELECT COUNT(Nome), COUNT(Qtd_Filhos)
FROM banco.clientes;

SELECT COUNT(DISTINCT Nome), COUNT(DISTINCT Qtd_Filhos)
FROM banco.clientes;


-- COMANDO LIMIT - SUBSTITUI O TOP

SELECT *
FROM banco.clientes
LIMIT 10;

SELECT *
FROM banco.clientes
WHERE Renda_Anual < 60000
LIMIT 10;


-- COMANDO ORDER

SELECT *
FROM banco.clientes
ORDER BY Renda_Anual
LIMIT 10;

SELECT *
FROM banco.clientes
WHERE Renda_Anual < 60000
ORDER BY Renda_Anual ASC, Nome DESC
LIMIT 10;


-- COMANDO BETWEEN

SELECT Nome, Sobrenome, Renda_Anual
FROM banco.clientes
WHERE Renda_Anual BETWEEN 30000 AND 80000;

SELECT Nome, Sobrenome, Renda_Anual
FROM banco.clientes
WHERE Renda_Anual NOT BETWEEN 30000 AND 80000;

SELECT Nome, Sobrenome, Renda_Anual, Data_Nascimento
FROM banco.clientes
WHERE Data_Nascimento BETWEEN '1985-01-01' AND '1985-12-31';


-- COMANDO IN

SELECT Nome, Sobrenome, Renda_Anual
FROM banco.clientes
WHERE Renda_Anual IN (30000,70000);

SELECT Nome, Sobrenome, Renda_Anual
FROM banco.clientes
WHERE Renda_Anual NOT IN (30000,70000);


-- COMANDO LIKE

SELECT Nome, Sobrenome
FROM banco.clientes
WHERE Nome like 'ab%'; -- comeca com

SELECT Nome, Sobrenome
FROM banco.clientes
WHERE Nome like '%R'; -- termina com

SELECT Nome, Sobrenome 
FROM banco.clientes
WHERE Nome like '%be%'; -- contem