document.testForm.onsubmit = function () {
  console.log(document.testForm.userName.value);
  if (document.testForm.userName.value.length < 4) {
    alert("Не менее 4-х символов!"); // return false;
    event.preventDefault();
  }
};
