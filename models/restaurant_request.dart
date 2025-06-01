import 'dart:convert';

RestaurantRequest restaurantRequestFromJson(String str) =>
    RestaurantRequest.fromJson(json.decode(str));

String restaurantRequestToJson(RestaurantRequest data) =>
    json.encode(data.toJson());

class RestaurantRequest {
  final String title;
  final String time;
  final String owner;
  final String code;
  final String logoUrl;
  final String imageUrl;
  final Coords coords;

  RestaurantRequest({
    required this.title,
    required this.time,
    required this.owner,
    required this.code,
    required this.logoUrl,
    required this.imageUrl,
    required this.coords,
  });

  factory RestaurantRequest.fromJson(Map<String, dynamic> json) =>
      RestaurantRequest(
        title: json["title"],
        time: json["time"],
        owner: json["owner"],
        code: json["code"],
        logoUrl: json["logoUrl"],
        imageUrl: json["imageUrl"],
        coords: Coords.fromJson(json["coords"]),
      );

  Map<String, dynamic> toJson() => {
    "title": title,
    "time": time,
    "owner": owner,
    "code": code,
    "logoUrl": logoUrl,
    "imageUrl": imageUrl,
    "coords": coords.toJson(),
  };
}

class Coords {
  final double lat;
  final double lng;
  final int id;
  final String address;
  final String title;

  Coords({required this.lat, required this.lng, required this.id, required this.address, required this.title});

  factory Coords.fromJson(Map<String, dynamic> json) => Coords(
    lat: json["lat"]?.toDouble() ?? 0.0,
    lng: json["lng"]?.toDouble() ?? 0.0,
    id: json["id"],
    address: json["address"],
    title: json["title"]
  );

  Map<String, dynamic> toJson() => {"lat": lat, "lng": lng, "id": id, "address": address, "title":title};
}
