import 'package:al_barq/config/theme_data.dart';
import 'package:al_barq/src/core/components/buttons.dart';
import 'package:al_barq/src/core/components/general_container.dart';
import 'package:al_barq/src/core/components/nav_bar.dart';
import 'package:al_barq/src/core/constants/my_colors.dart';
import 'package:al_barq/src/core/extensions/context_extensions.dart';
import 'package:al_barq/src/features/orders/components/order_items_card.dart';
import 'package:al_barq/src/features/settings/screens/terms_and_services.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import '../../../core/components/dialogs.dart';
import '../../products/models/product_model.dart';
import '../components/order_detail_components.dart';

class ReviewOrderScreen extends StatefulWidget {
  const ReviewOrderScreen({super.key});
  static const routeName = '/review-order';

  @override
  State<ReviewOrderScreen> createState() => _ReviewOrderScreenState();
}

class _ReviewOrderScreenState extends State<ReviewOrderScreen> {
  @override
  Widget build(BuildContext context) {
    final List<ProductModel> orderItems = [
      ProductModel(
        id: '#7654321',
        name: 'Smart Inverter',
        category: 'Home Appliance',
        price: 15000,

        image:
            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQVQR3IO2qc94kPhg_29KSAyd5wBfZmHxn49A&s',
        rating: 5,
        description: 'WiFi enabled smart inverter with backup support.',
      ),
    ];

    return Scaffold(
      appBar: AppBarWidget(title: 'Review Order'),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: myPadding / 1.5),

        children: [
          DeliveryInformation(),
          SizedBox(height: myPadding / 2),
          SizedBox(
            height: context.height / 3.7,
            child: ListView.builder(
              itemCount: orderItems.length,
              itemBuilder: (context, index) {
                // final product = orderItems[index];
                return OrderItemsCard(products: orderItems);
              },
            ),
          ),
          // OrderItemsCard(productModel: product),
          SizedBox(height: myPadding / 2),
          _instructions(),
          SizedBox(height: myPadding / 2),

          OrderSummary(),
          SizedBox(height: myPadding / 2),

          TermsAndConditions(),

          SizedBox(height: myPadding * 5),
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.transparent,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: myPadding),
          child: CustomElevatedButton(
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
        ),
      ),
      extendBody: true,
    );
  }

  Widget _instructions() {
    return GeneralContainer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Special Instructions',
            style: context.textTheme.bodyLarge?.copyWith(
              fontWeight: FontWeight.w600,
            ),
          ),
          SizedBox(height: 10),
          Text(
            'Please ring the doorbell twice and leave at the door. Thank You.',
            style: context.textTheme.bodyMedium?.copyWith(
              color: Colors.black87.withValues(alpha: 0.8),
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
          style: context.textTheme.bodyMedium?.copyWith(
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
