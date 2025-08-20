// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class OrderReviewModel {
  final String orderId;
  final String productId;
  final String reviewText;
  final double productRating;
  final double packingQuality;
  final double deliveryRating;
  final List<String> images;
  final DateTime reviewDate;
  OrderReviewModel({
    required this.orderId,
    required this.productId,
    required this.reviewText,
    required this.productRating,
    required this.packingQuality,
    required this.deliveryRating,
    required this.images,
    required this.reviewDate,
  });

  OrderReviewModel copyWith({
    String? orderId,
    String? productId,
    String? reviewText,
    double? productRating,
    double? packingQuality,
    double? deliveryRating,
    List<String>? images,
    DateTime? reviewDate,
  }) {
    return OrderReviewModel(
      orderId: orderId ?? this.orderId,
      productId: productId ?? this.productId,
      reviewText: reviewText ?? this.reviewText,
      productRating: productRating ?? this.productRating,
      packingQuality: packingQuality ?? this.packingQuality,
      deliveryRating: deliveryRating ?? this.deliveryRating,
      images: images ?? this.images,
      reviewDate: reviewDate ?? this.reviewDate,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'orderId': orderId,
      'productId': productId,
      'reviewText': reviewText,
      'productRating': productRating,
      'packingQuality': packingQuality,
      'deliveryRating': deliveryRating,
      'images': images,
      'reviewDate': reviewDate.millisecondsSinceEpoch,
    };
  }

  factory OrderReviewModel.fromMap(Map<String, dynamic> map) {
    return OrderReviewModel(
      orderId: map['orderId'] as String,
      productId: map['productId'] as String,
      reviewText: map['reviewText'] as String,
      productRating: map['productRating'] as double,
      packingQuality: map['packingQuality'] as double,
      deliveryRating: map['deliveryRating'] as double,
      images: List<String>.from((map['images'] as List<String>)),
      // reviewDate: DateTime.now(),
      reviewDate: DateTime.fromMillisecondsSinceEpoch(map['reviewDate'] as int),
    );
  }

  String toJson() => json.encode(toMap());

  factory OrderReviewModel.fromJson(String source) =>
      OrderReviewModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
