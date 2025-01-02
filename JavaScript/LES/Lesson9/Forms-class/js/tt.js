console.log(location.href);

document.f1.search.addEventListener("change", function () {
  location.href = this.value;
  //location.replace( this.value);
});

const pic = document.getElementById("pic");

document.f2.choosePic.addEventListener("change", function () {
  pic.src = this.value;

  pic.title = this.options[this.selectedIndex].text;
});

//----
const formEdu = document.edu_options,
  tr = document.querySelectorAll("#edu_table tr"),
  end_price = document.getElementById("end_price");

function checkPrice() {
  let price = [0, 0, 0, 0];

  let sum = 0;

  for (let i = 1; i < tr.length - 1; i++) {
    for (let j = 0; j < 2; j++) {
      if (formEdu["edu_type" + i][j].checked)
        price[i] += +formEdu["edu_type" + i][j].dataset.price;

      if (formEdu["edu_lang" + i][j].checked)
        price[i] += +formEdu["edu_lang" + i][j].dataset.price;
    }

    formEdu["edu_price" + i].value = price[i];

    sum += price[i];
  }

  end_price.textContent = sum;
}

checkPrice();

for (let elem of formEdu.elements) {
  if (elem.type == "radio") elem.onclick = checkPrice;
}
