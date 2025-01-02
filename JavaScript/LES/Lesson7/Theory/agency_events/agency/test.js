function changeImg(elem) {
  elem.src = "https://source.unsplash.com/qZ-U9z4TQ6A/400x300";
}
function backImg(elem) {
  elem.src = "https://source.unsplash.com/d3bYmnZ0ank/400x300";
}

function changeImgTwice(elem) {
  if (elem.dataset.src == "main") {
    elem.src =
      "https://source.unsplash.com/" + elem.dataset.imgMain + "/400x300";
    elem.dataset.src = "change";
  } else {
    elem.src =
      "https://source.unsplash.com/" + elem.dataset.imgChange + "/400x300";
    elem.dataset.src = "main";
  }
}

function redElem() {
  this.style.color = "red";
}

let pCollection = document.getElementsByTagName("p");
for (let p of pCollection) {
  p.onclick = function () {
    // this.classList.toggle('bigger');
    if (p.classList.contains("bigger")) p.classList.remove("bigger");
    else p.classList.add("bigger");
  };
  p.addEventListener("click", redElem);
}

pCollection[0].removeEventListener("çlick", redElem);
pCollection[6].onclick = removeElem;
pCollection[5].onclick = removeElem;
document.images[0].onclick = removeElem;

function removeElem() {
  this.remove();
}

document.querySelector(".img-hover").addEventListener(
  "click",
  function () {
    this.style.transform = "scale(1.5)";
  },
  { once: true }
);
