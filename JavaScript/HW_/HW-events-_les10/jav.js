

//2++
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
for(let i=0;i<coll.length;i++){
  coll[i].addEventListener('click',function () {
    
  })
}