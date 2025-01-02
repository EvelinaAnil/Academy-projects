var aa = document.querySelectorAll(".a");

for (let i = 0; i < aa.length; i++) {
    aa[i].addEventListener("click", function () {
    document.circle.backgroundColor = aa[i].circle.backgroundColor;
  });
}

document.getElementById("colors").addEventListener("click", function (event) {
  console.log(event.target, event.currentTarget);
  if (event.target.tagName == "img"){
    ImageBitmap.name="img/green.webp";
  }
  //  document.body.style.backgroundColor = event.target.style.backgroundColor;
});



document.body.addEventListener("keydown", function (evt) {
    console.log(evt.keyCode);
    switch (evt.keyCode) {
      case 49:
      case 97:
        document.body.style.backgroundColor = "lightgray";
        break;
      case 50:
      case 98:
        document.body.style.backgroundColor = "green";
        break;
      case 51:
      case 99:
        document.body.style.backgroundColor = "black";
        break;
      case 52:
      case 100:
        document.body.style.backgroundColor = "pink";
        break;
      case 53:
      case 101:
        document.body.style.backgroundColor = "maroon";
        break;
      default:
        document.body.style.backgroundColor = "white";
    }
  });