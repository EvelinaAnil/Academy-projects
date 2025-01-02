const { Telegraf } = require('telegraf')
const { message } = require('telegraf/filters')

const bot = new Telegraf('5907884190:AAGvNBL3RpDsdEoS-0LxVpyn2KWtx7uv3Oc')

// bot.start((ctx) => ctx.reply('Welcome'))
// bot.help((ctx) => ctx.reply('Send me a sticker'))
// bot.on(message('sticker'), (ctx) => ctx.reply('👍'))
// bot.hears('hi', (ctx) => ctx.reply('Hey there'))

bot.hears('/start', async (ctx) => {
    // Отправка сообщений клиенту
    await ctx.telegram.sendMessage(ctx.message.chat.id, `Hello ${ctx.message.chat.first_name}`);

    // Ответ на сообщение, отправленное Боту
    ctx.reply(`Ты отправил текст: ${ctx.message.text}`)
});

bot.hears('/start2', async (ctx) => {
    const answer = "Привет, " + ctx.message.chat.first_name + "!\n\n"
        + 'Сыиграем в игру: камень-ножницы-бумага?\n'
        + '/stone - твой камень \n'
        + '/scissors - тво ножницы \n'
        + '/paper - твоя бумага \n'
        + '\n\n'; 
    
    // Ответ на сообщение, отправленное Боту
  ctx.reply(answer)
});

//Обработка команды /stone
bot.hears('/stone', (ctx) => {
    ctx.reply("А у меня бумага  - ты проиграл!!!")
})
//Обработка команды /scissors
bot.hears('/scissors', (ctx) => {
    ctx.reply("А у меня камень  - ты проиграл!!!")
})
//Обработка команды /paper
bot.hears('/paper', (ctx) => {
    ctx.reply("А у меня ножницы  - ты проиграл!!!")
})

const request = require('request');
//Обработка команды /rates
bot.hears('/rates', (ctx) => {
    //ctx.reply("Курсы валют")
    request('https://api.privatbank.ua/p24api/pubinfo?json&exchange&coursid=5', function (error, response, body) {
        const data = JSON.parse(body);
        let answer = "Курсы Валют:\n"
        data.forEach(item => {
            answer += 
            `
            ${item.ccy} => ${item.base_ccy} 
            Покупка: ${item.buy}
            Продажа: ${item.sale}
            ======================
            `
        });  
        ctx.reply(answer)
});
})

bot.launch()

// Enable graceful stop
process.once('SIGINT', () => bot.stop('SIGINT'))
process.once('SIGTERM', () => bot.stop('SIGTERM'))