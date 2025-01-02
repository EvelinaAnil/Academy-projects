let user = {
  name: "Vasya Pupkin",
  age: 28,
  score: 230,
  email: "pupkin@gmail.com",
  increment: function () {
    console.log(++this.score);
  },
};

user.increment();
user.increment();
user.increment();

const ukraine = {
  name: "Ukraine",
  flag: "https://www.ukrdruk.com/wp-content/uploads/2019/02/flag-00002_800.jpg",
  tel: "+380",
};
/* const keys = Object.keys(ukraine);
  console.log(keys); 
  keys.forEach(key => {
    console.log(`${key} : ${ukraine[key]}`);
  });
  
  for(let key in ukraine){
    console.log(`${key} : ${ukraine[key]}`);
  } */

/* const values = Object.values(ukraine);
  console.log(values); 
  
  values.forEach(val => console.log(val))
  
  let map = new Map([
    ['some', 'send'],
    ['temp', 'string'],
  ]);
  const entries = map.entries();
  console.log(entries); 
  map.forEach((key, value) =>  console.log(`${key}: ${value}`)); */

function Student(firstName, lastName) {
  this.firstname = firstName;
  this.lastname = lastName;
}
Student.prototype.showInfo = function () {
  document.write(`<p>Student ${this.firstname} ${this.lastname}</p>`);
};
Student.prototype.getName = function () {
  return this.firstname + " " + this.lastname;
};
Student.prototype.setName = function (newName) {
  let parts = newName.split(" ");
  this.firstname = parts[0];
  this.lastname = parts[1];
};

let john = new Student("John", "Konnor");
console.log(john);
john.showInfo();
console.log(john.getName());

let kate = new Student("Kate", "Ivanova");
console.log(kate);
kate.showInfo();

kate.setName("Katerina Bannikova");
kate.showInfo();

let numbers = new Array(4, 7, 10, 12);
console.log(numbers);
let sum = numbers.reduce((previous, current) => {
  return previous + current;
});
console.log(sum);

/* function TodoModel() {
    this.todos = Array.from(arguments);
  }
  TodoModel.prototype.showList = function() {
    document.write(`<ol><li>${this.todos.join('<li>')}</ol>`);
  }
  TodoModel.prototype.add = function() {
    this.todos.push(...arguments);
    this.showList();
  }
  
  TodoModel.prototype.remove = function(ind) {
    this.todos.splice(ind-1, 1);
    this.showList();
  }
  
  let list = new TodoModel('позавтракать', "выгулять собаку", "сходить в магазин");
  console.log(list);
  list.showList();
  list.add("пропылесосить", "позвонить другу", "сделать ДЗ");
  list.remove(2);
  
  function Animal(type, name, speed){    this.type = type;    this.name = name;    this.speed  = speed;}Animal.prototype.showInfo = function(distance=500){    document.write(`<p>${this.type} ${this.name} go reach the distance of ${distance} m in  [${Math.floor(distance/this.speed)}] minutes</p>`);}cat = new Animal('cat', 'Vaska', 20);hamster = new Animal('hamster', 'Homka',1 );cat.showInfo(1000);hamster.showInfo(); */

class Human {
  #id;
  constructor(firstname, lastname, birthday) {
    this.firstname = firstname;
    this.lastname = lastname;
    this.birthday = birthday;
    this.#id = Math.floor(Math.random() * 10e6);
  }
  showInfo() {
    console.log(this.firstname + " " + this.lastname);
  }
  showAge() {
    const deltaTime = Date.now() - Date.parse(this.birthday);
    const age = Math.floor(deltaTime / (365 * 24 * 60 * 60 * 1000));
    console.log(
      this.firstname + " " + this.lastname + " is " + age + " years old."
    );
  }
  get id() {
    return this.#id;
  }
  set id(value) {
    this.#id = value;
  }
  toString() {
    return (
      this.firstname + " " + this.lastname + " is a " + this.constructor.name
    );
  }
}

const john1 = new Human("John", "Smith", "09-17-2003");
john1.showInfo();
john1.firstname = "Joschua";
john1.lastname = "Birman";
john1.showAge();
console.log(john1.id);

class Teacher extends Human {
  constructor(firstname, lastname, birthday, subjects = []) {
    super(firstname, lastname, birthday);
    this.subjects = subjects;
  }
  showSubjects() {
    console.log(
      this.firstname +
        " " +
        this.lastname +
        " can teach you " +
        this.subjects.join(", ")
    );
  }
}

const roman = new Teacher("Roman", "Ivanov", "3-12-1988", ["JavaScript", "C#"]);
console.log(roman);
roman.showSubjects();
roman.showAge();
roman.showInfo();

class ITMentor extends Teacher {
  constructor(firstname, lastname, birthday, subjects = [], level) {
    super(firstname, lastname, birthday, subjects);
    this.level = level;
  }
  showSubjects() {
    document.write(
      "<p>With " +
        this.firstname +
        " " +
        this.lastname +
        " you can get such IT skills: </p><ol><li>" +
        this.subjects.join("<li>") +
        "</ol>"
    );
  }
  showLevel() {
    console.log(
      this.firstname + " " + this.lastname + " has level " + this.level
    );
  }
}
const andrew = new ITMentor(
  "Andrew",
  "Phillipov",
  "07/22/1986",
  ["HTML", "CSS", "JavaScript", "React", "Angular"],
  "Senior"
);
console.log(andrew);
andrew.showSubjects();
andrew.showAge();

document.write("Class Human: " + john1 + "<br>");
document.write("Class Teacher: " + roman + "<br>");
document.write("Class ITMentor: " + andrew + "<br>");

console.log(john1 instanceof Human); //true
console.log(roman instanceof Teacher); //true
console.log(roman instanceof Human); //true
console.log(roman instanceof ITMentor); //false
console.log([1, 2, 3] instanceof Array); //true
console.log([1, 2, 3] instanceof Date); //false

const str = `Заголовок раздела`;
console.log(str[str.length - 2]);
console.log(str.indexOf("а"));
console.log(str.lastIndexOf("а"));
console.log(str.lastIndexOf("ок"));
console.log(str.lastIndexOf("Заголовок"));

String.prototype.calcLetter = function (letter) {
  let count = 0;
  let index = this.indexOf(letter);
  while (index != -1) {
    console.log(index);
    count++;
    index = this.indexOf(letter, index + 1);
  }
  return count;
};

//console.log(calcLetter("а"));

class StringInfo extends String {
  calcLetter(letter) {
    let count = 0;
    let index = this.indexOf(letter);
    while (index != -1) {
      count++;
      index = this.indexOf(letter, index + 1);
    }
    return count;
  }
}
let myStr = new StringInfo("When the going gets tough, the tough get going.");
console.log('g in "' + myStr + '" = ' + myStr.calcLetter("g"));
console.log('going in "' + myStr + '" = ' + myStr.calcLetter("going"));
console.log('"text" in "' + myStr + '" = ' + myStr.calcLetter("text"));

console.log('"ло" in "' + str + '" = ' + str.calcLetter("ло"));

console.log(str.charAt(11));
console.log(str.charCodeAt(0), str.charCodeAt(1));
for (let char of str) {
  document.write(char + "<br>");
}

console.log(str.concat('"Некий раздел"'));
console.log(str);
console.log(str.toLowerCase(), str);
console.log(str.toUpperCase(), str);
let strSplit = str.split(" ");
console.log(strSplit);

let complex = "Разминка;Растяжка;Наклоны;Отжимания;Расслабление";
let strSplit1 = "<li>" + complex.split(";").join("<li>");
document.write(`<ol>  ${strSplit1} </ol>`);

// function palindrome(str) {
//     let check = '';
//     for (let i = str.length - 1; i >= 0; --i) {
//       check += str[i];
//     }
//     return str == check;
//   }

// console.log(palindrome("шабаш"));

function isPalindrome(word) {
  var lettersOnly = word.toLowerCase().replace(/\s/g, "");

  return lettersOnly === lettersOnly.split("").reverse().join("");
}
console.log(isPalindrome("шабаш"));

let s1 = "Аргентина манит негра",
  s2 = "Произвольная строка",
  s3 = "Шабаш";
function palindrom(str) {
  let str1 = str.toLowerCase().split(" ").join("");
  let str2 = str1.split("").reverse().join("");
  return str1 == str2;
}
console.log(palindrom(s1));
console.log(palindrom(s2));
console.log(palindrom(s3));
//s1.slise(0,-10);
//s1.substring(0,-10);
//s1.substr(0,-10);

let lorem = [
  "Lorem ipsum dolor sit amet, consectetur adipisicing elit. Dolore, quisquam.",
  "Fuga quas doloribus libero veniam excepturi laborum quod eos labore?",
  "Veniam omnis culpa, odio porro eveniet ad expedita sequi qui.",
  "Soluta id dolores dolorem quos quam veniam nostrum voluptatum sunt.",
];
document.write(`<ol>`);
for (let i = 0; i < lorem.length; i++) {
  document.write(
    `<li><b style="color:red">${lorem[i].substring(0, 1)}</b>${lorem[
      i
    ].substring(1)}</li>`
  );
}
document.write(`</ol>`);
var re1 = /([A-zа-яё]+)\s([A-zа-яё]+)/i;
var st = "D Смит";
var newst = st.replace(re1, "$2, $1");
console.log(newst);

var re = /(\w+)\s(\w+)/;
var str1 = "John Smith";
var newstr = str1.replace(re, "$2, $1");
console.log(newstr);
//--

let someDates = [
  "22.06.1941",
  "12.04.1961",
  "01.09.1939",
  "07.11.1917",
  "24.08.1992",
  "12.12.2012",
  "01.01.2021",
];
let dateFormat = someDates.map((one) => {
  let dateStr = one.replace(/(\d{2})\.(\d{2})\./, "$2.$1.");
  console.log(one, dateStr);
  return new Date(dateStr);
});
console.log(dateFormat);

var strOutput = "list-style-type";
document.write("<p>" + strOutput + "</p>");
let camel = strOutput.replace(/(-[a-z])/g, (str) => str.slice(1).toUpperCase());
document.write("<p>" + camel + "</p>");
