var num=[2,56,76,90,44];
console.log();
num[0] += 10;
console.log(num);

let group1=['Vasechkin','Petrov','Michail'];

let group2=['Oleg','Hilla','Georgey'];


printArray(group1,"Group1");
printArray(group2,"Group2");

function printArray(arr,text='Start array')
{
    document.write
    ('<h3>'+text+'</h3>');

    document.write
    ('<ol start="0"><li>'+arr.join(' <li> ')+'</ol>');
}

group1.push('Sergyey');
group2.push("Mark");

printArray(group1,"after push 1");//в конец
printArray(group2,"after push 2");


group1.unshift('PPP',"MMM");
group2.unshift("GGG");

printArray(group1,"after unshift 1"); //в начало
printArray(group2,"after unshift 2");

let st1=group1.shift();
let st2=group2.pop();

printArray(group1,"after shift 1"); 
printArray(group2,"after pop 2");
console.log(st1,st2);
//splice =delete and after push

let st3 = group2.splice(3,2,"Myshak","Kirii","Opa");
console.log(st3);printArray(group2,"after splice 2");

// let help_clone_group_2=group2;
// let me_copy_group_2=group2.slice();
// group2.pop();
// help_clone_group_2.shift();
// me_copy_group_2.push("Aleksssssssss");
// console.log(group2);
// console.log(help_clone_group_2);
// console.log(me_copy_group_2);
// console.log(help_clone_group_2==group2,me_copy_group_2==group2);


group1=(group1.concat(group2));
group1 =[...group1, ...group2, ...st3, st1,st2]; // ...вытаскиывает элементы
console.log(group1);
console.log(group2);

printArray(group1, 'Group1 after concat');
group1.sort();
printArray(group1, 'Group1 after sortered');


function sortByName (name1, name2)
 {
    return name2.toLowerCase() > name1.toLowerCase()? 
    -1: 1;
}

group1.reverse();
let newGr=group1.map(function(elem)
{  
    return {name: elem, money: Math.round(Math.random()*1000000)}
})




 /////////

var num = [2, 56, 7, 90, 44, 21, 4, 48, 9, 71, 200];
let num1 = num.map(item => item+=100);console.log(num1);

function printTable(arr){
    document.write
('<table border="1" style="width:400px; margin: 20px auto">');

document.write(`<tr><th>№ п/п</th><th>ФИО</th><th>Доход</th></tr>`);
newGroup.forEach((elem, ind ) => 
document.write
(`<tr><td>${ind+1}</td><td>${elem.name}</td><td>${elem.money}</td></tr>`) )
document.write('</table>');

group1.forEach(function(elem, ind ){ console.log(elem, ind);
 document.write(`<tr><td>${ind+1}</td><td>${elem}</td></tr>`)})
 document.write('</table>')
}
printTable(newGr);

console.log(newGr);
let filterARR =newGr.filter( item =>
     item.money>500000)
console.log(filterARR);

/*
Создать массив css-стилей 
(цвет, размер шрифта, выравнива-ние, подчеркивание и т. д.).
 Каждый элемент массива – это объ-ект, состоящий из двух 
 свойств: название стиля и значение стиля.Написать функцию, 
 которая принимает массив стилей итекст, и выводит этот текст 
 с помощью document.write() в тегах<p></p>, добавив в 
 открывающий тег атрибут style со всеми сти-лями, перечисленными 
 в массиве.
 */


let myArr=[];
myArr["color"]='white';
myArr["font-size"]='23px';
myArr["font-alight"]='center';
myArr["padding"]='12px';
myArr["border"]='3px solid blue';
myArr["background-color"]="grey";

let l= "Lorem ipsum dolor sit amet consectetur adipisicing elit. Asperiores excepturi fuga ex voluptatem consectetur qui dolorum perspiciatis, laborum iusto deleniti odio sunt hic commodi! Adipisci nulla velit sunt inventore rerum?"
let tmp="";
for(let each in myArr)
{
    tmp+=each+": "+myArr[each]+"; ";
}
document.write(`<p style='${tmp}'>${l}</p>`);
 /////
 let site=[]; site["name"]
  = 'Магазин игрушек "Bambino House"';
   site["url"] = 'http://bambino-house.com/'; 
   site["admin_name"] = 'dinamit';
    site["admin_pass"] = 'my_pass'; 
    for(let each in site){  console.log(each,':',site[each]); }


