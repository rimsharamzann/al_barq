import 'dart:convert';

import 'package:al_barq/src/core/enums/enum_methods.dart';
import 'package:al_barq/src/features/orders/enums/order_status.dart';
import 'package:al_barq/src/features/products/models/product_model.dart';

class OrderModel {
  final String id;
  final double price;
  final ProductModel product;
  final OrderStatus status;
  final DateTime date;
  final int quantity;

  OrderModel({
    required this.id,
    required this.price,
    required this.product,
    required this.status,
    required this.date,
    required this.quantity,
  });

  OrderModel copyWith({
    String? id,

    double? price,
    ProductModel? product,
    OrderStatus? status,
    DateTime? date,
    int? quantity,
  }) {
    return OrderModel(
      id: id ?? this.id,

      price: price ?? this.price,
      product: product ?? this.product,
      status: status ?? this.status,
      date: date ?? this.date,
      quantity: quantity ?? this.quantity,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,

      'price': price,
      'product': product.toMap(),
      'status': enumToString(status),
      'date': date.millisecondsSinceEpoch,
      'quantity': quantity,
    };
  }

  factory OrderModel.fromMap(Map<String, dynamic> map) {
    return OrderModel(
      id: map['id'] ?? '',

      price: (map['price'] ?? 0).toDouble(),
      product: ProductModel.fromMap(map['product']),
      status:
          enumFromString(map['status'], OrderStatus.values) ?? OrderStatus.all,
      date: DateTime.fromMillisecondsSinceEpoch(map['date']),
      quantity: map['quantity'] ?? 0,
    );
  }

  String toJson() => json.encode(toMap());

  factory OrderModel.fromJson(String source) =>
      OrderModel.fromMap(json.decode(source));
  static List<ProductModel> productData = ProductModel.productsDummyData;

  static List<OrderModel> orderData = ProductModel.productsDummyData
      .map(
        (p) => OrderModel(
          id: '#${DateTime.now().millisecondsSinceEpoch}',
          price: p.price,
          product: p,
          status: OrderStatus.confirmed,
          date: DateTime.now(),
          quantity: 2,
        ),
      )
      .toList();
}
