const path = require('path');

console.log(__filename);

console.log(path.basename(__filename))//имя файла без DIR

console.log(path.dirname(__filename))//DIR name
console.log(path.extname(__filename))//name ext

console.log(path.parse(__filename))//объект json с детализацией в

console.log(path.join(__dirname, 'test', 'second.html'))///склеив. имя файла