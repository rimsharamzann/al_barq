import 'package:al_barq/src/core/components/buttons.dart';
import 'package:al_barq/src/core/components/layout_widget.dart';
import 'package:al_barq/src/core/constants/constants.dart';
import 'package:al_barq/src/core/constants/my_colors.dart';
import 'package:al_barq/src/features/products/models/product_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import '../../../core/constants/assets_strings.dart';

class OrderReviewSCreen extends StatefulWidget {
  const OrderReviewSCreen({super.key});
     static const routeName = '/order-review';


  @override
  State<OrderReviewSCreen> createState() => _OrderReviewSCreenState();
}

class _OrderReviewSCreenState extends State<OrderReviewSCreen> {
  final product = ProductModel(
    title: 'Solar Panel',
    category: 'Energy',
    price: 'June 24, 2025',
    image: '',
    rating: 4,
    //  decription:'High-efficiency monocrystalline solar panel for residential use with 25-year warranty.',
    id: '#9876543',
  );
  final TextEditingController controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return LayoutWidget(
      padding: EdgeInsets.all(0),
      title: 'Order reviews',
      body: ListView(
        children: [
          Text(
            textAlign: TextAlign.center,
            'Order ID: 47754478',
            style: TextStyle(
              color: Colors.grey,
              fontSize: 16,
              fontWeight: FontWeight.w400,
            ),
          ),
          SizedBox(height: 8),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.asset(
                    AssetString.inverter,
                    fit: BoxFit.cover,
                    height: 90,
                    width: 90,
                  ),
                ),
                const SizedBox(width: 10),

                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        product.title,
                        style: const TextStyle(
                          color: Colors.black87,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        // maxLines: 2,
                        // TODO Decriptiom m
                        'High-efficiency monocrystalline solar panel for residential use with 25-year warranty.',
                        // product.category,
                        style: TextStyle(
                          color: Colors.grey.shade700,
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Delivered on:  ${product.price}',
                            style: const TextStyle(
                              color: MyColors.primaryColor,
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 8),
          Divider(color: Colors.grey.shade400, thickness: 1.5),
          Padding(
            padding: const EdgeInsets.all(10),
            child: Text(
              'Rate this Product',
              style: TextStyle(
                color: Colors.black87,
                fontSize: 16,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: RatingBar(
              initialRating: _userRating,
              minRating: 1,
              direction: Axis.horizontal,
              allowHalfRating: true,
              itemCount: 5,
              itemSize: 28,
              ratingWidget: RatingWidget(
                full: const Icon(Icons.star, color: Colors.amber),
                half: const Icon(Icons.star_half, color: Colors.amber),
                empty: const Icon(Icons.star_border, color: Colors.amber),
              ),
              onRatingUpdate: (rating) {
                setState(() {
                  _userRating = rating;
                });
              },
            ),
          ),
          SizedBox(height: 8),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Text(
              "${product.rating} out of 5",
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 14,
                color: Colors.grey.shade600,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Text(
              '1- Poor, 5 - excellent',
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 14,
                color: Colors.grey.shade600,
              ),
            ),
          ),

          SizedBox(height: 8),
          Divider(color: Colors.grey.shade400, thickness: 1.5),
          Padding(
            padding: const EdgeInsets.all(10),
            child: Text(
              'Write Your Reviews',
              style: TextStyle(
                color: Colors.black87,
                fontSize: 16,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: TextField(
              maxLines: 4,
              controller: controller,
              style: TextStyle(color: Colors.black87, fontSize: 14),
              cursorColor: Colors.black87,
              decoration: Constants.inputDecoration(
                'Tell us about quality, delivery and packaging.....',
                Text('0/50', style: TextStyle(color: Colors.grey.shade700)),
                Colors.grey.shade300,
                null,
              ),
            ),
          ),

          Divider(color: Colors.grey.shade400, thickness: 1.5),
          Padding(
            padding: const EdgeInsets.all(10),
            child: Text(
              'Add Photo',
              style: TextStyle(
                color: Colors.black87,
                fontSize: 16,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          ImageRowWidget(),
          Divider(color: Colors.grey.shade400, thickness: 1.5),
          _rating('Packing Quality'),
          _rating('Delivery Rating'),
          SizedBox(height: 16),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: CustomElevatedButton(text: 'Submit Reviews', onPress: () {}),
          ),
          SizedBox(height: 150),
        ],
      ),
    );
  }

  double _userRating = 0;

  Widget _rating(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: TextStyle(
              color: Colors.grey.shade700,
              fontSize: 16,
              fontWeight: FontWeight.w700,
            ),
          ),
          RatingBar(
            initialRating: _userRating,
            minRating: 1,
            direction: Axis.horizontal,
            allowHalfRating: true,
            itemCount: 5,
            itemSize: 28,
            ratingWidget: RatingWidget(
              full: const Icon(Icons.star, color: Colors.amber),
              half: const Icon(Icons.star_half, color: Colors.amber),
              empty: const Icon(Icons.star_border, color: Colors.amber),
            ),
            onRatingUpdate: (rating) {
              setState(() {
                _userRating = rating;
              });
            },
          ),
        ],
      ),
    );
  }
}

class ImageRowWidget extends StatefulWidget {
  const ImageRowWidget({super.key});

  @override
  State<ImageRowWidget> createState() => _ImageRowWidgetState();
}

class _ImageRowWidgetState extends State<ImageRowWidget> {
  final List<String> _images = [];

  Widget _addImage() {
    return GestureDetector(
      onTap: () {
        setState(() {
          _images.add(AssetString.solar1);
        });
      },
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 10),
        height: 80,
        width: 80,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(14),
          color: Colors.grey.shade300,
        ),
        child: Icon(Icons.add, color: Colors.grey.shade700),
      ),
    );
  }

  Widget _imageItem(String imageUrl) {
    return Container(
      height: 80,
      width: 80,
      margin: const EdgeInsets.only(left: 8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(14),
        image: DecorationImage(
          image: NetworkImage(imageUrl),
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [_addImage(), ..._images.map((img) => _imageItem(img))],
    );
  }
}
