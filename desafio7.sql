SELECT
    artistas.name_artist AS artista,
    albuns.albun_name AS album,
    COUNT(seguidores.artists_ID) AS seguidores
FROM
    SpotifyClone.artistas AS artistas
    INNER JOIN SpotifyClone.albuns AS albuns
    ON artistas.artists_ID = albuns.artists_ID
    INNER JOIN SpotifyClone.following_artists as seguidores
    ON artistas.artists_ID = seguidores.artists_ID
GROUP BY albuns.album_id
ORDER BY
    seguidores DESC,
    artista,
    album;
