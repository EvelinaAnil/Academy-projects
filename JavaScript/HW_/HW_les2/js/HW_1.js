var  sum = 0;
confirm("Do you speak English?" ) ? sum++ : sum--;
confirm("Parlez-vous Francais?") ? sum++ : sum--;
confirm("Sprechen Zi Deutch?") ? sum++ : sum--;
confirm("Чи володієте Ви українською мовою?") ? sum++ : sum--;
confirm("Говорите по-русски?") ? sum++ : sum--;
confirm("НаЫа Usted...espanol? ") ? sum++ : sum--;
console.log("Вы знаете "+sum+" языков");
alert("Вы знаете "+sum+" языков");