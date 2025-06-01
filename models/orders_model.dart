import 'dart:convert';
import 'package:restaurant_app/models/restaurant_request.dart';

List<OrderModels> ordersModelFromJson(String str) => List<OrderModels>.from(
  json.decode(str).map((x) => OrderModels.fromJson(x)),
);

String ordersModelToJson(List<OrderModels> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class OrderModels {
  final String id;
  final UserId userId;
  final List<OrderItem> orderItems;
  final double deliveryFee;
  final DeliveryAddress deliveryAddress;
  final String orderStatus;
  final RestaurantId restaurantId;
  final List<double> restaurantCoords;
  final List<double> recipientCoords;

  OrderModels({
    required this.id,
    required this.userId,
    required this.orderItems,
    required this.deliveryFee,
    required this.deliveryAddress,
    required this.orderStatus,
    required this.restaurantId,
    required this.restaurantCoords,
    required this.recipientCoords,
  });

  factory OrderModels.fromJson(Map<String, dynamic> json) => OrderModels(
    id: json["_id"],
    userId: UserId.fromJson(json["userId"]),
    orderItems: List<OrderItem>.from(
      json["orderItems"].map((x) => OrderItem.fromJson(x)),
    ),
    deliveryFee: json["deliveryFee"].toDouble(),
    deliveryAddress: DeliveryAddress.fromJson(json["deliveryAddress"]),
    orderStatus: json["orderStatus"],
    restaurantId: RestaurantId.fromJson(json["restaurantId"]),
    restaurantCoords: List<double>.from(
      json["restaurantCoords"].map((x) => x.toDouble()),
    ),
    recipientCoords: List<double>.from(
      json["recipientCoords"].map((x) => x.toDouble()),
    ),
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "userId": userId.toJson(),
    "orderItems": List<dynamic>.from(orderItems.map((x) => x.toJson())),
    "deliveryFee": deliveryFee,
    "deliveryAddress": deliveryAddress.toJson(),
    "orderStatus": orderStatus,
    "restaurantId": restaurantId.toJson(),
    "restaurantCoords": restaurantCoords,
    "recipientCoords": recipientCoords,
  };
}

class DeliveryAddress {
  final String id;
  final String addressLine1;

  DeliveryAddress({required this.id, required this.addressLine1});

  factory DeliveryAddress.fromJson(Map<String, dynamic> json) =>
      DeliveryAddress(id: json["_id"], addressLine1: json["addressLine1"]);

  Map<String, dynamic> toJson() => {"_id": id, "addressLine1": addressLine1};
}

class OrderItem {
  final FoodItemModel foodId;
  final int quantity;
  final double price;
  final List<String> additives;
  final String instructions;
  final String id;
  final String imageUrl;

  OrderItem({
    required this.foodId,
    required this.quantity,
    required this.price,
    required this.additives,
    required this.instructions,
    required this.id,
    required this.imageUrl,
  });

  factory OrderItem.fromJson(Map<String, dynamic> json) => OrderItem(
    foodId: FoodItemModel.fromJson(json["foodId"]),
    quantity: json["quantity"],
    price: json["price"].toDouble(),
    additives: List<String>.from(json["additives"]),
    instructions: json["instructions"],
    id: json["_id"],
    imageUrl: json["imageUrl"],
  );

  Map<String, dynamic> toJson() => {
    "foodId": foodId.toJson(),
    "quantity": quantity,
    "price": price,
    "additives": additives,
    "instructions": instructions,
    "_id": id,
    "imageUrl": imageUrl,
  };
}

class RestaurantId {
  final Coords coords;
  final String id;
  final String title;
  final String time;
  final String imageUrl;
  final String logoUrl;

  RestaurantId({
    required this.coords,
    required this.id,
    required this.title,
    required this.time,
    required this.imageUrl,
    required this.logoUrl,
  });

  factory RestaurantId.fromJson(Map<String, dynamic> json) => RestaurantId(
    coords: Coords.fromJson(json["coords"]),
    id: json["_id"],
    title: json["title"],
    time: json["time"],
    imageUrl: json["imageUrl"],
    logoUrl: json["logoUrl"],
  );

  Map<String, dynamic> toJson() => {
    "coords": coords.toJson(),
    "_id": id,
    "title": title,
    "time": time,
    "imageUrl": imageUrl,
    "logoUrl": logoUrl,
  };
}

class UserId {
  final String id;
  final String phone;
  final String profile;

  UserId({required this.id, required this.phone, required this.profile});

  factory UserId.fromJson(Map<String, dynamic> json) =>
      UserId(id: json["_id"], phone: json["phone"], profile: json["profile"]);

  Map<String, dynamic> toJson() => {
    "_id": id,
    "phone": phone,
    "profile": profile,
  };
}

class FoodItemModel {
  final String id;
  final String title;
  final String description;

  FoodItemModel({
    required this.id,
    required this.title,
    required this.description,
  });

  factory FoodItemModel.fromJson(Map<String, dynamic> json) => FoodItemModel(
    id: json["_id"],
    title: json["title"],
    description: json["description"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "title": title,
    "description": description,
  };
}
