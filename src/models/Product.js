const mongoose = require ('mongoose');

const productSchema = new mongoose.Schema({
    title:{
        type:String,
        required:true
    },
    price:{
        type:Number,
        required:true
    },
    category:{
        type:String,
        required:true
    },
    stock:{
        trype:Number,
        default:0
    },
    merchantId:{
        type:mongoose.schema.Types.ObjectId,
        ref:"user",
        required:true
    },
    imageurl:{
        type:String,
        default:''
    }
}, {timestamps:true});

module.exports = mongoose.model("Product",productSchema);