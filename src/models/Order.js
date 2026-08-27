const mongoose = require('mongoose');

const orderSchema = new mongoose.Schema({
    customerId:{
        type:String,
        required:true
    },
    items:[{
        productId: String,
        quantity: Number,
        price: Number
    }],
    totalAmount:{
        type:Number,
        required:true
    },
    status:{
        type:String,
        enum: ['PENDING' , 'ACCEPTED' , 'DELIVERED'],
        default:'PENDING'
    }
},{ timestamps : true });

module.exports = mongoose.model('Order', orderSchema);