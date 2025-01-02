const express = require('express');
const controller = require('../controllers/auth')

const router = express.Router();

router.post('/register', controller.register);
router.post('/login', controller.login);

// router.post('/register', (req, res) => {
//     res.status(200).json({
//         command: 'register'
//     });
// })


// router.post('/login', (req, res) => {
//     res.status(200).json({
//         command: 'login'
//     });
// })


module.exports = router