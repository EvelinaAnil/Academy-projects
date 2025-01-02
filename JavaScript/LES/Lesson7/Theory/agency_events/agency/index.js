let liCollection = document.getElementsByClassName("nav-link");
for (let li of liCollection) {
  li.addEventListener("click", function () {
    document.querySelector(".nav-link.active").classList.remove("active");
    li.classList.add("active");
  });
}

//---!!
let toggler = document.getElementsByClassName("navbar-toggler")[0];
toggler.addEventListener("click", function () {
  toggler.nextElementSibling.classList.toggle("collapse");
});
//---

let arrow = document.getElementsByClassName("clickable");

for (let ar of arrow) {
  ar.addEventListener("click", function () {
    if (ar.firstChild.className == "fas fa-chevron-up") {
      ar.firstChild.className == "fas fa-chevron-down";
    } else {
      ar.firstChild.className = "fas fa-chevron-up";
    }

    ar.closest(".panel").classList.toggle("panel-colapsed");
  });
}

const porfolioModal = document.getElementById('portfolioModal')
portfolioLinks = document.querySelectorAll('.portfolio-link');
closeBtns = document.querySelectorAll('[data-dismiss="modal"]');
bigImg = portfolioModal.querySelector('.big-image');
portfolioH2 = portfolioModal.querySelector('h2');

const uLEl = porfolioModal.querySelector('ul.list-inline');


portfolioLinks.forEach(item=> item.addEventListener('click', openModal));
closeBtns.forEach(item=> item.addEventListener('click', closeModal));

function openModal(){
	document.body.classList.add('modal-open'); 
	porfolioModal.style.display = "block";
	bigImg.src = this.dataset.big;
	const h4 = this.nextElementSibling.firstElementChild;
    const pSubtitle =h4.nextElementSibling;

	

	portfolioH2.textContent = h4.textContent;
	portfolioH2.nextElementSibling.textContent =  pSubtitle.textContent;

	uLEl.firstElementChild.nextElementSibling.textContent = `Client: ${h4.textContent}`;
	uLEl.lastElementChild.textContent = `Category: ${pSubtitle.textContent}`;
	console.log(this);
}

function closeModal(){
	document.body.classList.remove('modal-open'); 
	porfolioModal.style.display = "";
}



