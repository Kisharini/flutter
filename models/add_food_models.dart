import 'dart:convert';

import 'package:restaurant_app/models/additives_model.dart';

AddFoods addFoodsFromJson(String str) => AddFoods.fromJson(json.decode(str));
String addFoodsToJson(AddFoods data) => json.encode(data.toJson());

class AddFoods {
  final String title;
  final List<String> foodTags;
  final List<String> foodType;
  final String code;
  final String category;
  final String time;
  final bool isAvailable;
  final String restaurant;
  final String description;
  final double price;
  final List<Additive> additives;
  final List<String> imageUrl;

  AddFoods({
    required this.title,
    required this.foodTags,
    required this.foodType,
    required this.code,
    required this.category,
    required this.time,
    required this.isAvailable,
    required this.restaurant,
    required this.description,
    required this.price,
    required this.additives,
    required this.imageUrl,
  });

 factory AddFoods.fromJson(Map<String, dynamic> json) => AddFoods(
      title: json["title"] ?? "Untitled",
      foodTags: List<String>.from(json["foodTags"] ?? []),
      foodType: List<String>.from(json["foodType"] ?? []),
      code: json["code"] ?? "",
      isAvailable: json["isAvailable"] ?? true,
      restaurant: json["restaurant"] ?? "Unknown",
      description: json["description"] ?? "No description available.",
      price: (json["price"] ?? 0).toDouble(),
      additives: (json["additives"] != null)
          ? List<Additive>.from(json["additives"].map((x) => Additive.fromJson(x)))
          : [],
      imageUrl: List<String>.from(json["imageUrl"] ?? []),
      category: json["category"] ?? "Uncategorized",
      time: json["time"] ?? "Unknown",
);

  Map<String, dynamic> toJson() => {
        "title": title,
        "foodTags": foodTags,
        "foodType": foodType,
        "code": code,
        "category": category,
        "time": time,
        "isAvailable": isAvailable,
        "restaurant": restaurant,
        "description": description,
        "price": price,
        "additives": List<dynamic>.from(additives.map((x) => x.toJson())),
        "imageUrl": imageUrl,
      };
}
