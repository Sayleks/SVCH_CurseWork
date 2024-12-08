const Router = require('express')
const router = new Router
const partsRouter = require('./partsRouter')
const categoryRouter = require('./categoryRouter')
const brandRouter = require('./brandRouter')
const userRouter = require('./userRouter')


router.use('/user', userRouter)
router.use('/category', categoryRouter)
router.use('/brand', brandRouter)
router.use('/parts',partsRouter)



module.exports = router