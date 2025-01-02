const xhr = new XMLHttpRequest();
xhr.open('GET', 'poem.txt', false);
xhr.send(null);
 
if (xhr.status != 200) {
  // обработать ошибку
  alert( xhr.status + ': ' + xhr.statusText ); // пример вывода: 404: Not Found
} else {
  // вывести результат
  test.innerText =  xhr.responseText ; // responseText - текст ответа.
}
