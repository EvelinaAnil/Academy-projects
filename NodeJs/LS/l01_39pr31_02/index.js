const http = require('http')
const fs = require('fs');
const path = require('path')

const server = http.createServer(function(req, res) {
    // console.log("URL page: "+req.url);

    // res.writeHead(200, {'Content-Type': 'text/plain'});
    // res.end('Hello!!! my web rever!!!! 55555555555555555!!!');

    if (req.method === 'GET') {
        if (req.url === '/') {
            res.writeHead(200, {'Content-Type': 'text/html; charset=utf-8'});
            // res.end("<h1>Hello!!!!</h1>");
            fs.readFile(
                path.join(__dirname, 'view0', 'index.html'),
                'utf-8',
                (err, data) => {
                    if (err)
                        throw err;
                    res.end(data);
                }
            )
        } else if (req.url === '/about') {
            res.writeHead(200, {'Content-Type': 'text/html; charset=utf-8'});
            // res.end("<h1>About</h1>");
            fs.readFile(
                path.join(__dirname, 'view0', 'about.html'),
                'utf-8',
                (err, data) => {
                    if (err)
                        throw err;
                    res.end(data);
                }
            )
        } else if (req.url === '/contact') {
            res.writeHead(200, {'Content-Type': 'text/html; charset=utf-8'});
            // res.end("<h1>Contact</h1>");
            fs.readFile(
                path.join(__dirname, 'view0', 'contact.html'),
                'utf-8',
                (err, data) => {
                    if (err)
                        throw err;
                    res.end(data);
                }
            )
        }
    } else if (req.method === 'POST') {
        const body = []
        res.writeHead(200, {'Content-Type': 'text/html; charset=utf-8'})
        req.on('data', data =>{
            body.push(Buffer.from(data))
            console.log(body.toString());
            //console.log(data);
        })

        req.on('end', ()=>{
            const mes = body.toString().split('=')[1]
            res.end(`<h1> ${mes} !!!!!!!</h1>`)
        })
    }
});

server.listen(3000, '127.0.0.1');
console.log('Server started!!!! go to http://localhost:3000');