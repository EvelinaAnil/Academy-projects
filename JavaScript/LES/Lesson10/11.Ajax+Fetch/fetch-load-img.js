let output = document.getElementById("output");

let randNum = (x) => Math.round(Math.random() * x);

document.getElementById("btn").addEventListener("click", testPromise);

function testPromise() {
  let numPromise = new Promise(function (resolve, reject) {
    let num = randNum(400);

    console.log(num);

    setTimeout(function () {
      if (num > 200) resolve(`Ура! Вы выиграли! Ваш номер ${num}`);
      else reject(`Увы! Вы проиграли! Ваш номер ${num}`);
    }, 500);
  });

  numPromise

    .then((mes) =>
      output.insertAdjacentHTML(
        "beforeend",
        `<li style="color: green">${mes}</li>`
      )
    )

    .catch((mes) =>
      output.insertAdjacentHTML(
        "beforeend",
        `<li style="color: red">${mes}</li>`
      )
    );
}
