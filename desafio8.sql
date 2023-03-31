SELECT
    artistas.name_artist AS artista,
    albuns.albun_name AS album
FROM
    SpotifyClone.artistas AS artistas
    INNER JOIN SpotifyClone.albuns AS albuns
    ON albuns.artists_ID = artistas.artists_ID
WHERE
    artistas.name_artist = "Elis Regina";
