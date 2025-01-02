// function sayHello(userName='Unknown User')
//  { alert(`Hello ${userName}!`)}

// // sayHello('John Dow');

// function summa(a,b){
//     console.log(a,b);
//     return a>b?a+b : a-b ;
//     alert(a+" "+b);
// }
// let c= summa(26,4);
// console.log(c);
// console.log(summa(30,20));

/*----------------- */
// function createTable(rows, cols ){
//     if(!rows) rows=3;
//     cols = cols || 3;
//     console.log(rows,cols);
//     var table="<table style='width: 600px; 15px auto;' border='1'>";
//     for(var i=0; i<rows; i++){
//       table +="<tr>";
//         for(var j=0; j<cols; j++){
//           table +="<td> Ячейка "+(j+1)+" </td>";
//         }
//       table +="</tr>";
//     }
//     table +="</table>";
//     document.write(table);
//   }
//   createTable(5, 2);
//   createTable();
  
/*--------------------- */

//   function summa() {     var sum = 0,
//     str = "";
//     console.log(arguments);
//     for (var i = 0; i < arguments.length; i++) {        sum += arguments[i];
//        str += arguments[i] + ",";     }
//      str=str.slice(0,-1);
//      return str+"="+sum;
// }
// console.log(summa(1, 2, 3)); //запишет в консоли [1,2,3];
// document.write("<p> Сумма чисел " + summa(2, 3, 56, 17, 34, 67) + "</p>");

// function sum(){
//     console.log(arguments);
//     let summa=0;
//     for(let number of arguments){
// sum+=summa;
// }
// return summa;
// }
// console.log(sum(10,34,56,70,-3));//167


///Необходимо вывести призвольное 
//кол-во слов в предложение.

// function MijnString(){
//     var tmp="";
//     for (const iterator of arguments) {
//         tmp+=iterator+" ";
//     }
//     return tmp;
// }

// console.log(MijnString("z","opreactive","ryr","eew","eewf",'bye...'));

/*------------ */

/*Написать функцию,
 которая считает сумму цифр числа.
 Например: число 1357, 
 сумма 1 + 3 + 5 + 7 = 16 */

//  function numSum(num)
//  {let sum =0; 
//     if(typeof(num)=="string"){
     
//             for(let i=0;i<num.length;i++)
//             {
//                 sum+= parseInt(num[i]);
//             } 
//    }
//     else{
//         while (num>0) {
//             let n =+num%(10);
//             parseInt(num/=10);
//             sum+=n;
//         }

//     }
//     return sum;
// }
// alert(numSum('1357'));

/*------------------ */

// let rand=Math.random() ; //0.....1
// let rand1=Math.random()*70 ; //0.....70
// //m>n  n...m  => Math.random()*(m-n)+n
// let rand2 = Math.random()*50+20 ; //20.....70
// //1) parseInt - отсекает целую часть
// //1) Math.turnc() - отсекает целую часть
// //2) Math.round() - по правилам математики 
// //3) Math.ceil() - в большую сторону
// //3) Math.floor() - в меньшую сторону
// console.log(rand);
// console.log(rand1);
// console.log(rand2,Math.round(rand2), Math.ceil(rand2),Math.floor(rand2));


// function GetNumber(y = 256)
// {
//     return parseInt(Math.random() * y);
// }

// function GetRandomColor() 
// {
//     let first = GetNumber();
//     let second = GetNumber();
//      let third = GetNumber();
//       document.getElementById
//      ("test").style.backgroundColor = `rgb(${first}, ${second}, ${third})`;
// }
    
//     GetRandomColor();



    //Самовызывающаяся функция (IIFE)
    /*
    (function(){...})()

    (function($){...})(jQuery)


    (function(){
    let str = '';
    let x = +prompt('Введите число', 5);
    if(x>0) str='Вы ввели положительное число';
    else if(x<0) str='Вы ввели отрицательное число';
    else str='Ваше число - 0';
    alert(str);
    })()


    (function(x){ 
         let str = ''; 
          if(x>0) str='Вы ввели положительное число';  
          else if(x<0) str='Вы ввели отрицательное число'; 
           else str='Ваше число - 0'; 
            alert(str);
    })
    (+prompt('Введите число', 5)

    
    */

    // let sayHello = (userName ="Unknown User") => alert(`Hello ${userName}!`);
    // let sayHello1 = userName  => alert(`Hello ${userName}!`);
    // sayHello("Mister");
    // sayHello1("Monster");

    // let randNum =x=>Math.round(Math.random()*x);
    // let randNumber = x => {
    //  let rand = Math.round(Math.random()*x);
    //     console.log(rand);
    //      return rand;
    // }
    // console.log(randNum(100));

    // let summa = (a, b) => a+b;
    // console.log(summa(3,5));

    /*---------------------- */

    /*Написать функцию, которая принимает 2 числа
     и возвращает -1,
      если первое меньше, чем второе; 
      1 – если первое больше, чем второе;
       и 0 – если числа равны */

//        function Zwei(a,b){
//         if(a<b)return -1;
//        else if(a>b) return 1;
//        else if(a==b)return 0;
//         }

// let Compare = (a,b) =>
//      a > b ? 1 :
//       a < b? -1 : 0

// let zwei1 = (a,b) =>{
//     if(a<b)return -1;
//     else if(a>b) return 1;
//     else if(a==b)return 0;}

// console.log(Zwei(4,6));
// console.log(Compare(4,6));
// console.log(zwei1(4,6));

/* */

//-------------------=-=--
//1
console.log(create1(10));
console.log(create1(30));
alert(x);
alert("Hello");
function create1(i){
 if (i>20 && i<38)  {
  if (i % 2 == 0) {
    console.log(x=true) ;
  }
  else{
    console.log(x=false) ;
  }
}
else{ console.log("Error >20 or <38");}
   
}

//2


// function create2(numb){
//         var word;
//         var table = "<ol>";
//         for(var i=0; i<=numb; i++){
//      var t;
//      t += document.write(`<li>${prompt((word))}</li>`);
            
           
//         }
//        var table1 ="</ol>";
//         document.write(table+t+table1);
//       }
// create2(4);

// //3
// let revers3 = (number)  =>
//  alert(number.split("").reverse().join(""))

// alert(revers3(prompt("Input number:")));

// //4
// let s4 =(a, b=0 ) => b == 0 ? (a**2) : (a*b)


// console.log(s4(2));
// console.log(s4(2,4));

//5
function date5(h,m,s){
 let time = new Date();
     if(h>23 || m>59 || s>59){
        if(s>59){
            while(s>59){
                s-=60;
                m++;
            }}
            else if(m>59){
            while(m>59){
                m-=60;
                h++;
            }}
          else   if(h>23){
            while(h>23){
                h-=24;
            }
           }
            console.log(time.getHours(h)+" "+time.getMinutes(m)+" "+time.getSeconds(s));
     }
     else {
           console.log(time.getHours(h)+" "+time.getMinutes(m)+" "+time.getSeconds(s)+"else");
           
     }
}
alert(date5(24,56,90));
alert(date5(12,40,10));