const {Part,PartInfo} = require('../models/models')
const ApiError = require('../error/ApiError')
const uuid =require('uuid')
const path = require('path');
const { where, json } = require('sequelize');
const { info } = require('console');
const { title } = require('process');

class PartsController {
    async create(req,res,next){
        try {
            const {name,price, availability,brandId,categoryId} = req.body
            const {img} = req.files
            let fileName = uuid.v4() + ".jpg"
           img.mv(path.resolve(__dirname, '..', 'static', fileName))
           
           const parts = await Part.create({name,price, availability,brandId,categoryId,img:fileName})

           if (info) {
            info = JSON.parse(info)
            info.array.forEach(i =>
                PartInfoinfo.create({
                    title: i.title,
                    description: i.description,
                    partId:Part.part_id
                })
            );
           }
           return res.json(parts)
        } catch (e){
            next(ApiError.badRequest(e.message))
        }

      
    }

    async getAll(req,res){
        let {brandId,categoryId,limit,page} = req.query
        page = page || 1
        limit = limit || 9
        let offset = page * limit - limit
        let parts;
        if (!brandId && !categoryId){
            parts = await Part.findAndCountAll({limit,offset})
        }
        if (brandId && !categoryId){
            parts = await Part.findAndCountAll({where: {brandId}},limit, offset)
        }
        if (!brandId && categoryId){
            parts = await Part.findAndCountAll({where: {categoryId}},limit, offset) 
        }
        if (brandId && categoryId){
            parts = await Part.findAndCountAll({where: {categoryId, brandId}},limit, offset) 
        }
        return res.json(parts)
       

    }

    async getOne(req,res){
        const {id} = req.params
        const part = await Part.findOne(
            {
                where:{part_id:id},
                include: [{model:PartInfo, as: 'info'}]
                
            },
        )
        return res.json(part)
    }
   

}
module.exports = new PartsController()