SELECT COUNT(*) AS 'musicas_no_historico'
FROM user_history AS h
	INNER JOIN users AS u ON u.user_id = h.user_id
		WHERE u.user_name = 'Barbara Liskov';