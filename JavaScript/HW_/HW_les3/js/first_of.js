//-------------------=-=--
//1
// console.log(create1(10));
// console.log(create1(30));
// alert(x);
// alert("Hello");
// function create1(i){
//  if (i>20 && i<38)  {
//   if (i % 2 == 0) {
//     console.log(x=true) ;
//   }
//   else{
//     console.log(x=false) ;
//   }
// }
// else{ console.log("Error >20 or <38");}
   
// }

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
             if(m>59){
            while(m>59){
                m-=60;
                h++;
            }}
          else   if(h>23){
            while(h>23){
                h-=24;
            } }
            
            console.log(h+" "+m+" "+s);
           
     }
     else {
           console.log(h+" "+m+" "+s);
           
     }
}
alert(date5(46,56,90));
alert(date5(12,40,10));