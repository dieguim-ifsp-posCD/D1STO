SELECT 
    regiao,
    estado,
    municipio,
    coduf,
    codmun,
    codRegiaoSaude,
    nomeRegiaoSaude,
    `data`,
    semanaEpi,
    populacaoTCU2019,
    casosAcumulado,
    casosNovos,
    obitosAcumulado,
    obitosNovos,
    Recuperadosnovos,
    emAcompanhamentoNovos,
    interiormetropolitana,
    (casosNovos * 1000) / populacaoTCU2019 AS casosNovos1000hab,
    (obitosNovos * 1000) / populacaoTCU2019 AS obitosNovos1000hab,
    (casosAcumulado * 1000) / populacaoTCU2019 AS casosAcumulado1000hab,
    (obitosAcumulado * 1000) / populacaoTCU2019 AS obitosAcumulado1000hab
FROM
    HIST_PAINEL_COVIDBR
WHERE municipio IS NOT NULL