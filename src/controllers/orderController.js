const order = require('../models/Order');

exports.updateOrderStatus = async (req,res) => {
    try{
        const { orderId } = req.params;
        const { status } = req.body;

        const updatedOrder = await Order.findByIdAndUpdate(
            orderId,
            { status },
            { new: true}
        );

        if (!updatedOrder){
            return res.status(404).json({ success: false, message: "Order not found"});
        }

        return res.status(200).json({ success: true, data: updatedOrder});
    }
    catch(error){
        return res.status(500).json({ success: false, error: error.message});
    }
};