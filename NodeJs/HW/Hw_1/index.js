
const http = require('http');

const server = http.createServer( (req, res) => {
    console.log("URL page: " + req.url);

    res.writeHead(200, {'Content-Type': 'text/plain'});
    const fs = require('fs')
const path = require('path')

const readStream = fs.createReadStream(path.join(__dirname, 'text1.txt'), 'utf8');


readStream.on('data', (chunk) => {
    console.log('получили данные....');
    console.log('--------------------');
    console.log(chunk);
    console.log('--------------------');

    writeStream.write(chunk);
});
    res.end('Hello!!! It is my webserver on NodeJS!!!!!');
})

server.listen(3212, '127.0.0.1');

console.log('Server started!!!! go to http://localhost:3000');


//2
var a = [1,2,3,4,5,6,7,8,9];

function arraySum(arr, elm) {

    arr = arr.slice(0);   

    for(var sum = 0, a; a = arr.pop();) sum += !elm || elm=="even" && !(a & 1) || elm== "odd" && a & 1 ? a : 0;

    return sum

}

alert(arraySum(a));
alert(arraySum(a, 'even'));
alert(arraySum(a, 'odd')); 
