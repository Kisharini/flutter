const Food = require('../models/Food');

module.exports = {
    addFood: async (req, res) => {

    },

    getFoodById: async (req, res) => {

    },

    getRandomFood: async (req, res) => {

    },

    getAllFoodsByCode: async (req, res) => {

    },

    getFoodsByRestaurant: async (req, res) => {
       const id = req.params.id;
       try {
        const foods = await Food.find({restaurant: id});
        res.status(200).json(foods);
       } catch (error){
        res.status(500).json({ status: false, message: error.message});
       }
    },

    getFoodsByCategoryAndCode: async (req, res) => {
        
    }
}