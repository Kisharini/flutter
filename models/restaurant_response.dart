class RestaurantResponse {
  final String code;
  final bool isAvailable;
  final bool pickup;
  final bool delivery;
  final List<dynamic> foods;
  final String logoUrl;
  final int rating;
  final int ratingCount;
  final bool verification;
  final String verificationMessage;
  final Coords coords;
  final double? earnings;

  RestaurantResponse({
    required this.code,
    required this.isAvailable,
    required this.pickup,
    required this.delivery,
    required this.foods,
    required this.logoUrl,
    required this.rating,
    required this.ratingCount,
    required this.verification,
    required this.verificationMessage,
    required this.coords,
    required this.earnings,
  });

  factory RestaurantResponse.fromJson(Map<String, dynamic> json) {
    return RestaurantResponse(
      code: json["code"],
      isAvailable: json["isAvailable"],
      pickup: json["pickup"],
      delivery: json["delivery"],
      foods: List<dynamic>.from(json["foods"].map((x) => x)),
      logoUrl: json["logoUrl"],
      rating: json["rating"],
      ratingCount: json["ratingCount"],
      verification: json["verification"],
      verificationMessage: json["verificationMessage"],
      coords: Coords.fromJson(json["coords"]),
      earnings: json["earnings"]?.toDouble(),
    );
  }

  Map<String, dynamic> toJson() => {
        "code": code,
        "isAvailable": isAvailable,
        "pickup": pickup,
        "delivery": delivery,
        "foods": foods,
        "logoUrl": logoUrl,
        "rating": rating,
        "ratingCount": ratingCount,
        "verification": verification,
        "verificationMessage": verificationMessage,
        "coords": coords.toJson(),
        "earnings": earnings,
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
