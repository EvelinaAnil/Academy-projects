// let bt = document.querySelectorAll("*[modal]");

// for(let i = 0; i <bt.length; i++){
//     bt[i].addEventListener("click",function() {
//         let name = bt[i].getAttribute('modal');
//         let modal = document.querySelector()
//     })
// }

// const modalElem = document.querySelector('.modal');


// const xhr1 = new XMLHttpRequest();
// xhr1.open('GET', 'about.txt', false);
// xhr1.send(null);
 
// if (xhr1.status != 200) {
//   // обработать ошибку
//   alert( xhr1.status + ': ' + xhr1.statusText ); // пример вывода: 404: Not Found
// } else {
//   // вывести результат
//   test.innerText =  xhr1.responseText ; // responseText - текст ответа.
// }
//   //test - <div id="test"></div> в html-разметке
// //---------
// let xhr = new XMLHttpRequest();

// xhr.open('GET', '/download/about');

// xhr.responseType = 'about';

// xhr.send();

// // тело ответа {"сообщение": "Привет, мир!"}
// xhr.onload = function() {
//   let responseObj = xhr.response;
//   alert(responseObj.message); // Привет, мир!
// };
function NO(){
    var photo = document.getElementsByClassName('modal')[0];
    photo.style.display = 'none';
   }
function OO(){
    var photo_elem = document.getElementsByClassName('modal')[0];
    photo_elem.style.display = 'block';
    var text = document.getElementsByClassName('modal-body')[0];
    
    const createText = text => {
        // создаем экземпляр объекта "FileReader"
        const reader = new FileReader()
        // читаем файл как текст
        // вторым аргументом является кодировка
        // по умолчанию - utf-8,
        // но она не понимает кириллицу
        reader.readAsText(text, 'windows-1251')
        // дожидаемся завершения чтения файла
        // и помещаем результат в документ
        reader.onload = () => B.innerHTML = `<p><pre>${reader.result}</pre></p>`
    }
    text.innerHTML +=`<div class="text-center">
    <h3>About Us</h3>
    <p>Each pet has its own personalities and habits, though our care and love for each pet is equal. We plan every single shipment with love.</p>
</div>

 <div class="row">
  <div class="col-sm-6">
    <img class="img-fluid" src="img/service1.jpg" alt="Service">
  </div>
  <div class="col-sm-6 innewservice-list">
    <p>Antipat is an international pet shipping services company. Our services include but not limit to, pet relocation and pet boarding, etc. Antipat is also an adviser of all sorts of pet related vaccines. We locate in London, England.</p><p>Thanks to the great working relationships and partnerships with each airlines company and our professional team, Antipat has become the major Chinese pet shipping company overseas. We specially are experienced for pets that are going in and out of China, England, the United States of America, other European and American countries.</p>
  </div>
  <!--<div class="col-sm-6 innewservice-list">
    <div class="service-box">
        <div class="item">
            <a href="#">
                <h5>1. Listen and Learn</h5>
                <p>Before  the  shipment,  a  draft  of  how  we  ship  your  pet  back  home  will  be  provided  to  you  so  that  you  can  have  a  general  idea  of  what  needs  to  be  done.  Once  you  have  provided  us  with  the  departure  city  or  airport,  final  destination,  estim...</p>
            </a>
        </div>
    </div>
    <div class="service-box">
      <div class="item">
          <a href="#">
              <h5>2. Customized Shipments</h5>
              <p>Once  we  learn  more  of  the  pet  and  shipment,  we  will  work  on  finding  the  best  flight  route,  confirming  the  size  of  the  kennel  and  proactively  searching  to  see  if  there  are  any  obstacles  or  challenging  that  we  need  to  avoid  or  resolve  to  ...</p>
          </a>
      </div>
    </div>
    <div class="service-box">
        <div class="item">
            <a href="#">
                <h5>3. Booking Our Services</h5>
                <p>Once  we  have  been  notified  that  you  would  like  to  move  forward  with  our  services,  we  will  start  our  planning  immediately.  Planning  usually  includes  booking  flight  for  the  pet,  land  transportation,  appointments  with  animal  hospitals/veterinary  cl...</p>
            </a>
        </div>
    </div>
    <div class="service-box">
        <div class="item">
            <a href="#">
                <h5>4. Documentations and Other Details</h5>
                <p>You  will  be  surprised  the  amount  of  documentations  that  you  need  to  prepare  in  order  to  ship  your  pet  back  home.  What  make  us  difference?  Years  of  experiences  and  we  are  extremely  detail  oriented.  This  makes  us  and  our  services  unique  and ...</p>
            </a>
        </div>
    </div>
    <div class="service-box">
        <div class="item">
            <a href="#">
                <h5>5. Schedules on the Day of Departure</h5>
                <p>On  the  day  of  departure,  we  will  monitor  the  entire  trip  to  make  sure  everything  goes  in  smoothly.  We  will  not  only  keep  an  eye  for  the  shipment  but  also  update  you  with  every  step  of  the  shipment  till  your  pet  is  safely  arrived  to  the...</p>
            </a>
        </div>
    </div>
    <div class="service-box">
        <div class="item">
            <a href="#">
                <h5>6. After Care</h5>
                <p>Please  do  not  hesitate  to  contact  us  with  any  questions  you  may  have  even  after  you  have  been  united  with  your  beloved  pets.  Please  also  be  advised  that  we  keep  all  the  documentations  on  file.  In  case,  when  you  are  moving  with  your  pet  ...</p>
            </a>
        </div>
    </div>
  </div>-->
</div>`;
   }

  //------------
 function click1(){
   
  let s=  document.getElementById("service1");
        s.classList.add("show");
        s.classList.add("active");

        let f=  document.getElementById("serv1");
        f.classList.add("active"); f.ariaSelected="true";

        let s1=  document.getElementById("service2");
        s1.classList.remove("show");
        s1.classList.remove("active");
        let s2=  document.getElementById("service3");
        s2.classList.remove("show");
        s2.classList.remove("active");
        let s3=  document.getElementById("service4");
    s3.classList.remove("show");
    s3.classList.remove("active");
    let s4=  document.getElementById("service5");
    s4.classList.remove("show");
    s4.classList.remove("active");
    let s5=  document.getElementById("service6");
    s5.classList.remove("show");
    s5.classList.remove("active");
 }
 function click2(){s.ariaSelected="true";
    let s=  document.getElementById("service2");
    s.classList.add("show");
    s.classList.add("active");
    let f=  document.getElementById("serv2");
    f.classList.add("active"); f.ariaSelected="true";      

    let s1=  document.getElementById("service1");
        s1.classList.remove("show");
        s1.classList.remove("active");
        let s2=  document.getElementById("service3");
        s2.classList.remove("show");
        s2.classList.remove("active");
        let s3=  document.getElementById("service4");
    s3.classList.remove("show");
    s3.classList.remove("active");
    let s4=  document.getElementById("service5");
    s4.classList.remove("show");
    s4.classList.remove("active");
    let s5=  document.getElementById("service6");
    s5.classList.remove("show");
    s5.classList.remove("active");
   }
   function click3(){
    let s=  document.getElementById("service3");
    s.classList.add(" show ");
    s.classList.add(" active ");
    let s1=  document.getElementById("service2");
    s1.classList.remove("show");
    s1.classList.remove("active");
    let s2=  document.getElementById("service1");
    s2.classList.remove("show");
    s2.classList.remove("active");
    let s3=  document.getElementById("service4");
s3.classList.remove("show");
s3.classList.remove("active");
let s4=  document.getElementById("service5");
s4.classList.remove("show");
s4.classList.remove("active");
let s5=  document.getElementById("service6");
s5.classList.remove("show");
s5.classList.remove("active");
   }
   function click4(){
    let s=  document.getElementById("service4");
    s.classList.add(" show ");
    s.classList.add(" active ");
    let s1=  document.getElementById("service2");
    s1.classList.remove("show");
    s1.classList.remove("active");
    let s2=  document.getElementById("service3");
    s2.classList.remove("show");
    s2.classList.remove("active");
    let s3=  document.getElementById("service1");
s3.classList.remove("show");
s3.classList.remove("active");
let s4=  document.getElementById("service5");
s4.classList.remove("show");
s4.classList.remove("active");
let s5=  document.getElementById("service6");
s5.classList.remove("show");
s5.classList.remove("active");
   }
   function click5(){
    let s=  document.getElementById("service5");
    s.classList.add(" show ");
    s.classList.add(" active ");
    let s1=  document.getElementById("service2");
    s1.classList.remove("show");
    s1.classList.remove("active");
    let s2=  document.getElementById("service3");
    s2.classList.remove("show");
    s2.classList.remove("active");
    let s3=  document.getElementById("service4");
s3.classList.remove("show");
s3.classList.remove("active");
let s4=  document.getElementById("service1");
s4.classList.remove("show");
s4.classList.remove("active");
let s5=  document.getElementById("service6");
s5.classList.remove("show");
s5.classList.remove("active");
   }
   function click6(){
    let s=  document.getElementById("service6");
    s.classList.add("show");
    s.classList.add("active");
    let s1=  document.getElementById("service2");
    s1.classList.remove("show");
    s1.classList.remove("active");
    let s2=  document.getElementById("service3");
    s2.classList.remove("show");
    s2.classList.remove("active");
    let s3=  document.getElementById("service4");
s3.classList.remove("show");
s3.classList.remove("active");
let s4=  document.getElementById("service5");
s4.classList.remove("show");
s4.classList.remove("active");
let s5=  document.getElementById("service1");
s5.classList.remove("show");
s5.classList.remove("active");
   }

   //-------
function tovar(){
    let i =document.getElementById("curtNum");
    i.innerText++;

}