SELECT
    FORMAT(MIN(planos.valor_plano), 2) AS faturamento_minimo,
    FORMAT(MAX(planos.valor_plano), 2) AS faturamento_maximo,
    FORMAT(AVG(planos.valor_plano), 2) AS faturamento_medio,
    FORMAT(SUM(planos.valor_plano), 2) AS faturamento_total
FROM SpotifyClone.usuarios  AS usuarios 
    INNER JOIN SpotifyClone.planos AS planos
    ON usuarios.planos_ID = planos.planos_ID;
