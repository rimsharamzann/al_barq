import 'package:al_barq/src/core/extensions/context_extensions.dart';
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

class StarRatingInput extends StatelessWidget {
  final int rating;
  final ValueChanged<int> onRatingChanged;
  final int starCount;

  const StarRatingInput({
    super.key,
    this.rating = 0,
    required this.onRatingChanged,
    this.starCount = 5,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: context.width / 2,
      child: Row(
        spacing: 0,
        mainAxisSize: MainAxisSize.min,
        children: List.generate(starCount, (index) {
          return IconButton(
            padding: EdgeInsets.zero,
            icon: Icon(
              index < rating ? Icons.star : Icons.star_border,
              color: Colors.amber,
              size: 20,
            ),
            onPressed: () => onRatingChanged(index + 1),
          );
        }),
      ),
    );
  }
}
