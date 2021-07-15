#####################################################
# criado por Andreiwid Sheffer Corrêa
# para disciplina de Storytelling com Dados (D1STO)
# do curso de especialização em ciência de dados
# do Instituto Federal de São Paulo - campus Campinas
# no primeiro semestre de 2021
#####################################################

#APAGA A TABELA, SE EXISTIR
DROP TABLE IF EXISTS `HIST_PAINEL_COVIDBR`;

#CRIA A TABELA PARA RECEBER OS DADOS
CREATE TABLE `HIST_PAINEL_COVIDBR` (
  `regiao` text DEFAULT NULL,
  `estado` text DEFAULT NULL,
  `municipio` text DEFAULT NULL,
  `coduf` text DEFAULT NULL,
  `codmun` text DEFAULT NULL,
  `codRegiaoSaude` text DEFAULT NULL,
  `nomeRegiaoSaude` text DEFAULT NULL,
  `data` date DEFAULT NULL,
  `semanaEpi` integer DEFAULT NULL,
  `populacaoTCU2019` integer DEFAULT NULL,
  `casosAcumulado` integer DEFAULT NULL,
  `casosNovos` integer DEFAULT NULL,
  `obitosAcumulado` integer DEFAULT NULL,
  `obitosNovos` integer DEFAULT NULL,
  `Recuperadosnovos` integer DEFAULT NULL,
  `emAcompanhamentoNovos` integer DEFAULT NULL,
  `interiormetropolitana` integer DEFAULT NULL
);

#IMPORTA O CSV DA FORMA QUE FOI BAIXADO DO SITE http://covid.saude.gov.br. ATENÇÃO PARA O NOME DO ARQUIVO BAIXADO, QUE DEVE SER RENOMEADO
LOAD DATA LOCAL INFILE '/home/ec2-user/HIST_PAINEL_COVIDBR.csv' 
  INTO TABLE HIST_PAINEL_COVIDBR 
  CHARACTER SET utf8
  FIELDS TERMINATED BY ';' 
  LINES TERMINATED BY '\n' 
  IGNORE 1 LINES
  (@vregiao, @vestado, @vmunicipio, @vcoduf, @vcodmun, @vcodRegiaoSaude, @vnomeRegiaoSaude, @vdata, @vsemanaEpi, @vpopulacaoTCU2019, @vcasosAcumulado, @vcasosNovos, @vobitosAcumulado, @vobitosNovos, @vRecuperadosnovos, @vemAcompanhamentoNovos, @vinteriormetropolitana)
  SET
    regiao = NULLIF(@vregiao, ''),
    estado = NULLIF(@vestado, ''),
    municipio = NULLIF(@vmunicipio, ''),
    coduf = NULLIF(@vcoduf, ''),
    codmun = NULLIF(@vcodmun, ''),
    codRegiaoSaude = NULLIF(@vcodRegiaoSaude, ''),
    nomeRegiaoSaude = NULLIF(@vnomeRegiaoSaude, ''),
    data = NULLIF(@vdata, ''),
    semanaEpi = NULLIF(@vsemanaEpi, ''),
    populacaoTCU2019 = NULLIF(@vpopulacaoTCU2019, ''),
    casosAcumulado = NULLIF(@vcasosAcumulado, ''),
    casosNovos = NULLIF(@vcasosNovos, ''),
    obitosAcumulado = NULLIF(@vobitosAcumulado, ''),
    obitosNovos = NULLIF(@vobitosNovos, ''),
    Recuperadosnovos = NULLIF(@vRecuperadosnovos, ''),
    emAcompanhamentoNovos = NULLIF(@vemAcompanhamentoNovos, ''),
    interiormetropolitana = NULLIF(@vinteriormetropolitana, '');

#RENOMEIA O ESTADO PARA CONTER O NOME COMPLETO, SEM ABREVIAÇÃO. NECESSÁRIO PARA APRESENTAR CORRETAMENTE NO MAPA
UPDATE HIST_PAINEL_COVIDBR SET estado = 'Estados' WHERE estado = 'Siglas';
UPDATE HIST_PAINEL_COVIDBR SET estado = 'Acre' WHERE estado = 'AC';
UPDATE HIST_PAINEL_COVIDBR SET estado = 'Alagoas' WHERE estado = 'AL';
UPDATE HIST_PAINEL_COVIDBR SET estado = 'Amapá' WHERE estado = 'AP';
UPDATE HIST_PAINEL_COVIDBR SET estado = 'Amazonas' WHERE estado = 'AM';
UPDATE HIST_PAINEL_COVIDBR SET estado = 'Bahia' WHERE estado = 'BA';
UPDATE HIST_PAINEL_COVIDBR SET estado = 'Ceará' WHERE estado = 'CE';
UPDATE HIST_PAINEL_COVIDBR SET estado = 'Distrito Federal' WHERE estado = 'DF';
UPDATE HIST_PAINEL_COVIDBR SET estado = 'Espírito Santo' WHERE estado = 'ES';
UPDATE HIST_PAINEL_COVIDBR SET estado = 'Goiás' WHERE estado = 'GO';
UPDATE HIST_PAINEL_COVIDBR SET estado = 'Maranhão' WHERE estado = 'MA';
UPDATE HIST_PAINEL_COVIDBR SET estado = 'Mato Grosso' WHERE estado = 'MT';
UPDATE HIST_PAINEL_COVIDBR SET estado = 'Mato Grosso do Sul' WHERE estado = 'MS';
UPDATE HIST_PAINEL_COVIDBR SET estado = 'Minas Gerais' WHERE estado = 'MG';
UPDATE HIST_PAINEL_COVIDBR SET estado = 'Pará' WHERE estado = 'PA';
UPDATE HIST_PAINEL_COVIDBR SET estado = 'Paraíba' WHERE estado = 'PB';
UPDATE HIST_PAINEL_COVIDBR SET estado = 'Paraná' WHERE estado = 'PR';
UPDATE HIST_PAINEL_COVIDBR SET estado = 'Pernambuco' WHERE estado = 'PE';
UPDATE HIST_PAINEL_COVIDBR SET estado = 'Piauí' WHERE estado = 'PI';
UPDATE HIST_PAINEL_COVIDBR SET estado = 'Rio de Janeiro' WHERE estado = 'RJ';
UPDATE HIST_PAINEL_COVIDBR SET estado = 'Rio Grande do Norte' WHERE estado = 'RN';
UPDATE HIST_PAINEL_COVIDBR SET estado = 'Rio Grande do Sul' WHERE estado = 'RS';
UPDATE HIST_PAINEL_COVIDBR SET estado = 'Rondônia' WHERE estado = 'RO';
UPDATE HIST_PAINEL_COVIDBR SET estado = 'Roraima' WHERE estado = 'RR';
UPDATE HIST_PAINEL_COVIDBR SET estado = 'Santa Catarina' WHERE estado = 'SC';
UPDATE HIST_PAINEL_COVIDBR SET estado = 'São Paulo' WHERE estado = 'SP';
UPDATE HIST_PAINEL_COVIDBR SET estado = 'Sergipe' WHERE estado = 'SE';
UPDATE HIST_PAINEL_COVIDBR SET estado = 'Tocantins' WHERE estado = 'TO';
