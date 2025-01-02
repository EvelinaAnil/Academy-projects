
let recipeMap = new Map([
     ["огурец", 500],
      ["помидор", 350],
       ["лук", 50]
    ]);
console.log(recipeMap)
document.write('<ul>');
recipeMap.forEach((value, key)=>{
     document.write(`<li>${key} - ${value} </li>`)})
document.write('</ul>');

//


let styleMap = new Map(
    [ ["font-family", 'Segoe Script, cursive'],
     ["color", 'darkgreen'],
      ["border", '6px ridge green']
    ]);
styleMap.set('padding', '25px');
styleMap.set('text-align', 'center').set
('background-color', 'yellow');
console.log(styleMap.get('text-align'));
const test = document.getElementById('test');
styleMap.forEach((value, key) => {
     test.style[key] = value;})
// for(let val of styleeMap.key()){
//     alert(val);
// }


let num1=[3,4,15,12,44,55],
num2 = [3,5,15,22,33,55];
let numbers = new Set(num1);
console.log(numbers);
num2.forEach(item => numbers.add(item));
console.log(numbers);
num = [...numbers];
console.log(num1);
