// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class OrderModel {
  final String id;
  final String productName;
  final String category;
  final String image;
  final double price;
  int quantity;
  OrderModel({
    required this.id,
    required this.productName,
    required this.category,
    required this.image,
    required this.price,
    required this.quantity,
  });

  OrderModel copyWith({
    String? id,
    String? productName,
    String? category,
    String? image,
    double? price,
    int? quantity,
  }) {
    return OrderModel(
      id: id ?? this.id,
      productName: productName ?? this.productName,
      category: category ?? this.category,
      image: image ?? this.image,
      price: price ?? this.price,
      quantity: quantity ?? this.quantity,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'productName': productName,
      'category': category,
      'image': image,
      'price': price,
      'quantity': quantity,
    };
  }

  factory OrderModel.fromMap(Map<String, dynamic> map) {
    return OrderModel(
      id: map['id'] as String,
      productName: map['productName'] as String,
      category: map['category'] as String,
      image: map['image'] as String,
      price: map['price'] as double,
      quantity: map['quantity'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory OrderModel.fromJson(String source) =>
      OrderModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
