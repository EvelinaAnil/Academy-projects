const User = require('../models/User');
const keys = require('../config/keys');

module.exports.login = (req, res) => {
    res.status(200).json({
        command: 'login'
    });
}

module.exports.register = (req, res) => {
    res.status(200).json({
        //command: 'register'
        login: {
            email: req.body.email,
            password: req.body.password
        }
    });
}