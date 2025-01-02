console.log('Privet, NodeJS!!!');
console.log('----------------');
console.log(__dirname);
console.log(__filename);
console.log('----------------');
let x = 101;
console.log(x);
console.log('----------------');
if (x == 101)
    console.log('Work.....'+x);
else
    console.log('NO!!!!');
console.log('----------------');
for(let i = 0; i<= 7; i++)
{
    console.log('loop: ' + i)
}
console.log('----------------');

console.log('----------------');
setTimeout(function(){
    console.log('Hello!!!....')
}, 2000);


function f1()
{
    console.log('Print....')
}
let f = function test()
{
    console.log('Test function....')
}

f1();
f();

console.log('----------------');
function call(func)
{
    func()
}
call(f)