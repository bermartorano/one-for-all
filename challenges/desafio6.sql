SELECT 
	CAST(FORMAT(MIN(p.price), 2) AS CHAR) AS 'faturamento_minimo',
	CAST(ROUND(MAX(p.price), 2) AS CHAR) AS 'faturamento_maximo',
	CAST(ROUND(AVG(p.price) , 2) AS CHAR) AS 'faturamento_medio',
	CAST(ROUND(SUM(p.price), 2) AS CHAR) AS 'faturamento_total'
FROM users AS u
	INNER JOIN plans AS p ON u.plan_id = p.plan_id;