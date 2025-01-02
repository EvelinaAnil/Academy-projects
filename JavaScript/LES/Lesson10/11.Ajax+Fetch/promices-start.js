let output = document.getElementById("output");

let randNum = (x) => Math.round(Math.random() * x);

document.getElementById("btn").addEventListener("click", testPromise);

function testPromise() {
  let numPromise = new Promise(function (resolve, reject) {
    let num = randNum(400);

    setTimeout(function () {}, 500);
  });
}
