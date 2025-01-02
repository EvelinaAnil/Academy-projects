var btns = document.querySelectorAll(".btn");

for (let i = 0; i < btns.length; i++) {
  btns[i].addEventListener("click", function () {
    document.body.style.backgroundColor = btns[i].style.backgroundColor;
  });
}

document.getElementById("colors").addEventListener("click", function (event) {
  console.log(event.target, event.currentTarget);
  if (event.target.tagName == "LI")
    document.body.style.backgroundColor = event.target.style.backgroundColor;
});

document.body.addEventListener("keydown", function (evt) {
  console.log(evt.keyCode);
  switch (evt.keyCode) {
    case 49:
    case 97:
      document.body.style.backgroundColor = "#000";
      break;
    case 50:
    case 98:
      document.body.style.backgroundColor = "#333";
      break;
    case 51:
    case 99:
      document.body.style.backgroundColor = "#666";
      break;
    case 52:
    case 100:
      document.body.style.backgroundColor = "#999";
      break;
    case 53:
    case 101:
      document.body.style.backgroundColor = "#f00";
      break;
    default:
      document.body.style.backgroundColor = "#fff";
  }
});
