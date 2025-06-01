import 'dart:convert';
import 'additives_model.dart';

List<FoodsModel> foodsModelFromJson(String str) =>
    List<FoodsModel>.from(json.decode(str).map((x) => FoodsModel.fromJson(x)));

String foodsModelToJson(List<FoodsModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class FoodsModel {
  final String id;
  final String title;
  final List<String> foodTags;
  final List<String> foodType;
  final String code;
  final bool isAvailable;
  final String restaurant;
  final double rating;
  final String ratingCount;
  final String description;
  final double price;
  final List<Additive> additives;
  final List<String> imageUrl;
  final String category;
  final String time;

  FoodsModel({
    required this.id,
    required this.title,
    required this.foodTags,
    required this.foodType,
    required this.code,
    required this.isAvailable,
    required this.restaurant,
    required this.rating,
    required this.ratingCount,
    required this.description,
    required this.price,
    required this.additives,
    required this.imageUrl,
    required this.category,
    required this.time,
  });

factory FoodsModel.fromJson(Map<String, dynamic> json) => FoodsModel(
      id: json["id"] ?? "",
      title: json["title"] ?? "Untitled",
      foodTags: List<String>.from(json["foodTags"] ?? []),
      foodType: List<String>.from(json["foodType"] ?? []),
      code: json["code"] ?? "",
      isAvailable: json["isAvailable"] ?? true, // Defaulting to true
      restaurant: json["restaurant"] ?? "Unknown",
      rating: (json["rating"] ?? 0).toDouble(),
      ratingCount: json["ratingCount"] ?? "0",
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
        "id": id,
        "title": title,
        "foodTags": foodTags,
        "foodType": foodType,
        "code": code,
        "isAvailable": isAvailable,
        "restaurant": restaurant,
        "rating": rating,
        "ratingCount": ratingCount,
        "description": description,
        "price": price,
        "additives": additives.map((x) => x.toJson()).toList(),
        "imageUrl": imageUrl,
        "category": category,
        "time": time,
      };

FoodsModel copyWith({
  String? id,
  String? title,
  List<String>? foodTags,
  List<String>? foodType,
  String? code,
  bool? isAvailable,
  String? restaurant,
  double? rating,
  String? ratingCount,
  String? description,
  double? price,
  List<Additive>? additives,
  List<String>? imageUrl,
  String? category,
  String? time,
}) {
  return FoodsModel(
    id: id ?? this.id,
    title: title ?? this.title,
    foodTags: foodTags ?? this.foodTags,
    foodType: foodType ?? this.foodType,
    code: code ?? this.code,
    isAvailable: isAvailable ?? this.isAvailable,
    restaurant: restaurant ?? this.restaurant,
    rating: rating ?? this.rating,
    ratingCount: ratingCount ?? this.ratingCount,
    description: description ?? this.description,
    price: price ?? this.price,
    additives: additives ?? this.additives,
    imageUrl: imageUrl ?? this.imageUrl,
    category: category ?? this.category,
    time: time ?? this.time,
  );
}
}
