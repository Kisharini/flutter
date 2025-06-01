import 'dart:convert';

List<Categories> categoryModelFromJson(String str) =>
    List<Categories>.from(json.decode(str).map((x) => Categories.fromJson(x)));

String categoryModelToJson(List<Categories> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Categories {
  final String id;
  final String title;
  final String value;
  final String imageUrl;

  Categories({
    required this.id,
    required this.title,
    required this.value,
    required this.imageUrl,
  });

  factory Categories.fromJson(Map<String, dynamic> json) => Categories(
    id: json["_id"],
    title: json["_title"],
    value: json["_value"],
    imageUrl: json["_imageUrl"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "title": title,
    "value": value,
    "imageUrl": imageUrl,
  };
}
