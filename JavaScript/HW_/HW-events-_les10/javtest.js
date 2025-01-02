
//     document.getElementById("container").appendChild(select);
// }

/* Когда пользователь нажимает на кнопку, переключаться раскрывает содержимое */
// function myFunction() {
//     document.getElementById("myDropdown").classList.toggle("show");
//   }
//   // Закрыть раскрывающийся список, если пользователь щелкнет за его пределами.
//   window.onclick = function(event) {
//     if (!event.target.matches('.dropbtn')) {
//       var dropdowns = document.getElementsByClassName("has-children");
//       var i;
//       for (i = 0; i < dropdowns.length; i++) {
//         var openDropdown = dropdowns[i];
//         if (openDropdown.classList.contains('show')) {
//           openDropdown.classList.remove('show');
//         }
//       }
//     }
//   }
//---------
// obj.dd.on('click', function(event){
//   $(this).toggleClass('active');
//   return false;
// });

// //...

// $(function() {

//   var dd = new DropDown( $('#dd') );

//   $(document).click(function() {
//       // all dropdowns
//       $('.wrapper-dropdown-1').removeClass('active');
//   });

// });


//-------
// document.querySelectorAll(".select").forEach((el)=> {
//   el.addEventListener("click", function (e){
//     if (e.target && e.target.matches(".option")) {
//       this.querySelector(".shown").innerHTML = e.target.innerHTML;
//     }
//     this.classList.toggle("collapsed");
//   });
// }); 
//------
//////////
 
//1
// var a = document.getElementsByClassName('submenu');

// var ul = a.nextSibling.nextSibling;

// a.onclick = function() {
  
// 	if (a.classList.contains('menu')) {
//     a.classList.add('menu');
//     ul.style.display = "block";
//   } else {
// a.classList.remove('menu');
//     ul.style.display = "none";
//   }

// }

// $(' submenuul li > a').on('click', function(e) {
//   var li = $(this).closest('li');
//   if (li.find('ul').length) {
//     if (!li.hasClass('active')) {
//       e.preventDefault();
//     }
//     li.toggleClass('active');
//   }
// });
// $(document).mouseup(function(e) {
//   var div = $('li.active');
//   if (!div.is(e.target) && div.has(e.target).length === 0) {
//     div.removeClass('active');
//   }
// });


// window.onclick = function(event) {
// if (!event.target.matches('.dropbtn')) {

//   var dropdowns = document.getElementsByClassName("submenu");
//   var i;
//   for (i = 0; i < dropdowns.length; i++) {
//     var openDropdown = dropdowns[i];
//     if (openDropdown.classList.contains('show')) {
//       openDropdown.classList.remove('show');
//     }
//   }
// }
// }






//2
var pop = document.getElementById('like');
var likes =document.getElementById("like-count");
 var count=30;
 pop.onclick = function() {
  count = count+ 1;
  likes.innerHTML =count;
};
//------------
//3
let coll = document.getElementsByClassName("spoiler-header");
let coll1 = document.getElementsByClassName("fb");
let coll2 = document.getElementsByClassName("fb1");
let bb = document.getElementById("1");
let bb2 = document.getElementById("2");
let bb3 = document.getElementById("3");
for(let i=0;i<coll.length;i++){

  coll[i].addEventListener('click',function () {
    if(bb.classList.contains('active')){
      bb2.classList.remove('active');
      bb3.classList.remove('active');
      bb.classList.toggle('active');
    }else{
      bb2.classList.remove('active');
      bb3.classList.remove('active');
      bb.classList.toggle('active');
    }
    
     
   
  })
}

for(let i=0;i<coll1.length;i++){

  coll1[i].addEventListener('click',function () {
    if(bb2.classList.contains('active')){
      bb2.classList.toggle('active');
      bb3.classList.remove('active');
      bb.classList.remove('active');
    }else{
      bb2.classList.toggle('active');
      bb3.classList.remove('active');
      bb.classList.remove('active');
    }
    
     
   
  })
}

for(let i=0;i<coll2.length;i++){

  coll2[i].addEventListener('click',function () {
    if(bb3.classList.contains('active')){
      bb2.classList.remove('active');
      bb3.classList.toggle('active');
      bb.classList.remove('active');
    }else{
      bb2.classList.remove('active');
      bb3.classList.toggle('active');
      bb.classList.remove('active');
    }
    
     
   
  })
}
//////////
// bb2.addEventListener('click',function () {
//   if(bb2.classList.contains('active')){
//     bb2.classList.toggle('active');
//     bb3.classList.remove('active');
//     bb.classList.remove('active');
//   }else{
//     bb2.classList.toggle('active');
//     bb3.classList.remove('active');
//     bb.classList.remove('active');
//   }
   
 
// })
//не до конца
// var a = document.getElementsByClassName('has-children');

// var ul = a.nextSibling.nextSibling;

// a.onclick = function() {
  
// 	if (a.classList.contains('menu') == false) {
//     a.classList.add('menu');
//     ul.style.display = "block";
//   } else {
// a.classList.remove('menu');
//     ul.style.display = "none";
//   }

// }