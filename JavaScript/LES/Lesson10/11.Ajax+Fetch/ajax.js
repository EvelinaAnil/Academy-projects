const xhr = new XMLHttpRequest();

xhr.open('GET', 'poem.txt', true);

xhr.send(null);

xhr.onload = () => {
  if (xhr.readyState == 4) {
    if (xhr.status != 200) {
      // обработать ошибку

      test.innerText = xhr.status + ": " + xhr.statusText; // пример вывода: 404: Not Found
    } else {
      // вывести результат

      test.innerText = xhr.responseText; // responseText - текст ответа.
    }
  }
};

