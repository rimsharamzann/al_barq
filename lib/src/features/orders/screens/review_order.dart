import 'package:al_barq/config/theme_data.dart';
import 'package:al_barq/src/core/components/buttons.dart';
import 'package:al_barq/src/core/components/custom_container.dart';
import 'package:al_barq/src/core/components/layout_widget.dart';
import 'package:al_barq/src/core/constants/my_colors.dart';
import 'package:al_barq/src/features/orders/components/order_items_card.dart';
import 'package:al_barq/src/features/settings/screens/terms_and_services.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import '../../../core/components/dialogs.dart';
import '../../products/models/product_model.dart';
import '../components/order_detail_components.dart';

class ReviewOrderScreen extends StatelessWidget {
  const ReviewOrderScreen({super.key});
  static const routeName = '/review-order';

  @override
  Widget build(BuildContext context) {
    final product = ProductModel(
      name: 'Solar Panel',
      category: 'Energy',
      price: 5678,
      image: '',
      rating: 6,
      description: '',
      id: '#9876543',
    );
    return Scaffold(
      appBar: AppBarWidget(title: 'Review Order'),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: myPadding / 1.5),

        children: [
          DeliveryInformation(),
          SizedBox(height: myPadding / 2),
          OrderItemsCard(productModel: product),
          SizedBox(height: myPadding / 2),
          _instructions(),
          SizedBox(height: myPadding / 2),

          OrderSummary(),
          SizedBox(height: myPadding / 2),
          CustomElevatedButton(
            text: 'Place Order Rs 800',
            onPress: () {
              showDialog(
                context: context,
                builder: (context) => SuccessDialog(
                  title: 'Order placed successfully.',
                  message:
                      'Order ID : 349839284 Go to the orders page and manage your status',
                  routeName: Navbar.routeName,
                ),
              );
            },
          ),
          SizedBox(height: myPadding / 2),
          TermsAndConditions(),

          SizedBox(height: myPadding * 5),
        ],
      ),
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
