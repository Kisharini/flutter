
class Additive {
  final int id;
  final String title;
  final double price;

  Additive({
    required this.id,
    required this.title,
    required this.price,
  });

  factory Additive.fromJson(Map<String, dynamic> json) {
    return Additive(
      id: json['id'],
      title: json['title'],
      price: (json['price'] is double) ? json['price'] : double.tryParse(json['price'].toString()) ?? 0.0,

    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'price': price,
    };
  }
}

final List<Additive> sampleAdditives = [
  Additive(id: 1, title: "Cheese Topping", price: 2.50),
  Additive(id: 2, title: "Extra Sauce", price: 1.20),
  Additive(id: 3, title: "Spicy Mix", price: 1.00),
];