SELECT
	u.user_name AS 'pessoa_usuaria', COUNT(h.music_id) AS 'musicas_ouvidas', ROUND(SUM(m.music_length/60), 2) AS 'total_minutos'
FROM 
	users AS u
		INNER JOIN user_history AS h ON u.user_id = h.user_id
		INNER JOIN musics AS m ON m.music_id = h.music_id
GROUP BY u.user_id
ORDER BY pessoa_usuaria;