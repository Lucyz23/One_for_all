SELECT
    COUNT(historicos.song_ID) AS quantidade_musicas_no_historico
FROM
    SpotifyClone.historicos AS historicos
    INNER JOIN SpotifyClone.usuarios AS usuarios
    ON historicos.usuario_id = usuarios.usuario_id
WHERE
    usuarios.user_name = "Barbara Liskov";
