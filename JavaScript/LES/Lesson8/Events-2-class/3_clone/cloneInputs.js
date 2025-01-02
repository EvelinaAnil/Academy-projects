let plusBtns = document.getElementsByClassName("plus-btn");
for (let btn of plusBtns) {
  btn.addEventListener("click", function () {
    let newFields = this.parentNode.cloneNode(true);
    formSubmit.parentElement.before(newFields);
    console.log(plusBtns.length);
  });
}

//----

document.cloneForm.addEventListener("click", function (e) {
  if (e.target.className == "plus-btn") {
    //console.log(e.target.parentElement);
    let newField = e.target.parentElement.cloneNode(true);
    formimSubt.parentElement.before(newField);
  }
});
