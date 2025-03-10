class Product {
  final int id;
  final String title;
  final String image;
  final double price;
  final String description;
  final String brand;
  final String model;
  final String color;
  final String category;
  final int discount;

  Product({
    required this.id,
    required this.title,
    required this.image,
    required this.price,
    required this.description,
    required this.brand,
    required this.model,
    required this.color,
    required this.category,
    required this.discount,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'],
      title: json['title'],
      image: json['image'],
      price: (json['price'] as num).toDouble(),
      description: json['description'],
      brand: json['brand'],
      model: json['model'],
      color: json['color'],
      category: json['category'],
      discount: json['discount'],
    );
  }

    static List<Product> fromJsonList(List<dynamic> jsonList) {
    return jsonList.map((json) => Product.fromJson(json)).toList();
  }
}
