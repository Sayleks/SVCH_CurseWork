const sequelize = require('../db')
const {DataTypes} = require('sequelize')


const User = sequelize.define('user',{
user_id: {type: DataTypes.INTEGER, primaryKey:true, autoIncrement: true},
user_name:{type: DataTypes.STRING,unique:true},
password: {type: DataTypes.STRING},
role: {type: DataTypes.STRING,defaultValue:"USER"},

})

const ShoppingCart = sequelize.define('shoppingCart', {
    id: { type: DataTypes.INTEGER, primaryKey: true, autoIncrement: true },
    created_at: { type: DataTypes.DATE, defaultValue: DataTypes.NOW },
});

const CartItem = sequelize.define('cartItem', {
    id: { type: DataTypes.INTEGER, primaryKey: true, autoIncrement: true },
    quantity: { type: DataTypes.INTEGER, allowNull: false },
});


const Review = sequelize.define('review', {
    id: { type: DataTypes.INTEGER, primaryKey: true, autoIncrement: true },
    rating: { type: DataTypes.INTEGER, allowNull: false },
    comment: { type: DataTypes.TEXT },
});
       
      

        const Favorite = sequelize.define('favorite',{
            favorite_id: {type: DataTypes.INTEGER, primaryKey:true, autoIncrement: true},
           
            })


            const Part = sequelize.define('part', {
                part_id: { type: DataTypes.INTEGER, primaryKey: true, autoIncrement: true },
                name: { type: DataTypes.STRING, allowNull: false },
                price: { type: DataTypes.DECIMAL, allowNull: false },
                availability: { type: DataTypes.BOOLEAN, defaultValue: true },
                rating: { type: DataTypes.FLOAT, allowNull: true },
            
            });
            const PartInfo = sequelize.define('part_info', {
                id: { type: DataTypes.INTEGER, primaryKey: true, autoIncrement: true },
                title: { type: DataTypes.STRING, allowNull: false },
                description: { type: DataTypes.STRING, allowNull: false }
            
            });


            const Category = sequelize.define('category', {
                id: { type: DataTypes.INTEGER, primaryKey: true, autoIncrement: true },
                name: { type: DataTypes.STRING, allowNull: false },
            });


            const Brand = sequelize.define('brand', {
    id: { type: DataTypes.INTEGER, primaryKey: true, autoIncrement: true },
    name: { type: DataTypes.STRING, allowNull: false },
});
const Compatibility = sequelize.define('compatibility', {
    compatibility_id: { type: DataTypes.INTEGER, primaryKey: true, autoIncrement: true },
    part_id: { type: DataTypes.INTEGER, references: { model: Part, key: 'part_id' }},
    car_model: { type: DataTypes.STRING, allowNull: false },
});

        
User.hasOne(ShoppingCart);
ShoppingCart.belongsTo(User);

User.hasMany(Review);
Review.belongsTo(User);

User.hasMany(Favorite);
Favorite.belongsTo(User);

ShoppingCart.hasMany(CartItem);
CartItem.belongsTo(ShoppingCart);

CartItem.belongsTo(Part);
Part.hasMany(CartItem);

Part.hasMany(Review);
Review.belongsTo(Part);

Part.hasMany(PartInfo,{as: 'info'})
PartInfo.belongsTo(Part)

Part.hasMany(Compatibility);
Compatibility.belongsTo(Part);

Category.hasMany(Part);
Part.belongsTo(Category);

Brand.hasMany(Part);
Part.belongsTo(Brand);

       module.exports = {
        User,
    ShoppingCart,
    CartItem,
    Review,
    Favorite,
    Part,
    Compatibility,
    Category,
    Brand,
    PartInfo,
       }