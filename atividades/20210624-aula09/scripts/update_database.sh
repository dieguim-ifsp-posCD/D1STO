#!/bin/bash
DOWNLOAD_PATH="$HOME/downloads"
SCRIPTS_PATH="$HOME/scripts"
OUTPUT_FILE="$HOME/HIST_PAINEL_COVIDBR.csv"

echo "[$(date)] Iniciado atualização dos dados"

echo "[$(date)] Realizando download do arquivo"
DOWNLOAD_PATH=$DOWNLOAD_PATH node "$SCRIPTS_PATH/download-file/download.js"

last_rar=$(ls -t $DOWNLOAD_PATH/*.rar | head -1)
echo "[$(date)] Preparando extração do arquivo $(basename $last_rar)"

extract_path=$(echo $last_rar | sed -e 's/\.rar$//')
echo "[$(date)] Arquivos serão extraídos no diretório $extract_path"

echo "[$(date)] Extraindo arquivos"
unar -f -d $last_rar -o $DOWNLOAD_PATH

echo "[$(date)] Concatenando arquivo em um único CSV $OUTPUT_FILE"
# Linha de cabeçalho
head -1 $(ls $extract_path/*.csv | head -1) > $OUTPUT_FILE
# Juntando os arquivos excluindo a primeira linha (cabeçalho)
tail -q -n +2 $extract_path/*.csv >> $OUTPUT_FILE

echo "[$(date)] Salvando dados no mysql"
# Obtém valores das variáveis $MYSQL_HOST, $MYSQL_DATA, $MYSQL_USER e $MYSQL_PASS do arquivo .env
source "$SCRIPTS_PATH/.env"
mysql --local-infile=1 -h "$MYSQL_HOST" -u "$MYSQL_USER" --password="$MYSQL_PASS" "$MYSQL_DATA" < "$SCRIPTS_PATH/importa_dados.sql"

echo "[$(date)] Removendo diretório de extração $extract_path"
rm -rf $extract_path

echo -e "[$(date)] Atualização dos dados finalizada!\n\n"
