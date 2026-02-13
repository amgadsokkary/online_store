class ProductModel {
  final int id;
  final DateTime createdAt;
  final String name;
  final String image;
  final String category;
  final num price;
  final String size;
  final int quantity;
  final String detail;
  final int review;

  ProductModel({
    required this.name,
    required this.image,
    required this.price,
    required this.id,
    required this.category,
    required this.size,
    required this.quantity,
    required this.detail,
    required this.review,
    required this.createdAt,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      id: json['id'],
      createdAt: DateTime.parse(json['created_at']),
      name: json['name'],
      image: json['image'],
      category: json['category'] ?? "",
      price: (json['price']).toDouble(),
      size: json['size'] ?? "",
      quantity: json['quantity'] ?? 0,
      detail: json['detail'] ?? "",
      review: json['review'] ?? 0,
    );
  }
}
