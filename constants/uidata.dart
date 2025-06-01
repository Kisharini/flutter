List categories = [
  {
    "_id": "6537ece708ff5b7de97d0695",
    "title": "Fried Rice",
    "value": "fried_rice",
    "imageUrl":
        "https://d326fntlu7tble.cloudfront.net/uploads/4a4cd06e-94de-4478-8588-66eee01354d4-rice.png",
    "createdAt": "2023-10-24T16:12:23.571Z",
    "updatedAt": "2023-10-24T16:12:23.571Z",
    "__v": 0,
  },

  {
    "_id": "65310f3381e4d98d60b093c5",
    "title": "Curry",
    "value": "curry",
    "imageUrl":
        "https://d326fntlu7tble.cloudfront.net/uploads/ee2d952c-1d7d-48f7-81b3-cb967343eb6c-curry.png",
    "__v": 0,
  },

  {
    "_id": "6531206cbbe4998e90af3feb",
    "title": "Pizza",
    "value": "pizza",
    "imageUrl":
        "https://d326fntlu7tble.cloudfront.net/uploads/4a4cd06e-94de-4478-8588-66eee01354d4-rice.png",
    "__v": 0,
  },

  {
    "_id": "6537ece708ff5b7de97d0999",
    "title": "Noodles",
    "value": "noodles",
    "imageUrl":
        "https://d326fntlu7tble.cloudfront.net/uploads/noodles-category.png",
    "__v": 0,
  },

  {
    "_id": "6537ece708ff5b7de97d0123",
    "title": "Dessert",
    "value": "dessert",
    "imageUrl":
        "https://d326fntlu7tble.cloudfront.net/uploads/dessert-category.png",
    "__v": 0,
  },
];

const restaurants = [
  {
    "_id": "6530ebbcc9e72013e5b65933",
    "title": "Lapisara Eatery",
    "time": "6:00am - 9:00pm",
    "imageUrl":
        "https://d326fntlu7tble.cloudfront.net/uploads/5c2a9ca8-eb07-400b-b8a6-2acfab2a9ee2-image001.webp",
    "owner": "fdfsdfsdfs",
    "code": "41007428",
    "logoUrl":
        "https://d326fntlu7tble.cloudfront.net/uploads/5c2a9ca8-eb07-400b-b8a6-2acfab2a9ee2-image001.webp",
    "rating": 5,
    "ratingCount": "5666",
    "coords": {
      "id": "2022",
      "latitude": 37.787503258917035,
      "longitude": -122.39854938269353,
      "address": "333 O'Farrell St, San Francisco, CA 94102, United States",
      "title": "Lapisara Eatery",
      "latitudeDelta": 0.0122,
      "longitudeDelta": 0.0221,
    },
  },

  {
    "_id": "6530ebbcc9e72013e5b65931",
    "title": "La Foods",
    "time": "6:00am - 9:00pm",
    "imageUrl":
        "https://d326fntlu7tble.cloudfront.net/uploads/5c2a9ca8-eb07-400b-b8a6-2acfab2a9ee2-image001.webp",
    "owner": "fgdgdfgd",
    "code": "41007428",
    "logoUrl":
        "https://d326fntlu7tble.cloudfront.net/uploads/5c2a9ca8-eb07-400b-b8a6-2acfab2a9ee2-image001.webp",
    "rating": 5,
    "ratingCount": "5666",
    "coords": {
      "id": "2022",
      "latitude": 37.787503258917035,
      "longitude": -122.39854938269353,
      "address": "333 O'Farrell St, San Francisco, CA 94102, United States",
      "title": "Lapisara Eatery",
      "latitudeDelta": 0.0122,
      "longitudeDelta": 0.0221,
    },
  },

  {
    "_id": "6530ebbcc9e72013e5b65933",
    "title": "Italian Restaurant",
    "time": "6:00am - 9:00pm",
    "imageUrl":
        "https://d326fntlu7tble.cloudfront.net/uploads/5c2a9ca8-eb07-400b-b8a6-2acfab2a9ee2-image001.webp",
    "owner": "fmfmmsfsa",
    "code": "41007428",
    "logoUrl":
        "https://d326fntlu7tble.cloudfront.net/uploads/5c2a9ca8-eb07-400b-b8a6-2acfab2a9ee2-image001.webp",
    "rating": 5,
    "ratingCount": "5666",
    "coords": {
      "id": "2022",
      "latitude": 37.787503258917035,
      "longitude": -122.39854938269353,
      "address": "333 O'Farrell St, San Francisco, CA 94102, United States",
      "title": "Lapisara Eatery",
      "latitudeDelta": 0.0122,
      "longitudeDelta": 0.0221,
    },
  },
];

List<Map<String, dynamic>> foods = [{
  "_id": "65316968f94c6496dc84f3c1",
  "title": "Tiramisu",
  "foodTags": ["Italian", "Dessert", "Coffee", "Mascarpone", "Cocoa"],
  "foodType": ["Dessert"],
  "code": "41007428",
  "isAvailable": true,
  "restaurant": "6530ea6bc9e72013e5b6592d",
  "rating": 4.9,
  "ratingCount": "420",
  "description": "A classic Italian dessert made of layers of coffee-soaked ladyfingers and creamy mascarpone",
  "price": 7.99,
  "additives": [
    {"id":1, "title": "Ladyfingers", "price":"1.00"},
    {"id":2, "title": "Whipped Cream", "price":"1.00"}
  ],
  "imageUrl": "https://d326fntlu7tble.cloudfront.net/uploads/5c2a9ca8-eb07-400b-b8a6-2acfab2a9ee2-image001.webp",
  "__v": 0,
  "category": "6531209dbbe4998e90af3fef",
  "time": "10 min"
},
{
 "_id": "fast001",
    "title": "Cheeseburger",
    "foodTags": ["Burger", "Beef", "Cheese", "Fast Food"],
    "foodType": ["Fast food"],
    "code": "42000001",
    "isAvailable": true,
    "restaurant": "6530ebbcc9e72013e5b65933",
    "rating": 4.7,
    "ratingCount": "2150",
    "description": "Grilled beef patty with melted cheese, lettuce, and tomato in a sesame bun.",
    "price": 5.49,
    "additives": [
      {"id": 1, "title": "Extra Cheese", "price": "0.75"},
      {"id": 2, "title": "Bacon", "price": "1.50"},
    ],
    "imageUrl": "https://d326fntlu7tble.cloudfront.net/uploads/cheeseburger.webp",
    "category": "6531206cbbe4998e90af3feb",
    "time": "7 min",
  },

  {
    "_id": "fast002",
    "title": "Crispy Chicken Sandwich",
    "foodTags": ["Chicken", "Sandwich", "Fast Food"],
    "foodType": ["Fried Food"],
    "code": "42000002",
    "isAvailable": true,
    "restaurant": "6530ebbcc9e72013e5b65933",
    "rating": 4.6,
    "ratingCount": "1830",
    "description": "Crunchy fried chicken breast with pickles and spicy mayo on a soft bun.",
    "price": 6.29,
    "additives": [
      {"id": 1, "title": "Extra Pickles", "price": "0.30"},
      {"id": 2, "title": "Cheddar Slice", "price": "0.60"},
    ],
    "imageUrl": "https://d326fntlu7tble.cloudfront.net/uploads/chicken-sandwich.webp",
    "category": "6531206cbbe4998e90af3feb",
    "time": "6 min",
  },
];
