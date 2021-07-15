# _scripts_ de atualização dos dados

> Rotinas para atualização dos dados relativos à COVID-19 utilizados nos trabalho final da disciplina de _Storytelling_ com dados (D1STO).

Os dados originais (csv) são obtidos do [Painel Coronavírus](https://covid.saude.gov.br) do ministério da saúde. Como não é disponibilizado um endereço direto de _download_ do arquivo, foi desenvolvida uma aplicação de _scraping_ em Node.js utilizando [Puppeteer](https://github.com/puppeteer/puppeteer#puppeteer) ([Código da aplicação](download-file/download.js)).

Feito o _download_ do arquvo `.rar`, é necessário realizar a extração do mesmo, unificar os diversos `.csv`'s em um único arquivo e carregar dos dados no banco de dados _mysql_. Todas as tarefas são feitas por um [_script em bash_](update_database.sh) executado diariariamente (_cron job_) no servidor.

O [_script_ SQL](importa_dados.sql) que carrega o os dados foi desenvolvido originalmente pelo docente da disciplina e os créditos estão especificados no arquivo.
