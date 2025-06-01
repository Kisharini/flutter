const Order = require('../models/Order');

module.exports = {
    placeOrder: async (req,res) => {

    },

    getUserOrders: async (req, res) => {
        const id = req.params.id;
        let status;

        if (req.query.status === 'Placed'){
            status = 'Placed';
        } else if (req.query.status === 'Preparing'){
            status = 'Preparing';
        }else if (req.query.status === 'Ready'){
            status = 'Ready';
        }else if (req.query.status === 'Out_for_delivery'){
            status = 'Out_for_delivery';
        }else if (req.query.status === 'Delivered'){
            status = 'Delivered';
        }else if (req.query.status === 'Manual'){
            status = 'Manual';
        }else if (req.query.status === 'Cancelled'){
            status = 'Cancelled';
        }

        try{
            const orders = await Order.find({orderStatus: status, paymentStatus: 'Completed', reataurantId: id}).select('userId deliveryAddress orderItems deliveryFee restaurantId restaurantCoords recipientCoords orderStatus')
            .populate({
                path: 'userId',
                select: 'phone profile'
            }).populate({
                path: "restaurantId",
                select: "title coords imageUrl logoUrl time"
            }).populate({
                path: 'orderItems.foodId',
                select: "title imageUrl time"
            }).populate({
                path: 'deliveryAddress',
                select: "addressLine1"
            })

            res.status(200).json(orders);
        } catch (error){

        }
    },

    getRestaurantOrder: async (req, res) => {
        const id = req.params.id;
        let status;

        if (req.query.status === 'Placed'){
            status = 'Placed';
        } else if (req.query.status === 'Preparing'){
            status = 'Preparing';
        }else if (req.query.status === 'Ready'){
            status = 'Ready';
        }else if (req.query.status === 'Out_for_delivery'){
            status = 'Out_for_delivery';
        }else if (req.query.status === 'Delivered'){
            status = 'Delivered';
        }else if (req.query.status === 'Manual'){
            status = 'Manual';
        }else if (req.query.status === 'Cancelled'){
            status = 'Cancelled';
        }

        try{
            const orders = await Order.find({orderStatus: status, paymentStatus: 'Completed', reataurantId: id}).select('userId deliveryAddress orderItems deliveryFee restaurantId restaurantCoords recipientCoords orderStatus')
            .populate({
                path: 'userId',
                select: 'phone profile'
            }).populate({
                path: "restaurantId",
                select: "title coords imageUrl logoUrl time"
            }).populate({
                path: 'orderItems.foodId',
                select: "title imageUrl time"
            }).populate({
                path: 'deliveryAddress',
                select: "addressLine1"
            })

            res.status(200).json(orders);
        } catch (error){

        }
    },

    updateOrderStatus: async (req, res) => {
        const orderId = req.params.id;
        const orderStatus = req.query.status;
        try {
          const updateOrder = await Order.findByIdAndUpdate(orderId, {orderStatus: orderStatus}, {new: true});

          if(updateOrder){
            req.status(200).json({status: true, message: "Order updated successfully"});
          } else {
             req.status(404).json({status: false, message: "Order not found"});
          }
        } catch (e){
             req.status(404).json({status: false, message: error.message});
        }
    },

    getOrderDetails: async (req, res) => {
        const orderId = req.params.id;
        try{
            const orders = await Order.findById({orderId}).select('userId deliveryAddress orderItems deliveryFee restaurantId restaurantCoords recipientCoords orderStatus')
            .populate({
                path: 'userId',
                select: 'phone profile'
            }).populate({
                path: "restaurantId",
                select: "title coords imageUrl logoUrl time"
            }).populate({
                path: 'orderItems.foodId',
                select: "title imageUrl time"
            }).populate({
                path: 'deliveryAddress',
                select: "addressLine1"
            })

            res.status(200).json(order);
        } catch (error){

        } 
    },

    getRestaurantOrder: async (req, res) => {
       const id = req.params.id;
       const status = req.params.status;

        try{
            const orders =  await Order.find({orderStatus: req.query.status, paymentStatus: 'Completed', restaurantId: id})
            .select('userId deliveryAddress orderItems deliveryFee restaurantId restaurantCoords recipientCoords orderStatus')
            .populate({
               path: 'userId',
               select: 'phone profile'
            }).populate({
                path: "restaurantId",
                select: "title coords imageUrl logoUrl time"
            }).populate({
                path: 'orderItems.foodId',
                select: "title imageUrl time"
            }).populate({
                path: 'deliveryAddress',
                select: "addressLine1"
            })

            res.status(200).json(orders);
        } catch (e){

        }
    },

    updateOrderStatus : async (req, res) => {
        const orderId = req.params.id;
        const orderStatus = req.query.status;
        try {

           const updateOrder = await Order.findByIdAndUpdate(orderId, {orderStatus: orderStatus}, {new: true});

           if(updateOrder){
            res.status(200).json({status: true, message: "Order updated successfully"})
           } else {
            res.status(404).json({status: false, message: "Order not found"})
           }
        }catch (e){
           res.status(404).json({status: false, message: error.message})
        }
    },

}