
let number = parseFloat(prompt("Cколько денег в месяц вам достаточно, чтобы нормально себя чувствовать и позволять себе все, что хочется?"));
if(number<=100)
{
    alert("Скромные у тебя запросы");
}
if(number<=300&&number>=101)
{
    alert("Тебе точно хватает?");
}
if(number<=500&&number>=301)
{
    alert("Наверно, работу удачно нашел...");
}
if(number>=501&&number<=1000)
{
    alert("Ты сам эти деньги зарабатываешь?");
}
if(number>=1000)
{
    alert("Ты бизнесмен?");
}