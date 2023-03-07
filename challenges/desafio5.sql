SELECT m.music_name AS 'cancao', COUNT(h.music_id) AS 'reproducoes' 
FROM musics AS m
	INNER JOIN user_history AS h ON h.music_id = m.music_id
    GROUP BY h.music_id
    ORDER BY reproducoes DESC, cancao LIMIT 2;