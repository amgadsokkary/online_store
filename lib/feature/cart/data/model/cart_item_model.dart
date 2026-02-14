class CartItemModel {
  final String id;
  final int productId;
  final String name;
  final num price;
  final String image;
  final int aVariableQuantity;
  final int cartQuantity;

  CartItemModel({
    required this.id,
    required this.name,
    required this.price,
    required this.productId,
    required this.image,
    required this.aVariableQuantity,
    required this.cartQuantity,
  });

  factory CartItemModel.fromJson(Map<String, dynamic> json) {
    final product = json['products'];

    return CartItemModel(
      id: json['id'].toString(),
      productId: product['id'],
      name: product['name'],
      price: product['price'].toDouble(),
      image: product['image'],
      aVariableQuantity: product['quantity'],
      cartQuantity: json['quantity'],
    );
  }

  CartItemModel copyWith({int? cartQuantity}) {
    return CartItemModel(
      id: id,
      productId: productId,
      name: name,
      price: price,
      image: image,
      aVariableQuantity: aVariableQuantity,
      cartQuantity: cartQuantity ?? this.cartQuantity,
    );
  }
}
