const xhr = new XMLHttpRequest();

xhr.open("GET", "https://api.github.com/users");

xhr.send(null);

xhr.responseType = "json";

xhr.onload = () => {
  if (xhr.readyState == 4) {
    if (xhr.status != 200) {
      alert(xhr.status + ": " + xhr.statusText);
    } else {
      addUser(xhr.response);
    }
  }
};

function addUser(data) {
  let dataStr = "";

  data.forEach((user) => {
    dataStr += `<div class="col-md-4 mb-3">

 <div class="card shadow">
    <div class="card-header text-white bg-success">
        <h3 class="card-title text-center">${user.login}</h3>
    </div>
        <div class="card-img"><img src="${user.avatar_url}" class="img-fluid"></div>
            <div class="card-body"> 
                 <p class="card-text"><a href="${user.html_url}" target="_blank">See files</a></p>
            </div>
        </div>
 </div>`;
  });

  document.querySelector(".user-info").innerHTML += dataStr;
}
