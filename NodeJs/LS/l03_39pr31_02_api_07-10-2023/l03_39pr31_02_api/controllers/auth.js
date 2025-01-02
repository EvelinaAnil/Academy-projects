const bcrypt = require('bcryptjs');
const jwt = require('jsonwebtoken');
const User = require('../models/User');
const keys = require('../config/keys');
const errorHandler = require('../utils/errorHandler');

module.exports.login = async (req, res) => {
    // res.status(200).json({
    //     command: 'login'
    // });
    const userdb = await User.findOne({email: req.body.email});
    if (userdb) {
        // res.status(200).json({
        //     status: 'ok'
        // })
        const isRulePassw = bcrypt.compareSync(req.body.password, userdb.password);
        if (isRulePassw){
            // errorHandler(res, 200, 'Ok');
            const token = jwt.sign({
                email: userdb.email,
                userId: userdb._id
            }, 'key', {expiresIn: 60*60});

            res.status(200).json({
                token: `Bearer ${token}`
            })
        }
        else {
            errorHandler(res, 401, "No correct data");
        }
    }
    else{
        errorHandler(res, 401, "No correct data");
        // res.status(401).json({
        //     message: "No correct passw"
        // })
    }
}

module.exports.register = async (req, res) => {
    // res.status(200).json({
    //     //command: 'register'
    //     login: {
    //         email: req.body.email,
    //         password: req.body.password
    //     }
    // });
    const userdb = await User.findOne({email: req.body.email})

    if (userdb)
    {
        errorHandler(res, 409, 'Такой e-mail уже существует!!!');
        // res.status(409).json({
        //     message: 'Такой e-mail уже существует!!!'
        // })
    }
    else {
        const passw = bcrypt.hashSync(req.body.password);
        const user = new User({
            email: req.body.email,
            password: passw
        });
        try {
            await user.save();
            res.status(201).json(user);
        }
        catch(e) {
            errorHandler(res, 500, e.message);
            // res.status(500).json({
            //     message: e.message ? e.message : 'error....'
            // })
        }
    }
}