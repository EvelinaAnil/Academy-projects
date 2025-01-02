var number = prompt("Салат или закуску?");console.log(number);
if(number ==parseInt(number)|| number == parseFloat(number)){
    var number = prompt("Салат или закуску?");console.log(number);
}

var number_1 = prompt("Первое блюдо?");console.log(number_1);

if(number_1 ==parseInt(number_1)|| number_1 == parseFloat(number_1))
{
    var number_1 = prompt("Первое блюдо?");console.log(number_1);
}


var number_2 = prompt("Второе блюдо?");console.log(number_2);

if(number_2 ==parseInt(number_2)|| number_2 == parseFloat(number_2))
{
    var number_2 = prompt("Второе блюдо?");console.log(number_2);
}


var number_3 = prompt("Десерт?");console.log(number_3);

if(number_3 ==parseInt(number_3)|| number_3 == parseFloat(number_3))
{
    var number_3 = prompt("Десерт?");console.log(number_3);
}
let fr=65.7;
let sec=103.9;
let third=89.5;
let four=53.6;
var tt;
// if(number != null&&
//     number_1!=null&&
//     number_2!=null&&
//     number_3!=null ){
//         tt=number+" " + fr+"UAH\n"+
//         number_1+" " + sec+"UAH\n"+
//         number_2+" "+third+"UAH\n"+
//         number_3+" "+four+"UAH\n\n"+
//         "Итого:"+(fr+sec+third+four)+"UAH\n"

if(number != null&&
   number_1==null&&
   number_2==null&&
   number_3==null )
   {
        tt=
        number_1+" " + sec+"UAH\n"+
        number_2+" "+third+"UAH\n"+
        number_3+" "+four+"UAH\n\n"+
        "Итого:"+(sec+third+four)+"UAH\n"
   }
//--
   if(number != null&&
    number_1!=null&&
    number_2==null&&
    number_3==null )
    {
        tt=
        
        number_2+" "+third+"UAH\n"+
        number_3+" "+four+"UAH\n\n"+
        "Итого:"+(third+four)+"UAH\n"
    }    
//--     
if(number != null&&
    number_1!=null&&
    number_2!=null&&
    number_3==null )
    {
        tt=
        number_3+" "+four+"UAH\n\n"+
        "Итого:"+(four)+"UAH\n"
    }
//--!!!!
if(number != null&&
    number_1!=null&&
    number_2!=null&&
    number_3!=null )
{
     tt=number+" " + fr+"UAH\n"+
    number_1+" " + sec+"UAH\n"+
    number_2+" "+third+"UAH\n"+
    number_3+" "+four+"UAH\n\n"+
    "Итого:"+(fr+sec+third+four)+"UAH\n"
}
//--
if(number != null&&
    number_1==null&&
    number_2!=null&&
    number_3!=null )
    {
        tt=
        number_1+" " + sec+"UAH\n"+
        "Итого:"+(sec)+"UAH\n"
    }
//--
    if(number != null&&
        number_1==null&&
        number_2!=null&&
        number_3==null )
        {
            tt=
            number_1+" " + sec+"UAH\n"+
           
            number_3+" "+four+"UAH\n\n"+
            "Итого:"+(sec+four)+"UAH\n"
        }
//--
if(number != null&&
    number_1==null&&
    number_2==null&&
    number_3!=null )
    {
        tt=
        number_1+" " + sec+"UAH\n"+
        number_2+" "+third+"UAH\n"+
        "Итого:"+(sec+third)+"UAH\n"
    }
//--
if(number == null&&
    number_1!=null&&
    number_2!=null&&
    number_3!=null )
    {
        tt=number+" " + fr+"UAH\n"+
        "Итого:"+(fr)+"UAH\n"
    }
//--
if(number != null&&
    number_1!=null&&
    number_2==null&&
    number_3!=null )
    {
        tt=number_2+" " + third+"UAH\n"+
        "Итого:"+(third)+"UAH\n"
    }
//--
if(number == null&&
    number_1==null&&
    number_2!=null&&
    number_3!=null )
    {
        tt=number+" " + fr+"UAH\n"+
        number_1+" " + sec+"UAH\n"+
        "Итого:"+(fr+sec)+"UAH\n"
    }
//--
if(number == null&&
    number_1==null&&
    number_2==null&&
    number_3!=null )
    {
        tt=number+" " + fr+"UAH\n"+
        number_1+" " + sec+"UAH\n"+
        number_2+" "+third+"UAH\n"+
        "Итого:"+(fr+sec+third)+"UAH\n"
    }
//--!!!
if(number == null&&
    number_1==null&&
    number_2==null&&
    number_3==null )
    {
        tt="К сожалению,Вы ничего не заказали." 
    "Итого:"+(0)+"UAH\n"
    }
//--
if(number == null&&
    number_1!=null&&
    number_2==null&&
    number_3!=null )
    {
        tt=number+" " + fr+"UAH\n"+
        number_2+" "+third+"UAH\n"+
        "Итого:"+(fr+third)+"UAH\n"
    }
//--
if(number == null&&
    number_1==null&&
    number_2!=null&&
    number_3==null )
    {
        tt=number+" " + fr+"UAH\n"+
        number_1+" " + sec+"UAH\n"+
        number_3+" "+four+"UAH\n\n"+
        "Итого:"+(fr+sec+four)+"UAH\n"
    }
//--
if(number == null&&
    number_1!=null&&
    number_2==null&&
    number_3==null )
    {
        tt=number+" " + fr+"UAH\n"+
        number_2+" "+third+"UAH\n"+
        number_3+" "+four+"UAH\n\n"+
        "Итого:"+(fr+third+four)+"UAH\n"
    }
//--
if(number == null&&
    number_1!=null&&
    number_2!=null&&
    number_3==null )
    {
        tt=number+" " + fr+"UAH\n"+
        number_3+" "+four+"UAH\n\n"+
        "Итого:"+(fr+four)+"UAH\n"
    }
// else{
//     tt="Сегодня у нас выходной.Так что Вы не сможете получить Ваш заказ.";
// }
    alert(tt);