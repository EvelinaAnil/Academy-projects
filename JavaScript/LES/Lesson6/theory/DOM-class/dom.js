// console.log(document.documentElement);
// console.log(document.head);
// console.log(document.body);

// document.body.style.backgroundColor = "cyan";
// document.body.style.border = "6px solid white";

// console.log(document.body.firstChild);
// console.log(document.body.firstElementChild);
// console.log(document.body.lastElementChild);
// console.log(document.body.childNodes);
// console.log(document.body.children);

//-------------------------------------

// const container = document.body.firstElementChild;
// console.log(container.children);
// const mheader = document.getElementById("myHeader");
// mheader.style.backgroundColor = "#900";
// mheader.style.padding = "10px";

//--
// let pcollect = document.getElementsByTagName("p");
// console.log(pcollect);

// for (let p of pCollection) {
//   p.style.backgroundColor = "#900";
//   p.style.padding = "10px";
// }

// for (let i = 0; i < pCollection.length; i++) {
//   pCollection[i].style.backgroundColor = "#f90";
//   pCollection[i].style.padding = "20px";
// }

// for (let i = 0; i < pCollection.length; i++) {
//   pCollection[i].style.cssText =
//     "background-color: rgb(153, 0, 0); color: rgb(255, 255, 255); padding: 20px;";
// }
//-----
let cards = document.getElementsByClassName("card");
console.log(cards);
let middleCard = cards[1];
console.log(middleCard.previousElementSibling);
console.log(middleCard.nextElementSibling);
//-------

for (let card of cards) {
  card.firstElementChild.lastElementChild.className = "hover-img";
}
//------==--------

// let elem = document.querySelector(".text-left");
// console.log(elem);
// let h3 = document.querySelectorAll(".text-left");
// console.log(h3);
// for (let one of h3) {
//   one.className = "text-center";
// }

// h3.forEach((elem) => (elem.textContent = "Лучшие очки"));

h3.forEach((elem, ind) => (elem.textContent = "Лучшие очки " + (ind + 1)));
Array.from(cards).forEach(
  (card) => (card.firstElementChild.lastElementChild.className = "hover-img")
);

// h3.forEach(
//   (elem, ind) =>
//     (elem.innerHTML =
//       'Лучшие <span style="font-size: 2em">очки</span> ' + (ind + 1))
// );

// h3.forEach((elem, ind) => {
//   elem.oldText = elem.innerHTML;
//   elem.innerHTML =
//     'Лучшие <span style="font-size: 2em">очки</span> ' + (ind + 1);
// }); //textContent => получение/замена текста//innerText => получение/замена текста//innerHTML  => получение/замена текста + теги с атрибутами

// h3.forEach((elem, ind) => {
//   elem.dataset.oldText = elem.innerHTML;
//   elem.innerHTML =
//     'Лучшие <span style="font-size: 2em">очки</span> ' + (ind + 1);
//   console.log(elem.dataset.oldText);
// });

// console.log(document.links);
// console.log(document.images);
// console.log(document.forms);

for (let link of document.links) {
  //   //console.log(link.matches(".more"));
  if (!link.matches(".more")) {
    link.href = "https://kupit-ochki.com.ua/";
    link.target = "_blank";
  }
}


let cardImg = document.querySelectorAll("[data-rating]");
cardImg.forEach((item) => {
  let rating = item.dataset.rating;
  console.log(rating);
  let div = document.createElement("div");
  div.className = "rating";
  div.classList.add('rating','bg');
  div.classList.remove('bg');
  for (let i = 0; i < 5; i++) {
    let span = document.createElement("span");
    span.className = i < rating ? "star" : "star-outline";
    div.appendChild(span);
  }
  item.nextElementSibling.append(div);
});


