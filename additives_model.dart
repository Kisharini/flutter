class Additive {
  final int id;
  final String title;
  final String price;

  Additive({
    required this.id,
    required this.title,
    required this.price,
  });

  // Optional JSON serialization
  factory Additive.fromJson(Map<String, dynamic> json) {
    return Additive(
      id: json['id'],
      title: json['title'],
      price: json['price'],
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

// Sample list of additives
final List<Additive> sampleAdditives = [
  Additive(id: 1, title: "Cheese Topping", price: "2.50"),
  Additive(id: 2, title: "Extra Sauce", price: "1.20"),
  Additive(id: 3, title: "Spicy Mix", price: "1.00"),
];
