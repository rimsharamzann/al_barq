import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class StarRating extends StatelessWidget {
  final double rating;
  final double size;

  const StarRating({super.key, required this.rating, this.size = 16});

  @override
  Widget build(BuildContext context) {
    return RatingBarIndicator(
      rating: rating,
      itemBuilder: (context, index) => Icon(Icons.star, color: Colors.amber),
      itemCount: 5,
      itemSize: size,
      unratedColor: Colors.grey.shade300,
      direction: Axis.horizontal,
    );
  }
}
