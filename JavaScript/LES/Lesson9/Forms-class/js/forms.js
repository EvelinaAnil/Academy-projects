//document.forms["userForm"].style.backgroundColor='lightblue';
// document.getElementById("userForm").
// style.backgroundColor='lightblue';
// document.userForm.style.backgroundColor = 'lightblue';
// document.getElementById("fio").style.backgroundColor = 'yellow';

document.userForm.style.backgroundColor = "lightblue";
document.fio.style.backgroundColor = "lightyellow";

document.querySelector("[name='agreeForm']").style.backgroundColor =
  "lightpink";

document.querySelector("#fio").style.backgroundColor = "lightorange";

document.querySelector("[name='agreeForm']").style.backgroundColor = "yellow";

document.forms[0].elements[0].style.backgroundColor = "orange";

document.forms[0]["info"].style.backgroundColor = "lightgrey";

document.userForm.pass.style.backgroundColor = "grey";

document.getElementsByName("login")[0].style.backgroundColor = "lime";

const login = document.userForm.login;
const pass = document.userForm.pass;
const info = document.userForm.info;
document.userForm.check.onclick = function () {
  if (login.value.length < 4) {
    alert("Login: Не менее 4-х символов!");
    login.focus();
    return false;
  }
  if (pass.value.length < 8) {
    alert("Pass: Не менее 8-х символов!");
    pass.focus();
    return false;
  } else {
    info.value = `Login: ${login.value} \t
Password:${pass.value}\n-----------------`;
  }
};

document.userForm.onsubmit = function () {
  if (info.value.length < 20) {
    alert("You need fill u fields!");
    info.focus();
    return false;
  }
};

const passField = document.getElementById("hidePass");

const eye = document.getElementsByClassName("eye")[0];

eye.addEventListener("click", function () {
  passField.type == "password"
    ? (passField.type = "text")
    : (passField.type = "password");

  eye.classList.toggle("hide");
});

document.agreeForm.agree.addEventListener("click", function () {
  this.checked
    ? (document.agreeForm.continueBtn.disabled = false)
    : (document.agreeForm.continueBtn.disabled = true);
});

document.agreeForm.agree.addEventListener("click", function () {
  this.parentElement.nextElementSibling.disabled = !this.checked;
});

document.getElementById("myInput").addEventListener("input", function () {
  symbolsLeft.textContent = "Left " + (20 - this.value.length) + " symbols";
  if (this.value.length == 20) {
    outputText.textContent += this.value + " ";
    this.value = "";
  }
});

document.fio.all.onclick = function () {
  if (this.checked) {
    this.nextElementSibling.textContent = `Снять выделение`;

    for (let c of document.fio.elements) {
      c.checked = true;
    }
  } else {
    this.nextElementSibling.textContent = `Выделить всех`;

    for (let c of document.fio.elements) {
      c.checked = false;
    }
  }
};

const bgs = document.chooseBg.bg;

for (let bg of bgs) {
  bg.onclick = function () {
    if (bg.value == "none") document.body.style.cssText = "";
    else document.body.style.cssText = `background-image: url(${bg.value})`;
  };
}
