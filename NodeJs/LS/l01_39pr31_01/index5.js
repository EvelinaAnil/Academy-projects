const fs = require('fs')
const path = require('path');

// const text = fs.readFileSync('text1.txt', 'utf-8');
// console.log(text);

const str = "Hello NodeJS!!!!";
// fs.writeFileSync('text2.txt', str);

// fs.readFile('text1.txt', 'utf8', function(err, data) {
//     //if (err) ...
//     console.log(data);
//     console.log('----------------------------');
// });


fs.writeFile(
    path.join(__dirname, 'test', 'text3.txt'), 
    str, 
    (err, data) => {
        console.log('Data Saved....');
    }
    );

console.log('Done script....');