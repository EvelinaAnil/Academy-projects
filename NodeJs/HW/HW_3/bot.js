const { Telegraf } = require('telegraf');
const bot = new Telegraf('YOUR_BOT_TOKEN'); //YOUR_BOT_TOKEN!!


bot.start((ctx) => {
    ctx.reply('Привет! Это бот для напоминаний и заметок. Отправьте /help, чтобы узнать, как использовать.');
});


bot.help((ctx) => {
    ctx.reply('Чтобы добавить напоминание, отправьте боту сообщение в формате: /remember <текст напоминания>\n'+
    'Чтобы решить уравнение, отправьте боту сообщение в формате: /calc <текст уравнения>\n');
});

bot.command('remember', (ctx) => {
    const reminderText = ctx.message.text.slice(8); 
    ctx.reply(`Я запомнил ваше напоминание: "${reminderText}"`);
});
bot.command('calc', (ctx) => { 
    try {
        const expression = ctx.message.text;
        const result = calculate(expression);
        ctx.reply(`Результат: ${result}`);
    } catch (error) {
        ctx.reply('Ошибка в выражении. Попробуйте еще раз.');
    }
});

bot.launch(); //node bot.js
