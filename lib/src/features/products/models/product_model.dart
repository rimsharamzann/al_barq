// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:al_barq/src/core/constants/network_images.dart';

class ProductModel {
  final String id;
  final String name;
  final String description;
  final String category;
  final String image;
  final double rating;
  final double price;
  int? quantity;
  ProductModel({
    required this.id,
    required this.name,
    required this.description,
    required this.category,
    required this.image,
    required this.rating,
    required this.price,
    this.quantity,
  });

  ProductModel copyWith({
    String? id,
    String? name,
    String? description,
    String? category,
    String? image,
    double? rating,
    double? price,
    int? quantity,
  }) {
    return ProductModel(
      id: id ?? this.id,
      name: name ?? this.name,
      description: description ?? this.description,
      category: category ?? this.category,
      image: image ?? this.image,
      rating: rating ?? this.rating,
      price: price ?? this.price,
      quantity: quantity ?? this.quantity,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'description': description,
      'category': category,
      'image': image,
      'rating': rating,
      'price': price,
      'quantity': quantity,
    };
  }

  factory ProductModel.fromMap(Map<String, dynamic> map) {
    return ProductModel(
      id: map['id'] as String,
      name: map['name'] as String,
      description: map['description'] as String,
      category: map['category'] as String,
      image: map['image'] as String,
      rating: map['rating'] as double,
      price: map['price'] as double,
      quantity: map['quantity'] != null ? map['quantity'] as int : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory ProductModel.fromJson(String source) =>
      ProductModel.fromMap(json.decode(source) as Map<String, dynamic>);

  static final List<ProductModel> productsDummyData = [
    ProductModel(
      name: "Solar inverter 200W",
      price: 456789,
      rating: 4.5,
      image: NetworkImages.productBanner2,
      id: "productId123",
      description:
          'High-efficiency monocrystalline solar panel for residential use with 25-year warranty.',

      category: 'PANEL',
      quantity: 4,
    ),
ProductModel(
      id: "productId123",
      name: "Solar Panel",
      description: "High efficiency solar panel",
      price: 8000,
      image:
          'https://www.deegesolar.co.uk/wp-content/uploads/2021/10/String_Inverter_FI.jpg',
      category: 'PANEL',
      rating: 4.5,
      quantity: 4,
    ),
    ProductModel(
      name: "Solar inverter 200W",
      price: 456789,
      rating: 4.5,
      image: NetworkImages.inverter,
      id: "productId123",
      description:
          'High-efficiency monocrystalline solar panel for residential use with 25-year warranty.',

      category: 'PANEL',
      quantity: 4,
    ),
    ProductModel(
      name: "Solar inverter 200W",
      price: 456789,
      rating: 4.5,
      image: NetworkImages.solarInverter,

      id: "productId123",
      description:
          'High-efficiency monocrystalline solar panel for residential use with 25-year warranty.',

      category: 'PANEL',
      quantity: 4,
    ),
  ];
}
