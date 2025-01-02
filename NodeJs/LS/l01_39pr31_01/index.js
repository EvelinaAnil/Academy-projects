const http = require('http');

const server = http.createServer( (req, res) => {
    console.log("URL page: " + req.url);

    res.writeHead(200, {'Content-Type': 'text/plain'});
    res.end('Hello!!! It is my webserver on NodeJS!!!!! 777777777777777');
})

server.listen(3000, '127.0.0.1');

console.log('Server started!!!! go to http://localhost:3000');
