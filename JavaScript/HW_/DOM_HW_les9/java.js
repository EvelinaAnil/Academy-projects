// document.body.style.backgroundColor = "cyan";
// document.body.style.border = "6px solid white";

console.log(document.documentElement);
console.log(document.body);

console.log(document.body.firstElementChild);

let pcollect = document.getElementsByTagName("p");
console.log(pcollect[3]);
console.log("--------");
 let cards = document.getElementsByClassName("google-list-item");
// console.log(cards);
// let li = document.querySelectorAll("google-list-item");
 
// for(let item of li) {
//      if(item.matches("ol")) console.log(item);
// }

// let list = document.querySelectorAll("google-list-item");
// console.log(cards);
for (let i = 0; i < cards.length; i++) {
    console.log(cards[i]);
  }
  for (var i = 0; i < cards.length; i++) {
    var elements = document.getElementsByClassName(cards[i]);

   
}
// let is = document.querySelectorAll("li > a");
 
// for(let item of is) {
//      if(item.matches("li")) console.log(item);
// }
// let container = document.getElementsByClassName("menu");

// var testDivs = Array.prototype.filter.call(container, function(container){
//     return container.nodeName.nodeName === 'DIV';
// });


console.log("--------");
let lis = document.querySelectorAll("li > a");
 
for(let item of lis) {
     if(item.matches("a")) console.log(item);
}
console.log("--------");



let script = document.getElementsByTagName("script");

for (let i = 0; i < script.length; i++) {
    
    console.log(script[i]);
  }
  for (var i = 0; i < script.length; i++) {
    var elements = document.getElementsByTagName(script[i]);

   
}
console.log("---------9");

let per = document.getElementsByTagName("p");

for (let i = 0; i < per.length; i++) {
    
    if(i== per.length-2){
            console.log(per[i]);
    }

  }
//   for (var i = 0; i < per.length; i++) {
//     var elements = document.getElementsByTagName(per[i]);

   
// }
console.log("---==");
let ap = document.querySelectorAll("p > span");
 
for(let item of ap) {
     if(item.matches("span")) console.log(item);
}