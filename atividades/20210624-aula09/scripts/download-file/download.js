const puppeteer = require('puppeteer');

const targetSite = 'https://covid.saude.gov.br/';
const downloadPath = process.env.DOWNLOAD_PATH;
const buttonSelector = '.col-right .button';
const waitTime = 120000;

const downloadFile = async () => {
  try {
    console.log(`Iniciando puppeteer em ${new Date().toString()}`);
    const browser = await puppeteer.launch();
    const page = await browser.newPage();

    console.log(`Acessando site ${targetSite}`);
    await page.goto(targetSite);

    console.log(`Configurando caminho de download para ${downloadPath}`);
    await page._client.send('Page.setDownloadBehavior', {
      behavior: 'allow',
      downloadPath: downloadPath,
    });

    console.log('Esperando que o botão de download seja carregado');
    await page.waitForSelector(buttonSelector);

    console.log('Esperando mais alguns segundos (para garantir)...');
    await page.waitForTimeout(waitTime);

    console.log('Clicando no botão de download');
    await page.click(buttonSelector);

    console.log('Esperando download finalizar');
    await page.waitForTimeout(waitTime);

    console.log('Encerrando os trabalhos ;)');
    await browser.close();
  } catch (err) {
    throw new Error('Erro ao obter arquivo: ' + err);
  }
};

(async () => {
  await downloadFile();
})();

