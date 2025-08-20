import 'package:al_barq/src/core/components/buttons.dart';
import 'package:al_barq/src/core/components/custom_container.dart';
import 'package:al_barq/src/core/components/layout_widget.dart';
import 'package:al_barq/src/core/constants/my_colors.dart';
import 'package:al_barq/src/features/landing_page/components/dialogs.dart';
import 'package:al_barq/src/features/orders/components/order_items_card.dart';
import 'package:al_barq/src/features/orders/screens/order_review.dart';
import 'package:al_barq/src/features/settings/screens/terms-and_services.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import '../../products/models/product_model.dart';
import '../components/order_detail_components.dart';

class ReviewOrderScreen extends StatelessWidget {
  const ReviewOrderScreen({super.key});
  static const routeName = '/review-order';

  @override
  Widget build(BuildContext context) {
    final product = ProductModel(
      title: 'Solar Panel',
      category: 'Energy',
      price: '25000',
      image: '',
      rating: 6,
      id: '#9876543',
    );
    return LayoutWidget(
      title: 'Review Order',
      body: ListView(
        children: [
          DeliveryInformation(),
          SizedBox(height: 10),
          OrderItemsCard(productModel: product),
          SizedBox(height: 10),
          _instructions(),
          SizedBox(height: 10),

          OrderSummary(),
          SizedBox(height: 10),
          CustomElevatedButton(
            text: 'Place Order Rs 800',
            onPress: () {
              Navigator.pushNamed(context, OrderReviewSCreen.routeName);
              // showSuccessDialog(
              //   context,
              //   'Order placed successfully.',
              //   'Order ID : 349839284 Go to the orders page and manage your status',
              // );
            },
          ),
          SizedBox(height: 10),
          TermsAndConditions(),

          SizedBox(height: 100),
        ],
      ),
    );
  }

  void showSuccessDialog(BuildContext context, String title, String message) {
    showDialog(
      context: context,
      builder: (context) => SuccessDialog(title: title, message: message),
    );
  }

  Widget _instructions() {
    return CustomContainer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Special Instructions',
            style: TextStyle(
              color: Colors.black87,
              fontSize: 18,
              fontWeight: FontWeight.w600,
            ),
          ),
          SizedBox(height: 10),
          Text(
            'Please ring the doorbell twice and leave at the door. Thank You.',
            style: TextStyle(
              color: Colors.black87.withValues(alpha: 0.8),
              fontSize: 14,
              fontWeight: FontWeight.w300,
            ),
          ),
        ],
      ),
    );
  }
}

class TermsAndConditions extends StatelessWidget {
  const TermsAndConditions({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      child: Text.rich(
        textAlign: TextAlign.center,
        TextSpan(
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w400,
            color: Colors.grey.shade600,
          ),
          children: [
            TextSpan(text: 'By placing this order, you agree to our '),
            TextSpan(
              text: 'Terms & Conditions',
              style: TextStyle(color: MyColors.primaryColor),
              recognizer: TapGestureRecognizer()
                ..onTap = () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const TermsAndServiceScreen(),
                    ),
                  );
                },
            ),
          ],
        ),
      ),
    );
  }
}
