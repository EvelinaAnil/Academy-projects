const express = require('express');
const bodyParser = require('body-parser');
const cors = require('cors');
const morgan = require('morgan');
const mongoose = require('mongoose');
const passport = require('passport')

const authRouter = require('./routes/auths');
const categoryRouter = require('./routes/category')
const keys = require('./config/keys')


const app = express();

app.use(passport.initialize())
require('./middleware/passport')(passport)

mongoose.connect(keys.mongoUrl)
            .then( () => {
                console.log('MongoDB connected')
            })
            .catch( err => console.log(err))

// app.get('/', (req, res) => {
//     // res.end('Hello!!!!')
//     res.status(200).json({message: 'Working'})
// });
app.use(morgan('dev'));
app.use(cors());

app.use(bodyParser.urlencoded({extended: true}))
app.use(bodyParser.json())

app.use('/api/auth/', authRouter);
app.use('/api/category/', categoryRouter)


app.listen(5000, () => console.log('Server started on 5000'));

