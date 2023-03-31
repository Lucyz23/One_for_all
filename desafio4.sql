SELECT
    usuario.user_name AS usuario,
    IF(
        MAX(YEAR(historicos.data_reproducao)) >= '2021',
        'Usuário ativo',
        'Usuário inativo'
    ) AS status_usuario
FROM SpotifyClone.usuarios AS usuario
    INNER JOIN SpotifyClone.historicos AS historicos
    ON usuario.usuario_id = historicos.usuario_id
GROUP BY user_name
ORDER BY usuario.user_name;
