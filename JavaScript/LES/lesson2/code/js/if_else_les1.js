//------------------1-------------
/*let number = parseInt(prompt("Enter number:"));
console.log(number);
console.log(isNaN(number)? "thisNAN " : "IsNOtNAN " +(typeof number) );
alert(number%2==0 ? "Even" : "Odd");*/
//-------------------2------------
// var  sum = 0;
//  confirm("Is Earth sfera?") ? sum ++: sum--;
// confirm("Is doulfin -> fish?")? sum-- : sum++;
// confirm("JavaScript -> strictly typified language?")? sum-- : sum++;
// confirm("HTML -> programmer language?")? sum-- : sum++;
// confirm("Was Archimedes a Hellenist?")? sum++ : sum--;
// confirm("2x2=4?")? sum++ : sum--;
// console.log(sum);
// let res=" ";
// switch(sum){
//     case -6: res="You are sooo gek!";
//         break;
//         case -4: res="You are not so gek!";
//         break;
//         case -2: res="Try again!";
//         break;
//         case 0: res="Not bad and not good...";
//         break;
//         case 2: res="You are  good!";
//         break;
//         case 4: res="You are sooo good!";
//         break;
//         case 6: res="Congratulation! You are so smart)";  
//         break;
// }
// alert(res);
//----------3--------
// 
//---------------4---------

// test.style.color = prompt("Enter number") > 50 ? "red" : "limegreen";
// let isinStock = null;
// test.style.opacity = !isinStock? 0.4 :1;
// if(document.querySelector('#test1'))
// {


// }
//-----------------5---------
/*Компания по транспортировке мебели заносит любую мебель
 на 1-й этаж бесплатно,
  со 2-го по 4-й включительно - по 20грн.,
   с 5-го по 7-й включительно - по 30грн.,
    а с 8-го и выше - по 40грн. 
    Узнайте у пользователя,
     на какой этаж нужно занести мебель, 
     и рассчитайте стоимость транспортировки. */
     let  floor =prompt("Enter floor number:");
    if(floor ==1){
        alert("Fri!");
    }
    else if(floor>=2 && floor<=4){
        alert("Price =" + (floor-1)*20);
    }
    else if(floor>=5 && floor<=7){
        alert("Price =" + ((floor-4)*30)+60);
    }
    else if(floor>=8 ){
        alert("Price =" + ((floor-8)*40)+150);
    }