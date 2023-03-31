SELECT usuarios.user_name AS usuario,
COUNT (*) AS qt_de_musicas_ouvidas,
ROUND(SUM(cancoes.duracao_segundos)/60, 2) AS total_minutos 
FROM SpotifyClone.usuarios AS usuarios 
INNER JOIN SpotifyClone.historicos AS historico 
INNER JOIN SpotifyClone.cancoes AS cancoes 
ON cancoes.song_ID = historico.song_ID AND historico.usuario_id = usuarios.usuario_id
GROUP BY historico.usuario_id
ORDER BY usuarios.user_name  ASC;
