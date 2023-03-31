SELECT
    nome_cancao  AS cancao,
    COUNT(*) AS reproducoes
FROM SpotifyClone.cancoes AS cancoes
    INNER JOIN SpotifyClone.historicos AS historicos 
    ON cancoes.song_ID = historicos.song_ID 
GROUP BY cancao
ORDER BY
    reproducoes DESC,
    cancao
LIMIT 2;
