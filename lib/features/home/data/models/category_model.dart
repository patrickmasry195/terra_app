class Category {
  final String name;
  final String imageUrl;
  final bool isProduct;
  final double? price;

  Category({
    required this.name,
    required this.imageUrl,
    this.isProduct = false,
    this.price,
  });

  factory Category.fromJson(Map<String, dynamic> json) {
    return Category(
      name: json['name'],
      imageUrl: json['imageUrl'],
      isProduct: json['isProduct'] ?? false,
      price: json['price'],
    );
  }
}
