



    ////

    let createBody =  function(){
        const fs = require('fs')
        const path = require('path')
        
        const readStream = fs.createReadStream(path.join(__dirname, 'index9_file.txt'), 'utf8');
        
        
        
        readStream.on('data', (chunk) => {
            console.log('получили данные....');
            console.log('--------------------');
            console.log(chunk);
            console.log('--------------------');
        
            writeStream.write(chunk);
        });
}