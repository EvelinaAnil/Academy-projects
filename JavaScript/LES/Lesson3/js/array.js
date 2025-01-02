let numb=[9,12,34,27,32];
//numbers[10]=100;
numb[numb.length] =100;
numb.push(200);
console.log(numb);
document.write(numb);
let empt = [];
console.log(empt);
for(let i=0;i<5;i++){
    empt[i] = Math.round(Math.random()*100);
}
console.log(empt);


const arr = new Array(6,7,8,9,99);
console.log(arr);
for(let i=0;i<arr.length;i++){
    arr.push(Math.round(Math.random()*100));
}
console.log(arr);

arr=[4,6,8]; //rewrite
arr.push(221,13213,2,1331,1331,13);