var fr = parseFloat(prompt("Input first value:",10));
var sec = parseFloat(prompt("Input second value:",10));

var p=parseFloat(((fr*2)+(sec*2))/1000);
var s=parseFloat((fr*sec)/1000000);
var antw = 
"Perimeter: " + p+" meters\n\
Area: "+s+" square meters\n";
alert(antw);