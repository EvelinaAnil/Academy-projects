const express = require('express');


const app = express();

app.get('/', (req, res) => {
    // res.end('Hello!!!!')
    res.status(200).json({message: 'Working'})
});


app.listen(5000, () => console.log('Server started on 5000'));