class Product {
  final String id;
  final String name;
  final double price;
  final double stock;
  final double rating;
  final String image;
  final String category;
  final String description;

  Product({
    required this.id,
    required this.name,
    required this.price,
    required this.stock,
    required this.rating,
    required this.image,
    required this.category,
    required this.description,
  });

  factory Product.fromJson(Map<String, dynamic> json) => Product(
        id: json['_id'],
        name: json['name'],
        price: (json['price'] as num).toDouble(),
        stock: (json['stock'] as num).toDouble(),
        rating: (json['rating'] as num).toDouble(),
        image: json['image'],
        category: json['category'],
        description: json['description'],
      );
}
