const fs = require('fs');
const https = require('https');

const url = 'https://raw.githubusercontent.com/EvolutionAPI/docs-evolution/main/openapi/openapi-v2.json';
const outputFile = './public/openapi.json';

https.get(url, (res) => {
  const filePath = fs.createWriteStream(outputFile);
  res.pipe(filePath);
  filePath.on('finish', () => {
    filePath.close();
    console.log('Official Evolution API OpenAPI spec downloaded successfully!');
  });
}).on('error', (err) => {
  console.error('Error downloading OpenAPI spec:', err.message);
});
