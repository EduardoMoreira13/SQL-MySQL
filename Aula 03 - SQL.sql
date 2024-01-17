-- COMANDO AS 

SELECT Nome AS Name, Nome AS 'Name', Sobrenome AS 'Last Name'
FROM banco.clientes;


-- FORMULAS ESTATISTICAS BASICAS

SELECT *
FROM banco.clientes;

SELECT SUM(Renda_Anual) AS Soma
FROM banco.clientes;

SELECT AVG(Renda_Anual) AS Media
FROM banco.clientes;

SELECT MIN(Renda_Anual) AS Minimo
FROM banco.clientes;

SELECT MAX(Renda_Anual) AS Maximo
FROM banco.clientes;


-- GROUP BY

SELECT *
FROM banco.clientes;

SELECT Sexo, AVG(Renda_Anual) AS Media
FROM banco.clientes
GROUP BY Sexo;

SELECT Sexo, Estado_Civil, AVG(Renda_Anual) AS Media
FROM banco.clientes
GROUP BY Sexo, Estado_Civil;

SELECT Sexo, Estado_Civil, COUNT(Sexo) AS Contagem
FROM banco.clientes
GROUP BY Sexo, Estado_Civil;

SELECT Sexo, Estado_Civil, AVG(Renda_Anual) AS Media
FROM banco.clientes
WHERE Renda_Anual < 70000
GROUP BY Sexo, Estado_Civil
ORDER BY Media ASC;


-- COMANDO HAVING

SELECT Sexo, Estado_Civil, AVG(Renda_Anual) AS Media
FROM banco.clientes
WHERE Renda_Anual < 70000
GROUP BY Sexo, Estado_Civil
HAVING Media < 40000
ORDER BY Media ASC;

SELECT Sexo, Estado_Civil, COUNT(Sexo) AS Contagem
FROM banco.clientes
GROUP BY Sexo, Estado_Civil
HAVING Contagem <= 29 AND Sexo = 'F';

