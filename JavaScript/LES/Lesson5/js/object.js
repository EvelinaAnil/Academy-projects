let user = {
  name: "Vasya Pupkin",
  age: 28,
  score: 100,
  email: "pupkin@gmail.com",
  increment: function () {
    //console.log(++user.score)
    console.log(++this.score);
  },
};
//console.log(user['name']);
//console.log(user.name);
user.increment();
user.increment();
user.increment();
console.log(user);

//

// let chair={
//      Модель: 'Кресло Примтекс Плюс Ultra Chrome',
//        'Материал корпуса': ['Металл','Пластик'],
//         'Материал обивки': 'Ткань',
//          Цвет: 'Черный',
//           Тип: 'Кресло руководителя' }
// console.log(chair.Модель);
// for(let prop in chair){
//     document.write(`<p>${prop}: ${chair[prop]}</p>`);
//  }

//

//  let student = Object.create(null);
//  student.fio = 'EWEF weqo jJ qw';
//  console.log(student);
//  let nick = Object.create(student);
//  console.log(nick, nick.fio);

//  let person = new Object();
//  person.job = 'Oranje';
//  console.log(person);

//  const ukraine= {
//     name: "Ukraine",
// flag: "https://www.ukrdruk.com/wp-content/uploads/2019/02/flag-00002_800.jpg",
//     tel: '+380'
// }
// const entries = Object.entries(ukraine);
// console.log(entries);

//[
//['name', 'Ukraine'],
//['flag', 'https://www.ukrdruk.com/wp-content/uploads/2019/02/flag-00002_800.jpg'],
// ['tel', '+380']
//]

// entries.forEach(
//     ([key, value]) =>  console.log(`${key}: ${ukraine[key]}`)
//     );

// let map =new Map([
//     ['some','send'],
//     ['temp','string']
// ])
// const er = map.entries();
// console.log(er);
// map.forEach(
//     ([key, value]) =>  console.log(`${key}: ${value}`)
//     );

//     for(let key in ukraine)
//     {
//         console.log(`${key} : ${ukraine[key]}`);
//     }
// const values = Object.values(ukraine);
// console.log(values);

// console.log(entries);
// entries.forEach(
//     ([key, value]) =>  console.log(`${key}: ${value}`)
//     );

//     function Student(firstName, lastName)
//      { this.firstname = firstName;
//         this.lastname = lastName;

// } Student.prototype.showInfo = function() {
//              document.writ
// (`<p>Student ${this.firstname} ${this.lastname}</p>`)
// }
// Student.prototype.getName = function() {
//      return this.firstname + ' ' + this.lastname};
//      Student.prototype.setName = function(newName) {let parts = newName.split(' ');
//      Student.prototype.firstname = parts[0]; this.lastname = parts[1];
// };
// let john = new Student("John", "Konnor");
// console.log(john);
// john.showInfo();
//     console.log(john.getName())

//     let kate = new Student("Kate", "Ivanova");
//     console.log(kate);
//     kate.showInfo();

// kate.setName('Katerina Bannik');
// kate.showInfo();

// let numbers = new Array(1,2,65,67,23,12,97,01,1);
// console.log(numbers);

/////

// function TodoModel() {
//     this.todos = Array.from(arguments);
// } TodoModel.prototype.showList = function()
// {
//     document.write(`<ol><li>${this.todos.join('<li>')}</ol>`);
//  }
// TodoModel.prototype.add = function()
//  {  this.todos.push(...arguments);
//       this.showList(); }
// TodoModel.prototype.remove = function(ind) {
//      this.todos.splice(ind, 1);
//       this.showList(); }

// let list = new TodoModel(
// 'позавтракать', "вігулять собаку", "сходить в магазин");
// console.log(list)

// list.showList();
// list.add("пропылесосить", "позвонить другу", "сделать ДЗ");
// list.remove(2);

//animal
// type, name, speed ,distance, how much tm trevel from start ->end
function Animal(type, name, speed) {
  this.type = type;
  this.name = name;
  this.speed = speed;
}
Animal.prototype.showInfo = function (distance = 500) {
  document.write(
    `<p>${this.type} ${
      this.name
    } go reach the distance of ${distance} m in  [${Math.floor(
      distance / this.speed
    )}] minutes</p>`
  );
};
cat = new Animal("cat", "Vaska", 20);
hamster = new Animal("hamster", "Homka", 1);
cat.showInfo(1000);
hamster.showInfo();

///------

class Human {
  constructor(firstname, lastname, birthday) {
    this.firstname = firstname;
    this.lastname = lastname;
    this.birthday = birthday;
  }
  showInfo() {
    console.log(this.firstname + " " + this.lastname);
  }
  showAge() {
    const deltaTime = Date.now() - Date.parse(this.birthday);
    const age = Math.floor(deltaTime / (365 * 24 * 60 * 60 * 1000));
    console.log(
      this.firstname + " " + this.lastname + " is " + age + " years old."
    );
  }
}
const john1 = new Human("John", "Smith", "09-17-2003");
john1.showInfo();
john1.showAge();
console.log(john1);

// get id(){        return this.#id;     }
//    set id(value){        this.#id = value;     }

//---
class ITMentor extends Teacher { 
    constructor(firstname, lastname,birthday,subjects=[],level)
    {  super(firstname,lastname,birthday,subjects);
   this.level=level; }  showSubjects(){ 
   document.write('<p>With '+this.firstname+' '+this.lastname+' you can=get such IT skills: </p><ol><li>'+this.subjects.join('<li>')+'</ol>');
  } showLevel(){
     console.log(this.firstname+' ' + this.lastname + ' has level '+ this.level);  
        }    }  
    const andrew = new ITMentor("Andrew", "Phillipov", '07/22/1986', ['HTML', 'CSS', 'JavaScript', 'React', 'Angular'], 'Senior'); 
     console.log(andrew); 
      andrew.showSubjects();
 andrew.showAge();