const ApiError = require('../error/ApiError')
class UserController {
    async registration(req,res){

    }

    async login(req,res){

    }

    async check(req,res, next){
       const {user_id} = req.query
       if (!user_id){
           return next(ApiError.badRequest('Не задан ID'))
       }
       res.json(user_id);
    }

}
module.exports = new UserController()