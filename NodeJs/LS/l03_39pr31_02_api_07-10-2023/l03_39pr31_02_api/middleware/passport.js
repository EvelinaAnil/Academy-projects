const JwtStrategy = require('passport-jwt').Strategy
const ExtractJwt = require('passport-jwt').ExtractJwt

const mongoose = require('mongoose')
const User = mongoose.model('users')

//const keys = require('../config/key')
const key = 'key';//require('../config/keys')

const options = {
    jwtFromRequest: ExtractJwt.fromAuthHeaderAsBearerToken(),
    secretOrKey: 'key'//key.jwt
} 

module.exports = passport => {
    passport.use(
        new JwtStrategy(options, async (payLoad, done) => {
            try{
                const user = await (await User.findById(payLoad.userId)).isSelected('email id')

                if (user){
                    done(null, user)
                } else {
                    done(null, false)
                }
            }
            catch(e){
                console.log(e)
            }
        })
    )
}