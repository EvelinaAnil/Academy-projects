const express = require('express');
const mongoose = require('mongoose');
const bodyParser = require('body-parser');
const app = express();
const port =  process.env.PORT ||3000;
// 
// Подключение к базе данных MongoDB
mongoose.connect('mongodb://localhost/your-database-name', { useNewUrlParser: true, useUnifiedTopology: true });

// Middleware
app.use(bodyParser.json());

// Маршруты
const studentsRouter = require('./routes/students');
const groupsRouter = require('./routes/groups');

app.use('/api/students', studentsRouter);
app.use('/api/groups', groupsRouter);

// Запуск сервера
app.listen(port, () => {
  console.log(`Сервер запущен на порту ${port}`);
});
