SELECT u.user_name AS 'pessoa_usuaria', IF(MAX(h.reproduction_date) > '2020-12-31 23:59:59', 'Ativa', 'Inativa') AS 'status_pessoa_usuaria'
	FROM users AS u
		INNER JOIN user_history AS h ON u.user_id = h.user_id
	GROUP BY h.user_id
    ORDER BY pessoa_usuaria;
