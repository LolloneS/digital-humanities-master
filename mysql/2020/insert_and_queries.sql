-- Rimborso: ID  docente  euro 
-- SELECT * FROM rimborso;

-- WHERE: filtrare i risultati secondo una condizione (booleana)

/*
SELECT id
FROM docente
WHERE nome = "Elena" AND cognome = "Vivan";
*/


/*
SELECT *
FROM studente
WHERE nome="Lorenzo" OR cognome="Prova";
*/


/*
A    B      A AND B     A OR B
------------------------------
F    F         F           F
F    V         F           V
V    F         F           V
V    V         V           V
*/

/*
SELECT *
FROM docente JOIN rimborso
ON docente.id = rimborso.docente_id;
*/


/*
SELECT d.id AS id_docente,
       d.nome AS nome_docente,
	   d.cognome AS cognome_docente,
       r.euro AS euro_rimborso
FROM docente AS d JOIN rimborso AS r
ON d.id = r.docente_id;
*/

/*
SELECT a.nome AS nome_aula
FROM aula a JOIN corso_materia AS c
ON a.id = c.aula_id;
*/

/*
SELECT DISTINCT d.id AS id_docente,
       d.nome AS nome_docente,
	   d.cognome AS cognome_docente
FROM docente AS d JOIN rimborso AS r
ON d.id = r.docente_id;
*/

/*
SELECT DISTINCT d.id AS id_docente,
       d.nome AS nome_docente,
	   d.cognome AS cognome_docente,
       COUNT(r.euro) AS numero_rimborsi
FROM docente AS d JOIN rimborso AS r
ON d.id = r.docente_id;
*/

/*
SELECT DISTINCT d.id AS id_docente,
       d.nome AS nome_docente,
	   d.cognome AS cognome_docente,
       SUM(r.euro) AS rimborso_totale
FROM docente AS d JOIN rimborso AS r
ON d.id = r.docente_id;
*/

/*
SELECT DISTINCT d.id AS id_docente,
       d.nome AS nome_docente,
	   d.cognome AS cognome_docente,
       AVG(r.euro) AS rimborso_medio
FROM docente AS d JOIN rimborso AS r
ON d.id = r.docente_id;


SELECT ....
FROM ....
WHERE ...
GROUP BY ... ;
*/



/*
SELECT DISTINCT COUNT(s.matricola) AS numero_iscritti, c.nome
FROM studente AS s JOIN corso_laurea AS c
ON s.corso_laurea_id = c.id
GROUP BY s.corso_laurea_id
ORDER BY COUNT(s.matricola) DESC;
*/

/*
LOAD DATA INFILE "C:/Users/Lorenzo/Desktop/prova.txt"
INTO TABLE aula
FIELDS TERMINATED BY ','
IGNORE 1 ROWS;
*/


/*
SELECT DISTINCT COUNT(s.matricola) AS numero_iscritti, c.nome
FROM studente AS s JOIN corso_laurea AS c
ON s.corso_laurea_id = c.id
GROUP BY s.corso_laurea_id
HAVING COUNT(s.matricola) > 2
ORDER BY COUNT(s.matricola) DESC;
*/
/*
1 2 3 4 5
2 4 5
--> 1 3
*/

/*
SELECT a.nome AS nome_aula
FROM aula a
WHERE a.nome NOT IN (
	SELECT a2.nome AS nome_aula
	FROM aula a2 JOIN corso_materia AS c
	ON a2.id = c.aula_id
);
*/