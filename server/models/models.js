const sequelize = require('../db')
const {DataTypes} = require('sequelize')


const User = sequelize.define('user',{
user_id: {type: DataTypes.INTEGER, primaryKey:true, autoIncrement: true},
user_name:{type: DataTypes.STRING,unique:true},
password: {type: DataTypes.STRING},
role: {type: DataTypes.STRING,defaultValue:"USER"},

})

const Orders = sequelize.define('orders',{
    id: {type: DataTypes.INTEGER, primaryKey:true, autoIncrement: true},
    order_date:{type: DataTypes.DATE},
    status:{type: DataTypes.STRING, allowNull:false}

   
    })

    const Reviews = sequelize.define('reviws',{
        id: {type: DataTypes.INTEGER, primaryKey:true, autoIncrement: true},

        order_date:{type: DataTypes.DATE},
        status:{type: DataTypes.STRING, allowNull:false}
    
       
        })
        
       User.hasOne(Orders)
       Orders.belongsTo(User)
       User.hasMany(Reviews)
       Reviews.belongsTo(User)

       module.exports = {
        User,Orders,Reviews
       }