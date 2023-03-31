SELECT
    cancoes.nome_cancao AS nome_musica,
    CASE
        WHEN cancoes.nome_cancao LIKE '%Bard%' THEN
        REPLACE (cancoes.nome_cancao, 'Bard', 'QA')
            WHEN cancoes.nome_cancao LIKE '%Amar%' THEN
        REPLACE (
                cancoes.nome_cancao,
                'Amar',
                'Code Review'
            )
            WHEN cancoes.nome_cancao LIKE '%Pais%' THEN
        REPLACE (
                cancoes.nome_cancao,
                'Pais',
                'Pull Requests'
            )
            WHEN cancoes.nome_cancao LIKE '%SOUL%' THEN
        REPLACE (cancoes.nome_cancao, 'SOUL', 'CODE')
            WHEN cancoes.nome_cancao LIKE '%SUPERSTAR%' THEN
        REPLACE (
                cancoes.nome_cancao,
                'SUPERSTAR',
                'SUPERDEV'
            )
    END AS novo_nome
FROM
    SpotifyClone.cancoes AS cancoes
HAVING novo_nome IS NOT NULL
ORDER BY
    cancoes.nome_cancao DESC;
