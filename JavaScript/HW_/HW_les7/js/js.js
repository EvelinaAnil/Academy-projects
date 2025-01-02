/*Задание 1
Написать функцию, к
оторая принимает словосочетание и превращает его в аббревиатуру. 
 Например: cascading style sheets в CSS, объектно-ориентированное программирование в ООП
*/
function Abbriature(words) {
    return words
      .split(' ')
      .reduce((prevval, curword) => prevval + (curword ? curword[0]: ''), '')
      .toUpperCase()
  }
  console.log(Abbriature('cascading style sheets в CSS'))

/*Задание 2
Написать функцию, 
которая принимает строку и выводит статистику о ней: 
количество букв, количество цифр и количество других знаков.
*/
function countMs(text) {
let countw=0;let countn=0;let counts=0;let countr=0;
//const words=/[a-z]/gi;
const Words =  ['a','A','b','B','c','C','d','D','e','E','f','F','g','G','h','H','i','I',
'j','J','k','K','l','L','m','M','n'
,'N','o','O','p','P','q','Q','r','R','s','S','t','T','u','U','v','V','w','W','x','X','y','Y',
'z','Z',
'а', 'б', 'в', 'г', 'д', 'е', 'ё', 'ж', 'з', 'и', 'й', 'к', 'л', 'м', 'н', 'о', 'п', 'р', 'с', 'т', 'у', 'ф', 'х', 'ц', 'ч', 'ш', 'щ', 'э', 'ю', 'я',
'А', 'Б', 'В', 'Г', 'Д', 'Е', 'Ё', 'Ж', 'З', 'И', 'Й', 'К', 'Л', 'М', 'Н', 'О', 'П', 'Р', 'С', 'Т', 'У', 'Ф', 'Х', 'Ц', 'Ч', 'Ш', 'Щ', 'Э', 'Ю', 'Я'];
const numbers=['1','2','3','4','5','6','7','8','9','0'];
const space=[' '];
const recht=['!','@','#','$','%','^','&','*','(',')','[',']','{','}','?','/','|','\\','-','+','=','_','.',',','~','`'
            ,'"','№',';',':'];
    for(let char of text.toLowerCase()){
        if(Words.includes(char) ){
                countw+=1;
        }
        // if(words.includes(char) ){
        //     countw+=1;
        // }
        if(numbers.includes(char)){
            countn+=1;
        }
        if(space.includes(char)){
            counts+=1;
        }
        if(recht.includes(char)){
            countr+=1;
        }
    }
 return `Words:${countw} Numbers:${countn} Space:${counts}  Recht:${countr}`;
}

console.log(countMs("Hellom 2woMrld!12  wwww4 = 16вцййпмдлвцйУРА"))
/*Задание 3
Написать функцию,
 которая принимает двузначное число и возвращает его в текстовом ви-де. 
 Например: 35 – тридцать пять, 89 – восемьдесят девять, 12 – двенадцать. 
*/
function numberToText(par) {
    let res = "";
    let arrOfStrings = [
      "ноль",
      "один",
      "два",
      "три",
      "четыре",
      "пять",
      "шесть",
      "семь",
      "восемь",
      "девять",
      "десять",
      "одиннадцать",
      "двенадцать",
      "тринадцать",
      "четырнадцать",
      "пятнадцать",
      "шестнадцать",
      "семнадцать",
      "восемьнадцать",
      "девятнадцать"
      // "двадцать",
      // "тридцать",
      // "сорок",
      // "пятьдесят",
      // "шестьдесят",
      // "семьдесят",
      // "восемьдесят",
      // "девяносто"
    ];
  
    if (par >= 10 && par < 20) {
      res = arrOfStrings[par];
    }
    if (par >= 20 && par <= 99) {
      let twoDigitNumber = parseInt(par / 10, 10);
      let oneDigitNumber = par % 10;
  
      if (twoDigitNumber * 10 === 20 || twoDigitNumber * 10 === 30) {
        if (par % 10 === 0) {
          return arrOfStrings[twoDigitNumber] + "дцать ";
        } else {
          return (
            arrOfStrings[twoDigitNumber] + "дцать " + arrOfStrings[oneDigitNumber]
          );
        }
      }
      if (twoDigitNumber * 10 === 40) {
        if (par % 10 === 0) {
          return "сорок ";
        } else {
          return "сорок " + arrOfStrings[oneDigitNumber];
        }
      }
      if (twoDigitNumber * 10 === 90) {
        if (par % 10 === 0) {
          return "девяносто ";
        } else {
          return "девяносто " + arrOfStrings[oneDigitNumber];
        }
      }
      if (
        twoDigitNumber * 10 === 50 ||
        twoDigitNumber * 10 === 60 ||
        twoDigitNumber * 10 === 70 ||
        twoDigitNumber * 10 === 80
      ) {
        if (par % 10 === 0) {
          return arrOfStrings[twoDigitNumber] + "десят ";
        } else {
          return (
            arrOfStrings[twoDigitNumber] + "десят " + arrOfStrings[oneDigitNumber]
          );
        }
      }
    }
    return res;
}

console.log(numberToText(20));
console.log(numberToText(25));
console.log(numberToText(40));
console.log(numberToText(44));
console.log(numberToText(30));
console.log(numberToText(35));
console.log(numberToText(89));
console.log(numberToText(12));
console.log(numberToText(90));
console.log(numberToText(97));
/*Задание 4
Написать функцию,
 которая заменяет в полученной строке большие буквы на маленькие,
  маленькие – на большие, а цифры – на знак нижнего подчеркивания. 
*/


const str = 'БОЛЬШИЕ БУКВЫ на маленькие, маленькие – НА БОЛЬШИЕ 123456789 EmE';

function changeSize (str) {
let result = [];
  
  for(var i = 0; i < str.length; i++) {
    if(/^\d+$/.test(str[i])) {
      result.push('_');
    }
    else if(str[i].toUpperCase() === str[i]) {
      result.push(str[i].toLowerCase());
    }
    else if(str[i].toLowerCase() === str[i]) {
      result.push(str[i].toUpperCase());
    }
    else {
      result.push(str[i]);
    }
  }
  return result.join('');
};

console.log(str);
console.log(changeSize(str));
/*Задание 5
Написать функцию, которая получает url и выводит подробную информацию о нем. 
Например: url “https://itstep.org/ua/about”, 
информация “протокол: https, домен: itstep.org, путь: /ua/about”.
*/
function GetUrl(url) {
let obj;let protocol;let domain;let way;
    obj = new URL(url);
    protocol = obj.protocol;
    protocol = protocol.slice(0, protocol.length - 1);
    domain = obj.hostname;
    way = obj.pathname;
    way = way.slice(1);
    return "Информация\nпротокол: " + protocol
        + "\nдомен: " + domain + "\nпуть: " + way;
}
console.log(GetUrl('https://www.site.net/file/file2/photo.png?age=20#anchor'));