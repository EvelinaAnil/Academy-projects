const express = require('express');
const path = require('path')

const app = express();

app.get('/', function (req, res) {
    res.status(200);
    res.sendFile(path.join(__dirname, "views0", "index.html"));
});

app.get('/about', function (req, res) {
        res.status(200);
        res.sendFile(path.join(__dirname, "views0", "about.html"));
    });
    
app.get('/contact', function (req, res) {
    res.status(200);
    res.sendFile(path.join(__dirname, "views0", "contact.html"));
});    

app.listen(3000, () => {
    console.log('Server is running on port 3000');
});