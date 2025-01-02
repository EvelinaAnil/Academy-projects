hryvnia =parseFloat (prompt('Enter the amount of money in UAH:', 100));
euro = parseFloat(prompt('Enter the euro exchange rate:', 0.026));
dollar = parseFloat (prompt('Enter the dollar rate:', 0.027));
euro = hryvnia * euro;
dollar_ = hryvnia * dollar;
var text=
"Amount in euro:"+euro+"\n\
Amount in dollar:"+dollar_+"\n";
alert(text);