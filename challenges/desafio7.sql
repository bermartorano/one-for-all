SELECT a.artist_name AS 'artista', al.album_name AS 'album', COUNT(f.user_id) AS 'pessoas_seguidoras'
FROM
	followers AS f
    INNER JOIN artists AS a ON a.artist_id = f.artist_id
    INNER JOIN albuns AS al ON a.artist_id = al.artist_id
GROUP BY al.album_name, a.artist_name
ORDER BY pessoas_seguidoras DESC, artista, album;