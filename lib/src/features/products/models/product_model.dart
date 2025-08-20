class ProductModel {
  final String id;
  final String category;
  final String title;
  final String image;
  final double rating;
  final String price;
  int? quantity;

  ProductModel({
    required this.id,
    required this.category,
    required this.title,
    required this.image,
    required this.rating,
    required this.price,
    this.quantity,
  });
}
