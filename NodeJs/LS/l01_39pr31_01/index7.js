const fs = require('fs')
const path = require('path')

/*
fs.unlink('text4.txt', function(){
    console.log('File deleted')
})
*/

/*
fs.mkdir('test_dir', () =>{
    fs.writeFile(
        path.join(__dirname, 'test_dir', 'text5.txt'), 
        'Text for file......',
        () =>{
            console.log('Done! Dir created! File created!!!');
        }
        );
});
*/

fs.rmdir('111', function(){
    console.log('Done!');
});

