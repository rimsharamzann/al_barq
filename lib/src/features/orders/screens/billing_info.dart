import 'package:al_barq/config/theme_data.dart';
import 'package:al_barq/src/core/components/nav_bar.dart';
import 'package:al_barq/src/core/extensions/context_extensions.dart';
import 'package:al_barq/src/features/orders/screens/review_order.dart';
import 'package:flutter/material.dart';

import '../../../core/components/buttons.dart';
import '../../../core/components/text_feild_with_title.dart';

class BillingInformation extends StatefulWidget {
  const BillingInformation({super.key});
  static const routeName = '/billing- info';

  @override
  State<BillingInformation> createState() => _BillingInformationState();
}

class _BillingInformationState extends State<BillingInformation> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _cardNumberControlle = TextEditingController();
  final TextEditingController _cardExpiryDate = TextEditingController();
  final TextEditingController _cvvController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(title: 'Billing Information'),
      body: ListView(
        padding: EdgeInsets.symmetric(
          horizontal: myPadding,
          vertical: myPadding / 2,
        ),

        children: [
          _title('Payment Information'),
          SizedBox(height: myPadding / 1.3),
          TextFeildWithTitle(
            title: 'Account Holder Name',
            label: 'enter',
            controller: _nameController,
          ),
          SizedBox(height: myPadding / 2),
          TextFeildWithTitle(
            title: 'Card Number',
            label: 'enter',
            controller: _cardNumberControlle,
          ),
          SizedBox(height: myPadding / 2),
          TextFeildWithTitle(
            title: 'Card Expiry',
            label: 'enter',
            controller: _cardExpiryDate,
          ),
          SizedBox(height: myPadding / 2),
          TextFeildWithTitle(
            title: 'CVV',
            label: 'enter',
            controller: _cvvController,
          ),
          SizedBox(height: myPadding * 4),
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.transparent,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: myPadding/2),
          child: CustomElevatedButton(
            text: 'Next',
            onPress: () {
              Navigator.pushNamed(context, ReviewOrderScreen.routeName);
            },
          ),
        ),
      ),
      extendBody: true,
    );
  }

  Widget _title(String title) {
    return Text(title, style: context.textTheme.bodyLarge);
  }
}
