var word = prompt('Введите слово');
while (!confirm('Хватит?')) {
    var w = prompt('Введите слово');
    word = word + ' ' + w;
}
alert(word);