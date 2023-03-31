
SELECT
    cancoes.nome_cancao AS nome,
    COUNT(historicos.usuario_id) AS 'reproducoes'
FROM
    SpotifyClone.cancoes AS cancoes
    INNER JOIN SpotifyClone.historicos AS historicos
    ON historicos.song_ID = cancoes.song_ID
    INNER JOIN SpotifyClone.usuarios AS usuarios
    ON usuarios.usuario_id = historicos.usuario_id
WHERE
    usuarios.planos_ID = 1
    OR usuarios.planos_ID = 4
GROUP BY cancoes.nome_cancao
ORDER BY cancoes.nome_cancao;
