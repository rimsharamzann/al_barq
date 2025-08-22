import 'package:al_barq/src/core/components/buttons.dart';
import 'package:al_barq/src/core/components/nav_bar.dart';
import 'package:al_barq/src/core/components/text_feild_with_title.dart';
import 'package:al_barq/src/core/constants/constants.dart';
import 'package:al_barq/src/core/constants/my_colors.dart';
import 'package:al_barq/src/core/extensions/context_extensions.dart';
import 'package:al_barq/src/features/orders/models/order_model.dart'
    show OrderModel;
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import '../../../core/components/dialogs.dart';

class OrderReviewSCreen extends StatefulWidget {
  const OrderReviewSCreen({super.key});
  static const routeName = '/order-review';

  @override
  State<OrderReviewSCreen> createState() => _OrderReviewSCreenState();
}

class _OrderReviewSCreenState extends State<OrderReviewSCreen> {
  double _productRating = 0;
  double _packingQuality = 0;
  double _deliveryRating = 0;
  final TextEditingController controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final order = ModalRoute.of(context)!.settings.arguments as OrderModel;

    return Scaffold(
      appBar: AppBarWidget(title: 'Order reviews'),
      body: ListView(
        children: [
          Text(
            textAlign: TextAlign.center,
            order.id,
            style: context.textTheme.bodyMedium?.copyWith(color: Colors.grey),
          ),
          SizedBox(height: 8),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.network(
                    //  order.product.image,
                    'https://www.deegesolar.co.uk/wp-content/uploads/2021/10/String_Inverter_FI.jpg',
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
                        order.product.name,
                        // style: context.
                      ),
                      const SizedBox(height: 4),
                      Text(
                        order.product.description,

                        // maxLines: 2,
                        // 'High-efficiency monocrystalline solar panel for residential use with 25-year warranty.',
                        // product.category,
                        style: context.textTheme.bodySmall,
                      ),
                      const SizedBox(height: 4),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Delivered on:  ${order.product.price}',
                            style: context.textTheme.bodyMedium?.copyWith(
                              color: MyColors.primaryColor,
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
          _title('Rate this Product'),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: RatingBar(
              initialRating: _productRating,
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
                  _productRating = rating;
                });
              },
            ),
          ),
          SizedBox(height: 8),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Text(
              "${order.product.rating} out of 5",
              style: context.textTheme.displaySmall?.copyWith(
                color: Colors.grey.shade500,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Text(
              '1- Poor, 5 - excellent',
              style: context.textTheme.displaySmall?.copyWith(
                color: Colors.grey.shade600,
              ),
            ),
          ),

          SizedBox(height: 8),
          Divider(color: Colors.grey.shade400, thickness: 1.5),
          _title('Write Your Reviews'),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: TextFeildWithTitle(
              controller: controller,
              title: null,
              label: 'Title',
            ),
          ),

          Divider(color: Colors.grey.shade400, thickness: 1.5),
          _title('Add Photo'),
          ImageRowWidget(),
          Divider(color: Colors.grey.shade400, thickness: 1.5),
          _rating('Packing Quality', (rating) {
            setState(() {
              _packingQuality = rating;
            });
          }, _packingQuality),
          _rating('Delivery Rating', (rating) {
            setState(() {
              _deliveryRating = rating;
            });
          }, _deliveryRating),
          SizedBox(height: 16),

          SizedBox(height: myPadding * 3),
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.transparent,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: myPadding/2),
          child: CustomElevatedButton(
            text: 'Submit Reviews',
            onPress: () {
              showDialog(
                context: context,
                builder: (context) => ReviewsDialog(),
              );
            },
          ),
        ),
      ),
      extendBody: true,
    );
  }

  Widget _title(String title) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Text(title, style: context.textTheme.displaySmall),
    );
  }

  Widget _rating(
    String title,
    Function(double)? onRating,
    double initialRating,
  ) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: context.textTheme.bodyMedium?.copyWith(
              color: Colors.grey.shade700,
            ),
          ),
          RatingBar(
            initialRating: initialRating,
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
            onRatingUpdate: (rating) => onRating,
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
    return ImagePickerWidget(
      onImagePicked: (file) {
        if (file != null) {}
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
