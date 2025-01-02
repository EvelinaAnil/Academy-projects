var pr = +prompt("Ввести последовательно 2 числа, например, 10 и 5?");
var pv = +prompt("Ввести последовательно 2 числа, например, 10 и 5?");
var sum=0;
var numb=1;
var antword;
while(antword==good){
antword = 
+prompt("Ввести последовательно 2 числа, например, "
+(pr*(numb*=5))+" и "+(pv*(numb)));
var good=(pr*(numb))+(pv*(numb)); ++sum;
}
alert("К сожелению ,Вы все таки ошиблись после "+sum+" ошибок");
