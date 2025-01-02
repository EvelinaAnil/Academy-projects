const Category = require('../models/Category');

const errorHandler = require('../utils/errorHandler')
/*
getAll
getById
remove
create
update
*/
module.exports.getAll = async function(req, res){
    /// res.json({mesage: 'Categories: get all'})
    try{
        const categogies = await Category.find({
            user: req.user.id
        })
        res.status(200).json(categogies)
    }catch(e){ errorHandler(res, 200, e)}
}

module.exports.getById = async function(req, res){
    // res.json({mesage: 'Categories: get by id'})
    try{
        const category = await Category.findById(req.params.id)
        res.status(200).json(category)

    }catch(e){ errorHandler(res, 200, e)}
}

module.exports.remove = async function(req, res){
    //res.json({mesage: 'Categories: delete'})
    try{
        await Category.remove({
            _id: req.params.id
        })
        res.status(200).json({
            message: "Категория удалена"
        })
    }catch(e){errorHandler(res, 200, e)}
}

module.exports.create = async function(req, res){
    //res.json({mesage: 'Categories: create'})
    ///console.log(req.file)
    try
    {
    const category = await new Category({
        name: req.body.name,
        user: req.user.id,
        imageSrc: req.body.img
    })

    category.save()
    res.status(201).json(category)
    }
    catch(e)
    {
        /*
        res.status(500).json({
            message: e.message ? e.message : 'error....'
        })
        */
        errorHandler(res, 500, e)
    }
}

module.exports.update = async function(req, res){
    //res.json({mesage: 'Categories: update'})

    try{
        const updated = {
            name: req.body.name
        }

        const category = await Category.findOneAndUpdate(
            {
                _id: req.params.id
            },
            {
                $set: updated
            },
            {
                new: true
            }
        )

        res.status(200).json(category)

    }catch(e){
        errorHandler(res, 500, e);
    }
}