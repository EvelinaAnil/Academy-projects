function summary() {
    let count = document.getElementsByClassName('question').length; //Количество вопросов
    let answers = document.querySelectorAll('.question'); //Все элементы div с вопросами (???)
    let score = 0; //Количество верных ответов
    let rightAnswers = ["a_1", "a_3", "a_1"] //Список верных ответов
  
    for (let i = 0; i < count; i++) {
      let chosenAnswer = answers[i].querySelector("input[type='radio']:checked"); //Из массива вопросов выбираем элемент радио, который выбрал пользователь
      if (chosenAnswer && chosenAnswer.id == rightAnswers[i]) //Думал что будет работать если будет свреять по html разметке, но зря
      {
        score++;
      }
      console.log("Выбранный ответ: " + chosenAnswer && chosenAnswer.parentNode.textContent);
      console.log("Правильный ответ: " + rightAnswers[i]);
      console.log("Очки: " + score);
    }
    console.log("---------------------------------");
  }