SELECT a.artist_name AS 'artista', al.album_name AS 'album'
FROM
	albuns AS al
    INNER JOIN artists AS a ON a.artist_id = al.artist_id
    WHERE a.artist_name = 'Elis Regina'; 