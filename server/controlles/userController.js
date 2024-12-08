const ApiError = require('../error/ApiError');
const bcrypt = require('bcrypt');
const { User, ShoppingCart } = require('../models/models');
const jwt = require('jsonwebtoken');

const generateJwt = (user_id, email, role) => {
    return jwt.sign({ user_id, email, role }, 
        process.env.SECRET_KEY,
        { expiresIn: '24h' }
    );
};

class UserController {
    async registration(req, res, next) {
        const { email, password, role } = req.body;
        if (!email || !password) {
            return next(ApiError.badRequest('Некорректный email или password'));
        }

        const candidate = await User.findOne({ where: { email } });
        if (candidate) {
            return next(ApiError.badRequest('Пользователь с таким email уже существует'));
        }

        const hashPassword = await bcrypt.hash(password, 5);
        const user = await User.create({ email, role, password: hashPassword });
        await ShoppingCart.create({ userId: user.id }); 
        
        const token = generateJwt(user.id, email, role);
        return res.json({ token });
    }

    async login(req, res) {
       
    }

    async check(req, res, next) {
        const { user_id } = req.query;
        if (!user_id) {
            return next(ApiError.badRequest('Не задан ID'));
        }
        res.json(user_id);
    }
}

module.exports = new UserController();