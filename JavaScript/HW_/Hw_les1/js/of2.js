var eet_1 = toString( prompt("Input snack(salad):",""));
var eet_2 = toString( prompt("Input first dish:",""));
var eet_3 = toString( prompt("Input second dish:",""));
var eet_4 = toString( prompt("Input desert:",""));

var d1= parseFloat(12.5);
var d2= parseFloat(18.2);
var d3= parseFloat(24.3);
var d4= parseFloat(10.5);
var text =
"You ordered:\n\
    "+eet_1+" -"+d1+"UAH.\n\
    "+eet_2+" -"+d2+"UAH.\n\
    "+eet_3+" -"+d3+"UAH.\n\
    "+eet_4+" -"+d4+"UAH.\n\
Total: "+ parseFloat(d1+d2+d3+d4)+"UAH.";
alert(text);